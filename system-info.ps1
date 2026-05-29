# System Information Script
# by vyyperz

Write-Host "========== SYSTEM INFO ==========" -ForegroundColor Cyan

$hostname = hostname
$user = $env:USER
$os = (Get-Content /etc/os-release | Where-Object { $_ -match "^PRETTY_NAME" }).Split("=")[1].Trim('"')
$kernel = uname -r
$uptime = uptime -p
$cpu = (Get-Content /proc/cpuinfo | Where-Object { $_ -match "model name" } | Select-Object -First 1).Split(":")[1].Trim()
$ramTotal = [math]::Round((Get-Content /proc/meminfo | Where-Object { $_ -match "^MemTotal" }).Split(":")[1].Trim().Split(" ")[0] / 1MB, 2)
$ramFree = [math]::Round((Get-Content /proc/meminfo | Where-Object { $_ -match "^MemAvailable" }).Split(":")[1].Trim().Split(" ")[0] / 1MB, 2)
$ramUsed = [math]::Round($ramTotal - $ramFree, 2)

Write-Host "OS:       $os" -ForegroundColor Green
Write-Host "Kernel:   $kernel" -ForegroundColor Green
Write-Host "CPU:      $cpu" -ForegroundColor Yellow
Write-Host "RAM:      $ramUsed GB / $ramTotal GB" -ForegroundColor Yellow
Write-Host "Hostname: $hostname" -ForegroundColor Magenta
Write-Host "User:     $user" -ForegroundColor Magenta
Write-Host "Uptime:   $uptime" -ForegroundColor White
Write-Host "=================================" -ForegroundColor Cyan