#!/bin/bash

DIM="$1"
DATA="$2"
BIN="$3"

RESULT="$(${BIN} ${DIM} ${DATA})"
C1="$(echo "$RESULT" | cut -f 1)"
C0="$(echo "$RESULT" | cut -f 2)"

cat scripts/gnuplot/example1 \
    | sed "s:{C1}:${C1}:g" \
    | sed "s:{C0}:${C0}:g" \
    | gnuplot