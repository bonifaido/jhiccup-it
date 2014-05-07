#!/bin/bash

# download jHiccup if needed
if [ ! -d jHiccup ]; then
    JHICCUP=jHiccup-2.0.2
    wget http://www.azulsystems.com/sites/default/files/images/${JHICCUP}-dist.zip
    unzip ${JHICCUP}-dist.zip
    mv ${JHICCUP} jHiccup
    rm ${JHICCUP}-dist.zip
fi

# Compile the dummy program if needed
if [ ! -f Dummy.class ]; then
    javac Dummy.java
fi

OS=`uname`-`uname -r`
LOG_FILE="hiccup.$OS.log"

jHiccup/jHiccup -l ${LOG_FILE} -d 0 -c java Dummy

# We are interested in the control process thus the '.c'
echo Creating human readable logs...
jHiccup/jHiccupLogProcessor -i ${LOG_FILE}.c -o ${LOG_FILE}

type gnuplot &> /dev/null
if [ $? -eq 0 ]; then

    echo Found gnuplot...

    if [ ! -d HdrHistogram ]; then
        git clone https://github.com/HdrHistogram/HdrHistogram.git
    fi

    HdrHistogram/gnuplotExample/make_percentile_plot -o ${LOG_FILE}.png ${LOG_FILE}.hgrm
fi
