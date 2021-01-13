function startup {
    if (Test-Path "$logfile") {
        dbg "$logfile Exists."
        Load_config
        gitc
    }
    else {
        FATAL "Log file failed to spawn. Exiting"
        exit
    }
    if ($config.install.state -contains "$false") {
        write-host "not"
        firstrun
    }
    else {
        write-host "yes"
        welcome
    }
}