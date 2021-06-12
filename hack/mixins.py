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


def manage_mixin(mixin_directory, mixin):
    logger.info("Manage %s", mixin)

    mixin_header = "%s/%s.tpl" % (os.path.dirname(__file__), mixin)
    if not os.path.exists(mixin_header):
        logger.warning("Header not found: %s", mixin_header)
        return

    chart_dst = "charts/%s/templates" % mixin
    if not os.path.exists(chart_dst):
        logger.warning("Mixin chart not found: %s", chart_dst)
        return

    files = glob.glob("%s/%s/prometheus/*.yaml" % (mixin_directory, mixin))
    for f in files:
        orig = "%s" % f
        dest = "%s/%s" % (chart_dst, path.basename(orig))
        if os.path.exists(dest):
            os.remove(dest)
        logger.info("Copy %s %s", orig, dest)

        fin = open(orig, "rt")
        # fout = open(dest, "w")
        # for line in fin:
        #     fout.write(escape(line))

        with open(dest, "w") as file:
            header = fileinput.input(mixin_header)
            file.writelines(header)
            # input_lines = fileinput.input(orig)
            # file.writelines(input_lines)
            for line in fin:
                file.write(escape(line))


def main(url, filename, mixin_directory, chart):
    # download(url, filename)
    with zipfile.ZipFile(filename, "r") as zf:
        zf.extractall()
        logger.info("Monitoring mixins")
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
