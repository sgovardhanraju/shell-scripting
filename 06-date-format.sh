#!/bin/bash
year=$(date +%Y)
month=$(date +%m)
day=$(date +%d)

ddmmyyyy=$(day-$month-$year)
echo "date month year dd-mm-yyyy $ddmmyyyy"