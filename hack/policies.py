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
import glob
import logging
import os
from os import path
import re

# import shutil
import zipfile

import coloredlogs
import requests


POLICIES_VERSION = "0.6.0"
POLICIES_ARCHIVE = "portefaix-policies-v%s.zip" % POLICIES_VERSION
POLICIES_URL = (
    "https://github.com/portefaix/portefaix-policies/archive/refs/tags/v%s.zip"
    % POLICIES_VERSION
)
POLICIES_DIRECTORY = "portefaix-policies-%s" % POLICIES_VERSION


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


def download(url, filename):
    logger.info("Download Policies : %s", url)
    r = requests.get(url)
    with open(filename, "wb") as f:
        f.write(r.content)


def main(url, filename, directory, chart):
    download(url, filename)
    with zipfile.ZipFile(filename, "r") as zf:
        logger.info("Extract policies")
        zf.extractall()
        manage_kyverno_policies("%s/kyverno" % directory, chart)
        # os.remove(filename)
        # shutil.rmtree(mixin_directory)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(prefix_chars="-")
    parser.add_argument("chart", type=str, help="Chart to update")
    parser.add_argument("--log", type=str, default="info", help="Log level")
    args = parser.parse_args()
    coloredlogs.install(level=args.log)
    main(POLICIES_URL, POLICIES_ARCHIVE, POLICIES_DIRECTORY, args.chart)
