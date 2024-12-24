#!/usr/bin/env python3

# Copyright (C) Nicolas Lamirault <nicolas.lamirault@gmail.com>
#
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
#
# SPDX-License-Identifier: Apache-2.0

import argparse
import glob
import json
import logging
import os
import pathlib
import re
import shutil
import zipfile
from os import path

import coloredlogs
import requests
import semver

MIXIN_REPOSITORY = "https://github.com/nlamirault/monitoring-mixins"

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


def template(f, mixin, chart_dst, mixin_header):
    orig = "%s" % f
    filename = path.basename(orig)

    dest = "%s/%s" % (chart_dst, filename)
    if os.path.exists(dest):
        os.remove(dest)
    logger.info("Copy %s %s", orig, dest)

    with open(dest, "w") as file:
        header = open(mixin_header, "rt")
        for line in header:
            file.write(
                line.replace("__name__", filename.replace(".yaml", "")).replace("__mixin__", mixin)
            )

        fin = open(orig, "rt")
        for line in fin:
            file.write("  %s" % escape(line))
        file.write("{{- end }}\n")


def update_dashboards_tags(orig, dashboard, new_tags):
    logger.info("Update dashboard: %s %s", orig, dashboard)
    with open(orig, "r") as fh:
        json_data = json.load(fh)
        json_data["tags"] = json_data["tags"] + new_tags
        logger.debug("Dashboard tags: %s", json_data["tags"])
        with open(dashboard, "w") as fh:
            json.dump(json_data, fh, indent=4)


def manage_dashboards(f, mixin, chart_dst):
    orig = "%s" % f
    filename = path.basename(orig)

    dashboard = "%s/dashboards/%s" % (chart_dst, filename)
    pathlib.Path("%s/dashboards" % chart_dst).mkdir(parents=True, exist_ok=True)
    if os.path.exists(dashboard):
        os.remove(dashboard)
    if mixin == "alertmanager-mixin":
        update_dashboards_tags(orig, dashboard, ["portefaix"])
    elif mixin == "fluxcd-mixin":
        update_dashboards_tags(orig, dashboard, ["fluxcd", "fluxcd-mixin", "gitops", "portefaix"])
    elif mixin == "grafana-mixin":
        update_dashboards_tags(orig, dashboard, ["grafana", "grafana-mixin", "portefaix"])
    elif mixin == "linkerd-edge-mixin":
        update_dashboards_tags(
            orig,
            dashboard,
            ["linkerd", "linkerd-edge-mixin", "service-mesh", "portefaix"],
        )
    elif mixin == "linkerd-stable-mixin":
        update_dashboards_tags(
            orig,
            dashboard,
            ["linkerd", "linkerd-stable-mixin", "service-mesh", "portefaix"],
        )
    elif mixin == "loki-mixin":
        update_dashboards_tags(orig, dashboard, ["portefaix"])
    elif mixin == "mimir-mixin":
        update_dashboards_tags(orig, dashboard, ["portefaix"])
    elif mixin == "osm-mixin":
        update_dashboards_tags(orig, dashboard, ["osm", "osm-mixin", "service-mesh", "portefaix"])
    elif mixin == "prometheus-mixin":
        update_dashboards_tags(orig, dashboard, ["portefaix"])
    elif mixin == "promtail-mixin":
        update_dashboards_tags(orig, dashboard, ["portefaix"])
    elif mixin == "thanos-mixin":
        update_dashboards_tags(orig, dashboard, ["portefaix"])
    elif mixin == "alloy-mixin":
        update_dashboards_tags(orig, dashboard, ["portefaix", "opentelemetry", "alloy"])
    elif mixin == "quickwit":
        update_dashboards_tags(orig, dashboard, ["portefaix", "opentelemetry", "quickwit"])
    elif mixin == "beyla":
        update_dashboards_tags(orig, dashboard, ["portefaix", "opentelemetry", "beyla", "ebpf"])
    elif mixin == "cilium-mixin":
        update_dashboards_tags(
            orig, dashboard, ["portefaix", "cilium", "cilium-mixin", "cni", "ebpf"]
        )
    else:
        logger.info("Copy %s => %s", orig, dashboard)
        shutil.copy(orig, dashboard)


