#!/bin/bash

# Use JMeter Docker image.
NAME="gtb"
IMAGE="justb4/jmeter"

# User Defined Variables with JMeter.
HOST="apache"
PORT="80"
NET="NET" # `docker net list` for view all network in host.

# Ramp up by factors of sqrt(2). @todo read from option command.
#for thread_count in 2 3 4 6 8 11 16 23 32 45 64 91 128 181 256 362 512
for thread_count in 2
do

    R_DIR=./reports/${thread_count}

    # Reporting dir: start fresh.
    echo "==== Reporting dir: start fresh ===="

    sudo rm -rf ${R_DIR}
    sudo mkdir -p ${R_DIR}
    sudo rm -f ${NAME}.jtl ${NAME}.log

    echo "==== Run jmeter instance ===="
    #@todo found method to read env file and pass to jmeter!
    docker stop ${NAME} > /dev/null 2>&1
    docker rm ${NAME} > /dev/null 2>&1
    docker run --name ${NAME} --net=${NET} -i -v ${PWD}:${PWD} -w ${PWD} ${IMAGE} -Dlog_level.jmeter=DEBUG \
        -Jhost=${HOST} -Jport=${PORT} -Jthreads=${thread_count} \
        -n -t ${NAME}.jmx -l ${R_DIR}/log/${NAME}.jtl -j ${R_DIR}/log/${NAME}.log \
        -e -o ${R_DIR}/output
    docker rm ${NAME} > /dev/null 2>&1

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