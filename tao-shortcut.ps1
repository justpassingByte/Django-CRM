$desktop = [Environment]::GetFolderPath("Desktop")
$currentDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$vbsPath = Join-Path $currentDir "CRM-App.vbs"

$wshShell = New-Object -ComObject WScript.Shell
$shortcut = $wshShell.CreateShortcut((Join-Path $desktop "SME CRM Pro.lnk"))
$shortcut.TargetPath = "wscript.exe"
$shortcut.Arguments = "`"$vbsPath`""
$shortcut.WorkingDirectory = $currentDir
$shortcut.Description = "SME CRM Pro - Quan Ly Khach Hang & Doanh So B2B"
$shortcut.Save()

Write-Host "Done"
