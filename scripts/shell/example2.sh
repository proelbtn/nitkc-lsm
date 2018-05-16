#!/bin/bash

DIM="1"
DATA="data/example2.dat"
BIN="target/debug/school-lsm"

RESULT="$(${BIN} ${DIM} ${DATA})"
C1="$(echo "$RESULT" | cut -f 1)"
C0="$(echo "$RESULT" | cut -f 2)"

cat scripts/gnuplot/example2 \
    | sed "s:{C1}:${C1}:g" \
    | sed "s:{C0}:${C0}:g" \
    | gnuplot