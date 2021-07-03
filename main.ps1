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
	$script:task = ""
)

set-location /opt/openflixr3
$scripts = Get-ChildItem "./.scripts"
	foreach ($file in $scripts) {
		. $file
	}
function sudocheck {
	if ($PSVersionTable.Platform -eq 'Unix') {
		if ((id -u) -eq 0) {
			INFO "Sudo running. Continuing."
		}
		else {
			FATAL "You must run this with SUDO"
			exit
		}
	}
}

function runtime {

	$userinfo = (get-childitem "env:SUDO_USER")
	get-childitem "env:SUDO_USER"
	$script:user = $userinfo.value 
	$script:rundir = "/home/$user/.openflixr3"
	$script:chowninfo = "$user`:$user"
	if (!(test-path $rundir)) {
		write-host "Creating run directory"
		mkdir "$rundir" || Write-host "Failed"
		chown $chowninfo $rundir || Write-host "Failed"
	}
}

function main {
	runtime #Initialises the run directory under the user profile
	startlog #Initialises the logging process'
	sudocheck #Checks the script was launched using SUDO
	switch ($task) {
		help { get-help ./main.ps1 } #Throws help file
		updatesystem { pm_update } #Updates system packages (APT)
		clean { pm_clean } #Cleans unused or unrequired packages (APT)
		debug { enabledebug } #Enables debug messages throughout script
		update { git-upgrade } #Updates to the latest GIT Commit
		default { startup } #Starts the main portion of OpenFLixr3
	}
}

main