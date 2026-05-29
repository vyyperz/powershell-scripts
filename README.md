# ⚡ PowerShell Scripts

Eine Sammlung nützlicher PowerShell Scripts für Linux (Fedora) und Windows.

## Scripts

### 📊 system-info.ps1
Zeigt alle wichtigen System-Informationen an.
```bash
./system-info.ps1
```

### 🧹 file-cleaner.ps1
Löscht alte Dateien die älter als X Tage sind.
```bash
./file-cleaner.ps1 -Path ~/Downloads -DaysOld 30
```

### 💾 backup.ps1
Erstellt ein Backup eines Verzeichnisses.
```bash
./backup.ps1 -Source ~/Dokumente -Destination /mnt/backup
```

### 📈 process-monitor.ps1
Zeigt die Top-Prozesse nach CPU/RAM Verbrauch.
```bash
./process-monitor.ps1 -Top 10 -SortBy CPU
```

## Voraussetzungen
- PowerShell 7.4+
- Linux (Fedora) oder Windows

## Installation
```bash
git clone git@github.com:vyyperz/powershell-scripts.git
cd powershell-scripts
pwsh
```

## Autor
**vyyperz** — [GitHub](https://github.com/vyyperz)