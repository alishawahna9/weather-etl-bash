# Bash Weather ETL 🌦️

Automated **ETL pipeline** built in **Bash** and running on **Linux** to extract, transform, and log daily weather data for **Casablanca, Morocco** using the open-source [wttr.in](https://wttr.in) service.  
The process runs **automatically every day at noon** via a **Cron job**, creating a historical dataset for forecasting accuracy analysis.

---

## 🧩 Project Overview

This project demonstrates a real-world data pipeline pattern using only shell scripting:

1. **Extract** – Retrieve raw weather data using `curl` from wttr.in.  
2. **Transform** – Parse and filter the relevant temperature data (observed & forecasted).  
3. **Load** – Append structured results to a log file (`rx_poc.log`) in a tabular format.

Example output (in log file):

year month day obs_temp fc_temp
2025 10 18 23 25

---

## ⚙️ Files Included

| File | Description |
|------|--------------|
| `rx_poc.sh` | Main Bash ETL script. Downloads, parses, and logs weather data. |
| `rx_poc.log` | Historical log file with daily temperature records. |
| `weather_report` | Raw data temporarily stored from wttr.in. |

---

## 🕐 Automation via Cron

To schedule the script to run daily at noon (local Casablanca time):

```bash
crontab -e

0 12 * * * /home/project/rx_poc.sh

Bash (GNU/Linux)

Cron Scheduler

curl

grep / awk / sed

wttr.in API

Ali Shawahna
B.Sc. Software Engineering Student – Braude College of Engineering
GitHub: @alishawahna9