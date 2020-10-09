set-location /opt/openflixr3

$scripts = Get-ChildItem "./.scripts"
foreach ($file in $scripts) {
    . $file
}

function start-log {
    if (!(test-path ./logs)) {
        mkdir ./logs
    }
    $date = (get-date -format yyyymmdd)
    $logname = "$date`_openflixr3"
    if (test-path ./logs/$logname) {
        
        $a = read-host "Log exists. Would you like to overwrite? (Y/N)"
        if ($a -eq y) {
            rm ./logs/$logname
        }
        else {
            FATAL "Log not overwritten. Cannot log. Exit Session"
            Exit-PSSession
        }
    }
    $logfile = "./logs/$logname"
    touch $logfile
}

function Load_config {
    $config = Get-Content ./config.ps1
    if ($config -eq $null) {
        fatal "Failed to load config. Cannot proceed, Session Exit."
        Exit-PSSession
    }
    else {
        Info "Config Loaded successfully"
    }
}

function Save_config {
    out-file ./config.ps1 -InputObject $config
    if ($? -eq $true) {
        info "Configuration Saved."
    }
    else {
        FATAL "Configuration did not save. Session Exit."
        Exit-PSSession
    }
}