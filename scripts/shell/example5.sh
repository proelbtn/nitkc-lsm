#!/bin/bash

DATA="data/example5.dat"
BIN="target/debug/school-lsm"

RESULT1="$(${BIN} 1 ${DATA})"
C11="$(echo "$RESULT1" | cut -f 1)"
C10="$(echo "$RESULT1" | cut -f 2)"
RESULT2="$(${BIN} 2 ${DATA})"
C22="$(echo "$RESULT2" | cut -f 1)"
C21="$(echo "$RESULT2" | cut -f 2)"
C20="$(echo "$RESULT2" | cut -f 3)"
RESULT4="$(${BIN} 4 ${DATA})"
C44="$(echo "$RESULT4" | cut -f 1)"
C43="$(echo "$RESULT4" | cut -f 2)"
C42="$(echo "$RESULT4" | cut -f 3)"
C41="$(echo "$RESULT4" | cut -f 4)"
C40="$(echo "$RESULT4" | cut -f 5)"

cat scripts/gnuplot/example5 \
    | sed "s:{C11}:${C11}:g" \
    | sed "s:{C10}:${C10}:g" \
    | sed "s:{C22}:${C22}:g" \
    | sed "s:{C21}:${C21}:g" \
    | sed "s:{C20}:${C20}:g" \
    | sed "s:{C44}:${C44}:g" \
    | sed "s:{C43}:${C43}:g" \
    | sed "s:{C42}:${C42}:g" \
    | sed "s:{C41}:${C41}:g" \
    | sed "s:{C40}:${C40}:g" \
    | gnuplot