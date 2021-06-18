#!/usr/bin/env python3

# Copyright (C) 2020-2021 Nicolas Lamirault <nicolas.lamirault@gmail.com>

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import argparse
import fileinput
import glob
import logging
import os
from os import path
import shutil
import zipfile

import coloredlogs
import requests

MIXINS_VERSION = "v0.6.0"
MIXIN_ARCHIVE = "monitoring-mixins-%s.zip" % MIXINS_VERSION
MIXIN_URL = (
    "https://github.com/nlamirault/monitoring-mixins/releases/download/%s/%s"
    % (MIXINS_VERSION, MIXIN_ARCHIVE)
)
MIXIN_DIRECTORY = "monitoring-mixins"


logger = logging.getLogger(__name__)


def escape(s):
    return (
        s.replace("{{", "{{`{{")
        .replace("}}", "}}`}}")
        .replace("{{`{{", "{{`{{`}}")
        .replace("}}`}}", "{{`}}`}}")
    )


def download(url, filename):
    logger.info("Download Mixin : %s", url)
    r = requests.get(url)
    with open(filename, "wb") as f:
        f.write(r.content)


def template(f, chart_dst, mixin_header):
    orig = "%s" % f
    filename = path.basename(orig)

    dest = "%s/%s" % (chart_dst, filename)
    if os.path.exists(dest):
        os.remove(dest)
    logger.info("Copy %s %s", orig, dest)

    with open(dest, "w") as file:
        header = open(mixin_header, "rt")
        for line in header:
            file.write(line.replace("__name__", filename.replace(".yaml", "")))

        fin = open(orig, "rt")
        for line in fin:
            file.write("  %s" % escape(line))


def template_configmap(f, chart_dst, mixin_header):
    orig = "%s" % f
    filename = path.basename(orig)

    dashboard = "%s/dashboards/%s" % (chart_dst, filename)
    if os.path.exists(dashboard):
        os.remove(dashboard)
    logger.info("Copy %s => %s", orig, dashboard)
    shutil.copy(orig, dashboard)

    dest = "%s/templates/configmap-%s" % (chart_dst, filename.replace(".json", ".yaml"))
    if os.path.exists(dest):
        os.remove(dest)
    logger.info("Manage %s => %s", orig, dest)

    with open(dest, "w") as file:
        header = open(mixin_header, "rt")
        for line in header:
            file.write(
                line.replace(
                    "__name__", filename.replace(".json", "").replace("_", "-")
                )
            )
        file.write("  %s: |-\n" % filename)
        file.write('{{ .Files.Get "dashboards/%s" | indent 4}}' % filename)


def manage_mixin(mixin_directory, mixin):
    logger.info("Manage %s", mixin)

    chart_dst = "charts/%s" % mixin
    if not os.path.exists(chart_dst):
        logger.warning("Mixin chart not found: %s", chart_dst)
        return

    prom_header = "%s/%s.tpl" % (os.path.dirname(__file__), mixin)
    if not os.path.exists(prom_header):
        logger.warning("Header for PrometheusRule not found: %s", prom_header)
        return
    for f in glob.glob("%s/%s/prometheus/*.yaml" % (mixin_directory, mixin)):
        template(f, "%s/templates" % chart_dst, prom_header)

    dashboard_header = "%s/%s_dashboard.tpl" % (os.path.dirname(__file__), mixin)
    if not os.path.exists(dashboard_header):
        logger.warning("Header for dashboards not found: %s", dashboard_header)
        return
    for f in glob.glob("%s/%s/dashboards/*.json" % (mixin_directory, mixin)):
        template_configmap(f, chart_dst, dashboard_header)


def main(url, filename, mixin_directory, chart):
    # download(url, filename)
    with zipfile.ZipFile(filename, "r") as zf:
        zf.extractall()
        logger.info("Extract monitoring mixins")
        for mixin in os.listdir(path=mixin_directory):
            if mixin == chart:
                manage_mixin(mixin_directory, mixin)
            else:
                logger.debug("Not mixin: %s", mixin)
        # os.remove(filename)
        # shutil.rmtree(mixin_directory)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(prefix_chars="-")
    parser.add_argument("chart", type=str, help="Chart to update")
    parser.add_argument("--log", type=str, default="info", help="Log level")
    args = parser.parse_args()
    coloredlogs.install(level=args.log)
    main(MIXIN_URL, MIXIN_ARCHIVE, MIXIN_DIRECTORY, args.chart)
