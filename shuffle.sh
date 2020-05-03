#!/bin/bash

filename=$1

lines_in_file=`wc -l ${filename}| awk '{print $1;}'`

if [ $lines_in_file -le 1 ]
then
    exit 0
fi

for line in `seq $(($lines_in_file-1))`
do
    echo $line

    number_of_lines_to_shuffle=$(($lines_in_file - $line + 1))
    echo "lines to shuffle $number_of_lines_to_shuffle"

    random_number=$(($RANDOM%$number_of_lines_to_shuffle))
    line_to_be_shuffled=$(($random_number + $line))
    echo "line to be shuffled $line_to_be_shuffled"

    line_text=`sed "${line_to_be_shuffled}q;d" $filename`
    echo "text $line_text"

    sed -i "" "${line_to_be_shuffled}d" $filename
    sed -i.bak "${line}i\\
    ${line_text}\\
    " $filename

    echo
done