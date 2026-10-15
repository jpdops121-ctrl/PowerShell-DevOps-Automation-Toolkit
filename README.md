# PowerShell DevOps Automation Toolkit

## Overview

The PowerShell DevOps Automation Toolkit is a beginner-friendly project built to practise PowerShell scripting and DevOps automation on Windows.

It includes scripts for monitoring system health, checking disk space, automating file backups, handling errors, and recording results in log files.

## Features

- **System Health Monitoring:** Displays computer information, disk usage, and running services.
- **Disk Space Monitoring:** Shows used and free disk space in GB.
- **Low Disk Space Alerts:** Warns when a drive has less than 10 GB of free space.
- **Backup Automation:** Backs up one or more files.
- **Error Handling:** Uses `try/catch` to handle script errors.
- **Logging:** Saves system health reports and backup results.
- **Safe Backup Handling:** Prevents overwriting an existing backup file with the same name.

## Project Structure

```text
DevOps-Automation-Toolkit/
├── Backup/
│   ├── devops-backup.ps1
│   └── Files/                  # Generated backup files
├── Logs/                       # Generated log files
├── SystemHealth/
│   └── system-health.ps1
├── .gitignore
└── README.md
```

The `Backup/Files` and `Logs` directories are created automatically when the scripts run. Generated backup files and log files are excluded from Git using `.gitignore`.

## Requirements

- Windows
- Windows PowerShell 5.1 or PowerShell 7+
- Git (optional, for version control and GitHub)

## Getting Started

### 1. Clone the repository

```powershell
git clone https://github.com/jpdops121-ctrl/PowerShell-DevOps-Automation-Toolkit.git
```

### 2. Open the project directory

```powershell
cd PowerShell-DevOps-Automation-Toolkit
```

## Usage

### 1. Run the System Health Check

Execute:

```powershell
.\SystemHealth\system-health.ps1
```

The script reports:

- Computer name and date
- Used and free disk space for available file-system drives
- Warnings for drives with less than 10 GB free
- Number of running services

The report is saved to:

```text
Logs/system-health.log
```

### 2. Back Up a File

First, create a sample file in the project directory:

```powershell
Set-Content .\sample.txt "Hello from my DevOps project"
```

Run the backup script:

```powershell
.\Backup\devops-backup.ps1 -SourceFiles ".\sample.txt"
```

The backup is saved to:

```text
Backup/Files/sample.txt
```

The result is recorded in:

```text
Logs/backup.log
```

The script refuses to overwrite an existing backup file with the same name. To test another backup with the same name, remove the previous test backup first or use a different filename.

### 3. Back Up Multiple Files

Create two sample files:

```powershell
Set-Content .\sample1.txt "First sample"
Set-Content .\sample2.txt "Second sample"
```

Back them up together:

```powershell
.\Backup\devops-backup.ps1 -SourceFiles ".\sample1.txt", ".\sample2.txt"
```

Each file is processed separately, and its result is logged.

## Error Handling and Logging

The scripts use PowerShell error handling to report failures and help troubleshoot problems.

- The system health script records the report in `Logs/system-health.log`.
- The backup script records successful backups and failures in `Logs/backup.log`.
- Missing source files are reported as backup failures.
- Existing destination files are not overwritten by the backup script.

## Skills Practised

- PowerShell fundamentals and scripting
- Variables, conditions, loops, and arrays
- Functions and parameters
- File and directory operations
- System monitoring
- Backup automation
- Error handling with `try/catch`
- Logging and troubleshooting
- Git and GitHub version control

## Future Improvements

Possible enhancements include:

- Scheduled backups
- Email notifications for system health alerts
- More detailed disk and service monitoring
- Automated testing
- Integration with CI/CD workflows

## Disclaimer

This project was created for learning and practice. Test scripts using non-critical sample files before using them with important data. Review scripts before running them in production environments.



