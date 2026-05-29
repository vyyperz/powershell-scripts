# Backup Script
param(
    [string]$Source = "$HOME/Dokumente",
    [string]$Destination = "/mnt/backup"
)

$date = Get-Date -Format "yyyy-MM-dd"
$backupPath = "$Destination/backup-$date"

Write-Host "💾 Backup wird erstellt..." -ForegroundColor Cyan
Write-Host "Von:  $Source" -ForegroundColor Yellow
Write-Host "Nach: $backupPath" -ForegroundColor Yellow

if (!(Test-Path $Destination)) {
    Write-Host "❌ Zielverzeichnis nicht gefunden!" -ForegroundColor Red
    exit
}

Copy-Item -Path $Source -Destination $backupPath -Recurse -Force
Write-Host "✅ Backup erfolgreich erstellt: $backupPath" -ForegroundColor Green