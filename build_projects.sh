c#!/usr/bin/env bash
SCRIPTDIR=$(dirname "$0")
BASEDIR=$(cd "$SCRIPTDIR" && pwd)
HOMEDIR=${BASEDIR}/..
cd "${HOMEDIR}/abstraction"
pip3 install -r requirements.txt .
cd ..
cd "${HOMEDIR}/api_servicecore"
pip3 install -r requirements.txt .
cd ..
cd "${HOMEDIR}/appservice"
pip3 install -r requirements.txt .
cd ..
cd "${HOMEDIR}/authservice"
pip3 install -r requirements.txt .
python -m pip install autopep8

