function Load_config {
    $config = Get-Content ./config.ps1
    if (test-path ./config) {
        if ($config -eq $null) {
            fatal "Failed to load config. Cannot proceed, Session Exit."
            Exit
        }
        else {
            Info "Config Loaded successfully"
        }
    }
    else {
        configcreates
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

function configcreate {

}