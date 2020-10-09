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