def template_configmap(mixin, chart_dst, mixin_header):
    dest = "%s/templates/configmap-dashboards.yaml" % chart_dst
    if os.path.exists(dest):
        os.remove(dest)
    logger.info("Dashboards configmap: %s", dest)
    with open(dest, "w") as file:
        header = open(mixin_header, "rt")
        for line in header:
            file.write(line.replace("__mixin__", mixin).replace("_", "-"))


def update_chart(mixin, mixin_version, chart_dst):
    chart_file = "%s/Chart.yaml" % chart_dst
    logger.debug("Chart to update: %s", chart_file)
    infile = open(chart_file, "r")
    lines = infile.readlines()
    current_version = None
    next_version = None
    app_version = None
    for line in lines:
        if re.match("^version:", line):
            # print(line)
            current_version = line
            data = line.strip().split(": ")
            logger.info("Current version: %s", data[1])
            chart_version = data[1]
            ver = semver.Version.parse(chart_version)
            next_version = ver.bump_minor()
        elif re.match("^appVersion:", line):
            app_version = line
    infile.close()

    if current_version and next_version and mixin_version:
        logger.info("Next version: %s", next_version.finalize_version())
        with open(chart_file) as file:
            contents = file.read()
            new_chart_contents = contents.replace(current_version, "version: %s\n" % next_version)
            if app_version:
                new_chart_contents = new_chart_contents.replace(
                    app_version, "appVersion: %s\n" % mixin_version
                )
        with open(chart_file, "w") as file:
            file.write(new_chart_contents)
        new_contents = open(chart_file, "r")
        lines = new_contents.readlines()[:-2]
        lines.append("    - kind: changed\n")
        lines.append("      description: %s v%s\n" % (mixin, mixin_version))
        new_contents.close()
        outfile = open(chart_file, "w")
        outfile.writelines(lines)
        outfile.close()


def manage_mixin(mixin_directory, mixin):
    logger.info("Manage %s", mixin)

    chart_dst = "charts/%s" % mixin
    if not os.path.exists(chart_dst):
        logger.warning("Mixin chart not found: %s", chart_dst)
        return

    prom_header = "%s/mixins/mixin_prom.tpl" % os.path.dirname(__file__)
    if not os.path.exists(prom_header):
        logger.warning("Header for PrometheusRule not found: %s", prom_header)
        return
    for f in glob.glob("%s/%s/prometheus/*.yaml" % (mixin_directory, mixin)):
        template(f, mixin, "%s/templates" % chart_dst, prom_header)

    dashboard_header = "%s/mixins/mixin_dashboard.tpl" % os.path.dirname(__file__)
    if not os.path.exists(dashboard_header):
        logger.warning("Header for dashboards not found: %s", dashboard_header)
        return
    for f in glob.glob("%s/%s/dashboards/*.json" % (mixin_directory, mixin)):
        manage_dashboards(f, mixin, chart_dst)

    template_configmap(mixin, chart_dst, dashboard_header)

    mixin_version_file = open("%s/%s/.version" % (mixin_directory, mixin), "r")
    lines = mixin_version_file.readlines()
    mixin_version = lines[0].strip()
    update_chart(mixin, mixin_version, chart_dst)


def main(url, filename, chart):
    download(url, filename)
    with zipfile.ZipFile(filename, "r") as zf:
        mixins_directory = pathlib.Path(filename).stem
        logger.info("Extract into: %s", mixins_directory)
        pathlib.Path(mixins_directory).mkdir(parents=True, exist_ok=True)
        zf.extractall(path=mixins_directory)
        logger.info("Extract monitoring mixins")

    for mixin in os.listdir(path=mixins_directory):
        if mixin == chart:
            manage_mixin(mixins_directory, mixin)
        else:
            logger.debug("Not mixin: %s", mixin)
    # os.remove(filename)
    # shutil.rmtree(mixins_directory)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(prefix_chars="-")
    parser.add_argument("chart", type=str, help="Chart to update")
    parser.add_argument("--release", type=str, help="Release of monitoring mixins")
    parser.add_argument("--log", type=str, default="info", help="Log level")
    args = parser.parse_args()
    coloredlogs.install(level=args.log)
    # archive = mixin_archive % args.mixins
    # main(mixin_url % (args.mixins, archive), archive, args.chart)
    mixin_archive = "monitoring-mixins-%s.zip" % args.release
    mixin_url = "%s/releases/download/%s/%s" % (
        MIXIN_REPOSITORY,
        args.release,
        mixin_archive,
    )
    main(mixin_url, mixin_archive, args.chart)
