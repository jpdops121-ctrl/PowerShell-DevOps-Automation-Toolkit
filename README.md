\# PowerShell DevOps Automation Toolkit



\## Overview

A beginner-friendly DevOps project built with PowerShell to practise system monitoring, backup automation, error handling, and logging.



\## Features

\- System health checks

\- Disk-space monitoring and low-space warnings

\- Backup automation for multiple files

\- Error handling with `try/catch`

\- Logging of backup results



\## Project Structure

```text

DevOps-Automation-Toolkit/

├── Backup/

│   ├── devops-backup.ps1

│   └── Files/

├── Logs/

├── SystemHealth/

│   └── system-health.ps1

└── README.md

```



\## Requirements

\- Windows

\- Windows PowerShell 5.1 or PowerShell 7+



\## Usage



\### System health check

Run from the project directory:



```powershell

.\\SystemHealth\\system-health.ps1

```



\### Back up a file

Run from the project directory:



```powershell

.\\Backup\\devops-backup.ps1 -SourceFiles ".\\test-backup.txt"

```



The backup script writes files to `Backup\\Files` and records results in `Logs\\backup.log`.



\## Skills Practised

\- PowerShell scripting

\- Variables, conditions, and loops

\- Functions and parameters

\- File and directory operations

\- Error handling

\- Logging and automation



\## Disclaimer

Created for learning and practice. Test scripts with non-critical files before using them on important data.



