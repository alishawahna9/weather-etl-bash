#!/bin/bash


# Extract the forecasted temperature from yesterday (column 5 in rx_poc.log)
yesterday_fc=$(tail -2 rx_poc.log | head -1 | cut -d " " -f5)

# Extract today's observed temperature (column 4 in rx_poc.log)
today_temp=$(tail -1 rx_poc.log | cut -d " " -f4)

# Calculate the difference (forecast - observed)
accuracy=$((yesterday_fc - today_temp))

echo "Accuracy difference is $accuracy°C"

# Determine accuracy range based on thresholds
if (( accuracy >= -1 && accuracy <= 1 )); then
    accuracy_range="excellent"
elif (( accuracy >= -2 && accuracy <= 2 )); then
    accuracy_range="good"
elif (( accuracy >= -3 && accuracy <= 3 )); then
    accuracy_range="fair"
else
    accuracy_range="poor"
fi

# Extract date info (year, month, day) from last row in rx_poc.log
row=$(tail -1 rx_poc.log)
year=$(echo $row | cut -d " " -f1)
month=$(echo $row | cut -d " " -f2)
day=$(echo $row | cut -d " " -f3)

# Append results to the historical forecast accuracy file
echo -e "$year\t$month\t$day\t$today_temp\t$yesterday_fc\t$accuracy\t$accuracy_range" >> historical_fc_accuracy.tsv

# Print confirmation message
echo " New accuracy record added to historical_fc_accuracy.tsv"