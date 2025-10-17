#!/bin/bash

# Load the last 7 accuracy values into an array
accuracies=($(tail -7 synthetic_historical_fc_accuracy.tsv | cut -f6))

# Convert negative values to absolute
for i in "${!accuracies[@]}"
do
    if (( accuracies[i] < 0 )); then
        accuracies[i]=$(( accuracies[i] * -1 ))
    fi
done

# Initialize min and max
min=${accuracies[0]}
max=${accuracies[0]}

# Find min and max
for item in "${accuracies[@]}"
do
    if (( item < min )); then
        min=$item
    fi
    if (( item > max )); then
        max=$item
    fi
done

# Print results
echo "Minimum absolute error = $min"
echo "Maximum absolute error = $max"

