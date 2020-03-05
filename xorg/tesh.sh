#!/bin/bash
echo $(( $(date +"%M" | sed 's/^0*//') % 5 ))
echo $(( $(date +"%S" | sed 's/^0*//') == 0 ))
if [[ $(( $(date +"%M" | sed 's/^0*//') % 5 )) == 0 ]] && [[ $(( $(date +"%S") | sed 's/^0*//' == 0 )) ]] 
then
    echo true
else
    echo false
fi
