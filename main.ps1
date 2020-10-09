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
    if (!($config.Installed -eq $TRUE)) {
        firstrun
    }
    else {
        main_menu
    }
}

startup
