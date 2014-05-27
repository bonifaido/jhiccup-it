#!/bin/bash

source log.sh

if [ $# -lt 1 ];then
    log "You didn't specify any program to anaylize, so analyzing the 'platform'..."
    # Compile the dummy program if needed
    if [ ! -f Dummy.class ]; then
        log Compiling a dummy program...
        javac Dummy.java
    fi
    PROGRAM="java Dummy"
else
    PROGRAM="$@" # the usual jHiccup parameters
fi

# download jHiccup if needed
if [ ! -d jHiccup ]; then
    log "jHiccup not available, downloading it..."
    JHICCUP=jHiccup-2.0.2
    wget http://www.azulsystems.com/sites/default/files/images/${JHICCUP}-dist.zip
    unzip ${JHICCUP}-dist.zip > /dev/null
    mv ${JHICCUP} jHiccup
    rm ${JHICCUP}-dist.zip
fi

OS_ARCH_KERNEL_VERSION=`uname`-`uname -m`-`uname -r`
LOG_FILE="hiccup.$OS_ARCH_KERNEL_VERSION"

log Starting jHiccup...
jHiccup/jHiccup -l ${LOG_FILE} -d 0 -c $PROGRAM

# We are interested in the control process thus the '.c' - TODO
log Creating human readable logs...
jHiccup/jHiccupLogProcessor -i ${LOG_FILE}.c -o ${LOG_FILE}

type gnuplot &> /dev/null
if [ $? -eq 0 ]; then

    log Found gnuplot...

    log Creating jitter image ${LOG_FILE}.png...
    HdrHistogram/gnuplotExample/make_percentile_plot -o ${LOG_FILE}.png ${LOG_FILE}.hgrm
fi
