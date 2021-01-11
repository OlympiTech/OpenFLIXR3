<#
.SYNOPSIS
  Install or configure t he OpenFLIXR 3 system.
  
.DESCRIPTION
  Install or control elements of the OpenFLIXR 3 system. This includes updating the system, git repo, installing new software released. Docker related commands available too
  Update System 
   > sudo of3 update
.NOTES
  Version:        1.0
  Author:         -Z3US-
  Site: http://openflixr.olympiech.co.uk
  Creation Date:  10/11/2020
#>

[CmdletBinding()]
param (
    $task = ""
)
set-location /opt/openflixr3

$scripts = Get-ChildItem "./.scripts"
foreach ($file in $scripts) {
    . $file
}

# if ($PSVersionTable.Platform -eq 'Unix') {
#     if (!(id -u) -eq 0) {
# 		FATAL "This script must be run with `"sudo`""
# 		exit
#     }
# }

$user = whoami
$rundir = "/home/$user/.openflixr3"


start-log
switch ($task) {
    help {get-help ./main.ps1}
    updatesystem {pm_update}
	  clean {pm_clean}
    debug {enabledebug}
    update {git-upgrade}
    default {startup}
}
