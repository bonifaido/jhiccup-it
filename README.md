jhiccup-your-os
===============

This small test runs jHiccup against your favorite OS and JVM, and it's also a small demonstration how to use [jHiccup](http://www.azulsystems.com/jHiccup).

## Prerequisites
- The binaries of your favourite JVM (and JDK) should in be `PATH`.
- Gnuplot (optional, on Mac OS X: `brew install gnuplot --nolua`)

## Usage
```
# This downloads jHiccup and does a measurement unitl key-press
# Optionally it will draw a histogram if `gnuplot` is in `PATH`.
./measure.sh
```
