#!/usr/bin/env bash
SCRIPTDIR=$(dirname "$0")
BASEDIR=$(cd "$SCRIPTDIR" && pwd)
HOMEDIR=${BASEDIR}/..
cd "${HOMEDIR}/abstraction"
pip install -r requirements.txt .
cd ..
cd "${HOMEDIR}/api_servicecore"
pip install -r requirements.txt .
cd ..
cd "${HOMEDIR}/appservice"
pip install -r requirements.txt .
cd ..
cd "${HOMEDIR}/authservice"
pip install -r requirements.txt .

