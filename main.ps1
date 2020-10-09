set-location /opt/openflixr3

$scripts = Get-ChildItem "./.scripts"
foreach ($file in $scripts) {
    . $file
}

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

startup
