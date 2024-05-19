#Requires -RunAsAdministrator

#stopping Steam
Stop-Process -ProcessName steam

#where is your Steam Library
$SteamLib='E:\Games\Steam\steamapps\'

<#
#"Always keep this game updated" aka "AutoUpdateBehavior" "0"
#"only update this game when i launch it" aka "AutoUpdateBehavior" "1"
#"High Priority - Always auto-update this game before others" aka "AutoUpdateBehavior" "2"
#>

#the search pattern to locate the right token
$myregexAUB = '(?<_start>"AutoUpdateBehavior"\t*")(\d+)(?<_end>")'

#get the list of manifest of the installed games
$list_of_manifest = Get-childItem -Path ($SteamLib + "appmanifest_*.acf")

#create a .backup for each file
$list_of_manifest | ForEach-Object { Copy-Item $_.PSPath -Destination ($_.PSPath +".backup") }

#parse each manifest to update number to get the needed effect
$list_of_manifest | ForEach-Object { (Get-Content $_.PSPath) -replace $myregexAUB, '${_start}1${_end}' | Set-Content $_.PSPath }

Write-Host "Exiting script in 5 seconds."; Start-Sleep -Seconds 5
exit