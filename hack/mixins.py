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

import glob
import logging
import os
from os import path
import shutil 
import zipfile

import coloredlogs
import requests


MIXINS_VERSION="v0.1.0"
MIXIN_ARCHIVE="portefaix-mixins-%s.zip" % MIXINS_VERSION
MIXIN_URL="https://github.com/nlamirault/monitoring-mixins/releases/download/%s/%s" % (
    MIXINS_VERSION, MIXIN_ARCHIVE
)
MIXIN_DIRECTORY="portefaix-mixins"

DIR="portefaix-mixins"

logger = logging.getLogger(__name__)
coloredlogs.install(level='DEBUG')


def escape(s):
    return s.replace("{{", "{{`{{").replace("}}", "}}`}}").replace("{{`{{", "{{`{{`}}").replace("}}`}}", "{{`}}`}}")


def download(url, filename):
    logger.info("Download Mixin : %s", url)
    r = requests.get(url)
    with open(filename,'wb') as f: 
        f.write(r.content) 


def manage_mixin(mixin_directory, mixin):
    logger.info("Manage %s", mixin)
    chart_dst = "charts/%s/templates/" % mixin
    files = glob.glob("%s/%s/manifests/*.yaml" % (mixin_directory, mixin))
    for f in files:
        orig = "%s" % f
        dest = "%s/%s" % (chart_dst, path.basename(orig))
        if os.path.exists(chart_dst):
            if os.path.exists(dest):
                os.remove(dest)
            logger.debug("Copy %s", f)
            fin = open(orig, "rt")
            fout = open(dest, "wt")
            for line in fin:
                fout.write(escape(line))
        else:
            logger.warning("Mixin chart not found")
    

def main(url, filename, mixin_directory):
    download(url, filename)
    with zipfile.ZipFile(filename,"r") as zf:
        zf.extractall()
        logger.info("Monitoring mixins")
        for mixin in os.listdir(path=mixin_directory):
            manage_mixin(mixin_directory, mixin)
        os.remove(filename)
        shutil.rmtree(mixin_directory)


if __name__ == '__main__':
    main(MIXIN_URL, MIXIN_ARCHIVE, MIXIN_DIRECTORY)