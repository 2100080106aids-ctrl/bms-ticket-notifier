# BMS Local Watcher — checks every 60 seconds
# Run this when you REALLY need instant alerts (e.g. day tickets open)
# Usage: .\watch.ps1

$env:BMS_URL    = "https://in.bookmyshow.com/movies/hyderabad/spider-man-brand-new-day/ET00502600,https://in.bookmyshow.com/movies/hyderabad/spider-man-brand-new-day-hdr-by-barco/ET00505091"
$env:BMS_DATES  = "20260730"
$env:BMS_THEATRE = "Prasads"
$env:BMS_TIME   = ""

# Paste your Resend API key below
$env:RESEND_API_KEY   = "PASTE_YOUR_RESEND_API_KEY_HERE"
$env:RESEND_FROM_EMAIL = "onboarding@resend.dev"
$env:RESEND_TO_EMAIL  = "nooreahamed04@gmail.com"

$uvPath = "$env:USERPROFILE\.local\bin\uv.exe"
$interval = 60   # seconds between checks

Write-Host "BMS Watcher started — checking every $interval seconds. Press Ctrl+C to stop."

while ($true) {
    & $uvPath run main.py
    Write-Host "`nNext check in $interval seconds...`n"
    Start-Sleep -Seconds $interval
}
