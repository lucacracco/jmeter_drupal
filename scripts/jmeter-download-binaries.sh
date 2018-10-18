#!/usr/bin/env bash

# @todo get last binaries available?!
JMETER_BINARIES="http://mirror.nohup.it/apache//jmeter/binaries/apache-jmeter-5.0.zip"

if [ -d "apache-jmeter" ]; then
    echo "==== Remove current dir ===="
    rm -rf ./apache-jmeter-5.0
fi

echo "==== Download zip with binaries and unzip ===="
wget ${JMETER_BINARIES} -O apache-jmeter-5.0.zip
unzip apache-jmeter-5.0.zip

# Remove zip downloaded.
rm apache-jmeter-5.0.zip

# Rename directory
mv apache-jmeter-5.0 apache-jmeter