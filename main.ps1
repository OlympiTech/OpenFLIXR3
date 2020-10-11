<#
.NAME
    OPENFLIXR3

.SYNOPSIS
  Install or configure t he OpenFLIXR 3 system.
  
.DESCRIPTION
  Install or control elements of the OpenFLIXR 3 system. This includes updating the system, git repo, installing new software released. Docker related commands available too

.NOTES
  Version:        1.0
  Author:         -Z3US-
  Site: http://openflixr.olympiech.co.uk
  Creation Date:  10/11/2020

.EXAMPLE
  Update system

  sudo of3 update

.EXAMPLE
  clean system

  sudo of3 clean

#>

[CmdletBinding()]
param (
    $task
)
set-location /opt/openflixr3

$scripts = Get-ChildItem "./.scripts"
foreach ($file in $scripts) {
    . $file
}

start-log
switch ($task) {
    help {get-help ./main.ps1}
    update {pm_update}
    clean {pm_clean}
    default {startup}
}  

## FUNCTIONS
function startup {
    start-log
    if (Test-Path "$logfile") {
        Load_config
    }
    else {
        FATAL "Log file failed to spawn. Exiting"
        exit
    }
    if (!(test-path "./configmarkers/INSTALLED")) {
        write-host "not"
        firstrun
    }
    else {
        write-host "yes"
        welcome
    }
}

function welcome {
		#… Present the Welcome Message
		Write-Host "`n`tWelcome to OpenFLIXR3 `n" -ForegroundColor Magenta
		Write-Host "`tThis system is written and maintained by OlympiTech.`n" -Fore Cyan
        Write-Host "`tThank you for installing. This system runs DOCKER applications. with a web front end.
        If you wish to access these systems directly, please use the ports below.`n" -Fore Cyan
        Write-Host "`t`tTo be updated`n" -Fore Cyan
        Write-Host "`tTo configure your system. Please press enter." -Fore Cyan
		Write-Host "`tTo quit: Ctrl + C`n" -Fore Cyan
		#… Retrieve the response from the user
        read-host
        DEBUG "Welcome completed."
        #main_menu
}
