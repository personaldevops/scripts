#!/usr/bin/env bash
SCRIPTDIR=$(dirname "$0")
BASEDIR=$(cd "$SCRIPTDIR" && pwd)
HOMEDIR=${BASEDIR}/..
LOGS_DIR=logs
cd "${HOMEDIR}/appservice/"
if [[ -f "${LOGS_DIR}/.appservice.pid" ]] 
then
    pid=$(cat "${LOGS_DIR}/.appservice.pid")
    kill "${pid}"
    rm "${LOGS_DIR}/appservice.out"    
fi
echo "Stopped appservice with PID:${pid}"
cd "${HOMEDIR}/authservice/"
if [[ -f "${LOGS_DIR}/.authservice.pid" ]] 
then
    pid=$(cat "${LOGS_DIR}/.authservice.pid")
    kill "${pid}"
    rm "${LOGS_DIR}/authservice.out"    
fi
echo "Stopped authservice with PID:${pid}"
