#!/bin/bash

filename=$1

lines_in_file=`wc -l ${filename}| awk '{print $1;}'`

if [ $lines_in_file -le 1 ]
then
    exit 0
fi

number_of_lines_to_shuffle=lines_in_file

for line in `seq $(($lines_in_file-1))`
do
    random_number=$(($RANDOM%$number_of_lines_to_shuffle))
    line_to_be_shuffled=$(($random_number + $line))

    #save the element chosen in the shuffle
    line_text=`sed "${line_to_be_shuffled}q;d" $filename`

    #delete the element to be shuffled form the file
    sed -i "" "${line_to_be_shuffled}d" $filename

    #put the chosen element at the shuffled position
    sed -i.bak "${line}i\\
    ${line_text}\\
    " $filename

    (( number_of_lines_to_shuffle-- ))
done