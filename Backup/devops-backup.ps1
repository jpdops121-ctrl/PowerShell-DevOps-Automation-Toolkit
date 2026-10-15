

param(
    [Parameter(Mandatory = $true)]
    [string[]]$SourceFiles
)

$ProjectRoot = Split-Path $PSScriptRoot -Parent
$BackupFolder = Join-Path $ProjectRoot "Backup\Files"
$LogFolder = Join-Path $ProjectRoot "Logs"
$LogFile = Join-Path $LogFolder "backup.log"

try {
    New-Item -ItemType Directory -Path $BackupFolder -Force -ErrorAction Stop |
        Out-Null
    New-Item -ItemType Directory -Path $LogFolder -Force -ErrorAction Stop |
        Out-Null
}
catch {
    Write-Error "Could not prepare backup folders: $($_.Exception.Message)"
    return
}

foreach ($SourceFile in $SourceFiles) {
    try {
        if (-not (Test-Path -LiteralPath $SourceFile -PathType Leaf)) {
            throw "File not found: $SourceFile"
        }

        $DestinationFile = Join-Path $BackupFolder (Split-Path $SourceFile -Leaf)

        if (Test-Path -LiteralPath $DestinationFile) {
            throw "Backup already exists; refusing to overwrite: $DestinationFile"
        }

        Copy-Item -LiteralPath $SourceFile `
            -Destination $DestinationFile -ErrorAction Stop

        $Message = "SUCCESS: Backed up $SourceFile"
    }
    catch {
        $Message = "FAILED: $($_.Exception.Message)"
    }

    Write-Output $Message
    Add-Content -LiteralPath $LogFile -Value $Message
}

