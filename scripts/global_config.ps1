function Load_config {
    $files = Get-ChildItem $rundir -Filter *.csv
    if ($files -eq $null) {
        $createconfig = $true
        configcreate
    }
    else {
        $script:config = [pscustomobject]@{ 
            ports        = $(import-csv "$rundir/ports.csv")
            downloadType = $(import-csv "$rundir/dt.csv")
            install    = $(import-csv "$rundir/state.csv")
        }
    }
    if (!($createconfig -eq $true)) {
        if ($config -eq $null) {
            fatal "Failed to load config. Cannot proceed, Session Exit."
            Exit
        }
        else {
            Info "Config Loaded successfully"
            dbg "imported from $rundir"
        }
    }else {
        # Continue
    }
}

function Save_config {
    Export-Csv -path "$rundir/ports.csv" -InputObject $config.ports
    chown $chowninfo "$rundir/ports.csv"
    if ($? -eq $true) {
        info "Ports Exported."
        dbg "Exported ports to $rundir"
    }
    else {
        FATAL "Port configuration did not export. Session Exit."
        dbg "Could not export to $rundir"
        Exit-PSSession
    }
    Export-Csv -path "$rundir/dt.csv" -InputObject $config.downloadType
    chown $chowninfo "$rundir/dt.csv"
    if ($? -eq $true) {
        info "Download type information exported."
        dbg "Exported download type information to $rundir"
    }
    else {
        FATAL "Download type information did not export. Session Exit."
        dbg "Could not export to $rundir"
        Exit-PSSession
    }
    Export-Csv -path "$rundir/state.csv" -InputObject $config.install
    chown $chowninfo "$rundir/state.csv"
    if ($? -eq $true) {
        info "Installation state exported."
        dbg "Exported installation state to $rundir"
    }
    else {
        FATAL "Installation state did not save. Session Exit."
        dbg "Could not export to $rundir"
        Exit-PSSession
    }
}

function configcreate {
    $newconfig = [PSCustomObject]@{
        ports = $configports
        downloadType = $configDownloadType
        install = $configinstall
    }
    $script:config = $newconfig
    Save_config
}