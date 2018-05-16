#!/bin/bash

DATA="data/example4.dat"
BIN="target/debug/school-lsm"

RESULT1="$(${BIN} 1 ${DATA})"
C11="$(echo "$RESULT1" | cut -f 1)"
C10="$(echo "$RESULT1" | cut -f 2)"
RESULT2="$(${BIN} 2 ${DATA})"
C22="$(echo "$RESULT2" | cut -f 1)"
C21="$(echo "$RESULT2" | cut -f 2)"
C20="$(echo "$RESULT2" | cut -f 3)"

cat scripts/gnuplot/example4 \
    | sed "s:{C11}:${C11}:g" \
    | sed "s:{C10}:${C10}:g" \
    | sed "s:{C22}:${C22}:g" \
    | sed "s:{C21}:${C21}:g" \
    | sed "s:{C20}:${C20}:g" \
    | gnuplot