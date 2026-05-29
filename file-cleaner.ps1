# File Cleaner Script
param(
    [string]$Path = "$HOME/Downloads",
    [int]$DaysOld = 30
)

Write-Host "🧹 Suche nach Dateien älter als $DaysOld Tage in $Path..." -ForegroundColor Yellow

$files = Get-ChildItem -Path $Path -File | Where-Object {
    $_.LastWriteTime -lt (Get-Date).AddDays(-$DaysOld)
}

if ($files.Count -eq 0) {
    Write-Host "✅ Keine alten Dateien gefunden!" -ForegroundColor Green
} else {
    Write-Host "Gefundene Dateien:" -ForegroundColor Red
    $files | ForEach-Object {
        Write-Host "  - $($_.Name) ($($_.LastWriteTime))" -ForegroundColor Red
    }
    $confirm = Read-Host "Alle löschen? (j/n)"
    if ($confirm -eq "j") {
        $files | Remove-Item -Force
        Write-Host "✅ $($files.Count) Dateien gelöscht!" -ForegroundColor Green
    }
}