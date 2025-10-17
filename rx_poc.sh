#!/bin/bash

city="Casablanca"

# Fetch data
curl -s wttr.in/$city?T --output weather_report

# Extract temperatures
obs_temp=$(grep "°C" weather_report | head -1 | grep -oE '[0-9]+' | head -1)
fc_temp=$(grep "°C" weather_report | head -2 | tail -1 | grep -oE '[0-9]+' | head -1)

# Default fallback if extraction fails
obs_temp=${obs_temp:-N/A}
fc_temp=${fc_temp:-N/A}

# Display results
echo "Observed: $obs_temp°C"
echo "Forecast: $fc_temp°C"


# Get current date for Casablanca timezone
TZ='Africa/Casablanca'
year=$(TZ='Africa/Casablanca' date +%Y)
month=$(TZ='Africa/Casablanca' date +%m)
day=$(TZ='Africa/Casablanca' date +%d)

# Create log file if not exists and add header
log_file="rx_poc.log"
if [ ! -f "$log_file" ]; then
  echo -e "year\tmonth\tday\tobs_temp\tfc_temp" > "$log_file"
fi

# Save record
record=$(echo -e "$year\t$month\t$day\t$obs_temp\t$fc_temp")
echo "$record" >> "$log_file"

# Display results
echo "Observed: $obs_temp°C"
echo "Forecast: $fc_temp°C"
echo "Logged to $log_file "
