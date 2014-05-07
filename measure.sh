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
