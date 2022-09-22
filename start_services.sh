#!/usr/bin/env bash
SCRIPTDIR=$(dirname "$0")
BASEDIR=$(cd "$SCRIPTDIR" && pwd)
HOMEDIR=${BASEDIR}/..
LOGS_DIR=logs
cd "${HOMEDIR}/appservice"
if [[ ! -e $LOGS_DIR ]] 
then
  mkdir "$LOGS_DIR"
fi
nohup python "./main/server.py" >> "${LOGS_DIR}/appservice.out" 2>&1 & echo $! > "${LOGS_DIR}/.appservice.pid"
pid=$(cat "${LOGS_DIR}/.appservice.pid")
echo "Started appservice with PID:${pid}"
cd "${HOMEDIR}/authservice"
if [[ ! -e $LOGS_DIR ]] 
then
  mkdir "$LOGS_DIR"
fi
nohup python "./main/server.py" >> "${LOGS_DIR}/authservice.out" 2>&1 & echo $! > "${LOGS_DIR}/.authservice.pid"
pid=$(cat "${LOGS_DIR}/.authservice.pid")
echo "Started authservice with PID:${pid}"