jhiccup-your-os
===============

This small test runs jHiccup against your favorite OS and JVM, and it's also a small demonstration how to use [jHiccup](http://www.azulsystems.com/jHiccup).

## Prerequisites
- The binaries of your favourite JDK should in be `PATH`.
- Gnuplot (optional, install on Mac OS X with `brew install gnuplot --nolua`)

## Usage
```
# This downloads jHiccup and does a measurement until a key-press
# Optionally it will draw a histogram if gnuplot is in PATH.
./measure.sh

# Press a key to stop measuring

open hiccup.[OS]-[VERSION].hgrm

# If you had Gnuplot
open hiccup.[OS]-[VERSION].png
```
