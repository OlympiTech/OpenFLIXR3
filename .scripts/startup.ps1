function startup {
    start-log
    if (Test-Path "$logfile") {
        DEBUGGING "$logfile Exists."
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