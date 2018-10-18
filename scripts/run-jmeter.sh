#!/bin/bash

JMX=jmeter.jmx
REPORT_DIR=./reports/
JMETER_BIN=apache-jmeter/bin

for i in "$@"
do
case $i in
    -j=*|--jmx=*)
    JMX="${i#*=}"
    shift # past argument=value
    ;;
    -b=*|--jmeter_bin=*)
    JMETER_BIN="${i#*=}"
    shift # past argument=value
    ;;
    -r=*|--report_dir=*)
    REPORT_DIR="${i#*=}"
    shift # past argument=value
    ;;
    --default)
    DEFAULT=YES
    shift # past argument with no value
    ;;
    *)
          # unknown option
    ;;
esac
done

# Reporting dir: start fresh.
echo "==== Reporting dir: start fresh ===="
sudo rm -rf ${REPORT_DIR}
sudo mkdir -p ${REPORT_DIR}

echo "==== Run jmeter instance ===="
sudo ${JMETER_BIN}/jmeter \
    -n -t ${JMX} -l ${REPORT_DIR}/log/log.jtl -j ${REPORT_DIR}/log/log.log \
    -e -o ${REPORT_DIR}/output

# Set permission folder and files report.
OWNER_UID=$(id -u)
OWNER_GID=$(id -g)
sudo chmod -R 775 ${REPORT_DIR}
sudo chown ${OWNER_UID}:${OWNER_GID} ${REPORT_DIR}

#echo "==== JMeter Log ===="
#cat ${REPORT_DIR}/log/log.log

#echo "==== Raw Test Report ===="
#cat ${REPORT_DIR}/log/log.jtl

echo "==== HTML Test Report ===="
echo "See HTML test report in file:"$(realpath "${REPORT_DIR}")"/output/index.html"
