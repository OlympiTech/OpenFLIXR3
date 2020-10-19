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
    DEBUGGING "Welcome completed."
    #main_menu
}

function installmode {
    #… Present the Welcome Message
    Write-Host "`n`tInstall Mode `n" -ForegroundColor Magenta
    Write-Host "`tWill you be using NZB's, Torrents or Both?.`n" -Fore Cyan
    Write-Host "`tThank you for installing. This system runs DOCKER applications. with a web front end.
    If you wish to access these systems directly, please use the ports below.`n" -Fore Cyan
    Write-Host "`t`tTo be updated`n" -Fore Cyan
    Write-Host "`tTo configure your system. Please press enter." -Fore Cyan
    Write-Host "`tTo quit: Ctrl + C`n" -Fore Cyan
    #… Retrieve the response from the user
    read-host
    if ($true -eq $debug) {
        DEBUG "Welcome completed."
    }
    #main_menu
}