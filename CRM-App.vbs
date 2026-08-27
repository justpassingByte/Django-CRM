Set WshShell = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
currentDir = fso.GetParentFolderName(WScript.ScriptFullName)

WshShell.CurrentDirectory = currentDir
WshShell.Run "docker compose -f docker-compose.prod.yml up -d", 0, False

WScript.Sleep 1500
WshShell.Run "cmd /c start http://localhost:3000", 0, False
