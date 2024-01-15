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
import logging
import os
from os import path
import re

import shutil
import zipfile

import coloredlogs
import semver
import requests

POLICIES_REPO = "https://github.com/portefaix/portefaix-policies"

logger = logging.getLogger(__name__)


def manage_kyverno_policies(policies_dir, chart):
    dest = "charts/%s/templates" % chart
    policy_header = "%s/policies/policy_kyverno.tpl" % path.dirname(__file__)
    spec = re.compile("^spec:")
    policy_name = re.compile("^  name:")
    validationFailureAction = re.compile(".*validationFailureAction.*")
    for policy in os.listdir(path=policies_dir):
        # logger.debug("Policy directory: %s", policy)
        for policy in glob.glob("%s/%s/policy-*.yaml" % (policies_dir, policy)):
            logger.info("Policy definition: %s", policy)
            # shutil.copy(policy, dest)
            output_file = path.basename(policy)
            logger.debug("Copy %s to %s", output_file, dest)
            if path.exists(output_file):
                os.remove(output_file)

            with open("%s/%s" % (dest, output_file), "w") as file:
                fin = open(policy, "rt")
                for line in fin:
                    if spec.match(line):
                        header = open(policy_header, "rt")
                        for lineh in header:
                            file.write(lineh)
                        file.write("spec:\n")
                    elif validationFailureAction.match(line):
                        file.write(
                            "  validationFailureAction: {{ .Values.validationFailureAction }}\n"
                        )
                    elif policy_name.match(line):
                        file.write(line.lower())
                    else:
                        file.write(line)

def manage_chart(chart, policies_version):
    chart_file = "charts/%s/Chart.yaml" % chart
    logger.debug("Chart to update: %s", chart_file)
    infile = open(chart_file, 'r')
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

    if current_version and next_version and policies_version:
        logger.info("Next version: %s", next_version.finalize_version())
        with open(chart_file) as file:
            contents = file.read()
            new_chart_contents = contents.replace(current_version, "version: %s\n" % next_version)
            if app_version:
                new_chart_contents = new_chart_contents.replace(app_version, "appVersion: %s\n" % policies_version)
        with open(chart_file, "w") as file:
            file.write(new_chart_contents)
        new_contents = open(chart_file, 'r')
        lines = new_contents.readlines()[:-2]
        lines.append("    - kind: changed\n")
        lines.append("      description: Bump Portefaix policies to %s\n" % policies_version)
        new_contents.close()
        outfile = open(chart_file, 'w')
        outfile.writelines(lines)
        outfile.close()

def download(url, filename):
    logger.info("Download Policies : %s", url)
    r = requests.get(url)
    with open(filename, "wb") as f:
        f.write(r.content)


def main(url, filename, directory, chart, release):
    download(url, filename)
    with zipfile.ZipFile(filename, "r") as zf:
        logger.info("Extract policies")
        zf.extractall()
        manage_kyverno_policies("%s/kyverno" % directory, chart)
        os.remove(filename)
        shutil.rmtree(directory)
    manage_chart(chart, release)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(prefix_chars="-")
    parser.add_argument("chart", type=str, help="Chart to update")
    parser.add_argument("--release", type=str, help="Release of policies")
    parser.add_argument("--log", type=str, default="info", help="Log level")
    args = parser.parse_args()
    coloredlogs.install(level=args.log)
    policies_archive = "portefaix-policies-%s.zip" % args.release
    policies_url = "%s/archive/refs/tags/%s.zip" % (POLICIES_REPO, args.release)
    policies_directory = "portefaix-policies-%s" % args.release.replace('v', '')
    main(policies_url, policies_archive, policies_directory, args.chart, args.release)
