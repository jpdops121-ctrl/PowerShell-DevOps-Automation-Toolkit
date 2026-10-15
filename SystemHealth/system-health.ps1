
$LogFile = ".\system-health.log"

try {
    $Report = @()

    $Report += "===== SYSTEM HEALTH CHECK ====="
    $Report += "Computer: $env:COMPUTERNAME"
    $Report += "Date: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    $Report += ""
    $Report += "DISK SPACE (GB):"

    $Drives = Get-PSDrive -PSProvider FileSystem -ErrorAction Stop

  
foreach ($Drive in $Drives) {
    $UsedGB = [math]::Round($Drive.Used / 1GB, 2)
    $FreeGB = [math]::Round($Drive.Free / 1GB, 2)

    $Report += "$($Drive.Name): Used $UsedGB GB | Free $FreeGB GB"

    if ($Drive.Free -lt 10GB) {
        $Report += "WARNING: Drive $($Drive.Name) has less than 10 GB free!"
    }
}

    $RunningServices = (
        Get-Service -ErrorAction Stop |
        Where-Object Status -eq "Running"
    ).Count

    $Report += ""
    $Report += "Running services: $RunningServices"
    $Report += "===== CHECK COMPLETE ====="

    $Report | Tee-Object -FilePath $LogFile
    Write-Output "Report saved to $LogFile"
}
catch {
    $ErrorMessage = "FAILED: $($_.Exception.Message)"
    Write-Output $ErrorMessage
    Add-Content -Path $LogFile -Value $ErrorMessage
}
