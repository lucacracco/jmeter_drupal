#!/usr/bin/env bash

JMX=jmeter.jmx
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
    --default)
    DEFAULT=YES
    shift # past argument with no value
    ;;
    *)
          # unknown option
    ;;
esac
done

${JMETER_BIN}/bin/jmeter.sh -t ${JMX}