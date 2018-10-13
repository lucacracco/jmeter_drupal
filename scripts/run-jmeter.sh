#!/bin/bash

# User Defined Variables with JMeter.
NAME="gtb"
JMETER_DIR="apache-jmeter-5.0"
HOST="gtb.docker.localhost"
PORT="80"

# Ramp up by factors of sqrt(2). @todo read from option command.
#for thread_count in 2 3 4 6 8 11 16 23 32 45 64 91 128 181 256 362 512
for thread_count in 2
do

    R_DIR=./reports/${thread_count}

    # Reporting dir: start fresh.
    echo "==== Reporting dir: start fresh ===="
    sudo rm -rf ${R_DIR}
    sudo mkdir -p ${R_DIR}

    echo "==== Run jmeter instance ===="
    #@todo found method to read env file and pass to jmeter!
    sudo ${JMETER_DIR}/bin/jmeter \
        -Jhost=${HOST} -Jport=${PORT} -Jthreads=${thread_count} \
        -n -t ${NAME}.jmx -l ${R_DIR}/log/${NAME}.jtl -j ${R_DIR}/log/${NAME}.log \
        -e -o ${R_DIR}/output

    # Set permission folder and files report.
    UID=$(id -u)
    GID=$(id -g)
    sudo chmod -R 775 ${R_DIR}
    sudo chown ${UI}:${GID} ${R_DIR}

    echo "==== JMeter Log ===="
    #cat ${R_DIR}/log/${NAME}.log

    echo "==== Raw Test Report ===="
    #cat ${R_DIR}/log/test-plan.jtl

    echo "==== HTML Test Report ===="
    echo "See HTML test report in file:"$(realpath "${R_DIR}")"/output/index.html"

done