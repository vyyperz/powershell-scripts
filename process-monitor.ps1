# Process Monitor Script
param(
    [int]$Top = 10,
    [string]$SortBy = "CPU"
)

Write-Host "========== TOP $Top PROZESSE ==========" -ForegroundColor Cyan
Write-Host "Sortiert nach: $SortBy" -ForegroundColor Yellow
Write-Host "" 

Get-Process | Sort-Object $SortBy -Descending | Select-Object -First $Top |
    Format-Table -AutoSize @(
        @{Label="Name"; Expression={$_.Name}},
        @{Label="CPU (s)"; Expression={[math]::Round($_.CPU, 2)}},
        @{Label="RAM (MB)"; Expression={[math]::Round($_.WorkingSet64 / 1MB, 1)}},
        @{Label="PID"; Expression={$_.Id}}
    )