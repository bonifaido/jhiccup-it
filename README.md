jhiccup-it
==========

This small test runs jHiccup against your favorite app on your favourite OS and JVM, and it's also a small demonstration how to use [jHiccup](https://github.com/giltene/jHiccup).

## Prerequisites
- The binaries of your favourite JDK should in be `PATH`.
- Gnuplot (optional, install on Mac OS X with `brew install gnuplot --nolua`)

## Usage
```
git clone https://github.com/bonifaido/jhiccup-it.git
cd jhiccup-it

# This downloads jHiccup and does a measurement until a key-press
# Optionally it will draw a histogram if gnuplot is in PATH.
./measure.sh [java -cp ../classpath MainClass]

# Press a key to stop measuring
open hiccup.[OS]-[KERNEL-VERSION].hgrm

# If you had Gnuplot
open hiccup.[OS]-[KERNEL-VERSION].png
```
