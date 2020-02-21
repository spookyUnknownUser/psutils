#For PowerShell v3
#From https://docs.gitignore.io/install/command-line#powershell-v3-script


param(
	[Parameter(Mandatory=$true)]
	[string[]]$list
)

Set-StrictMode -Off;

$params = ($list | ForEach-Object { [uri]::EscapeDataString($_) }) -join ","
Invoke-WebRequest -Uri "https://www.gitignore.io/api/$params" | select -ExpandProperty content | Out-File -FilePath $(Join-Path -path $pwd -ChildPath ".gitignore") -Encoding ascii