function GetLogLevel($logLevel) {
    switch ($logLevel) {
        ( { $logLevel -ieq 'trace' -or $logLevel -ieq 'trc' }) { return "trace" }
        ( { $logLevel -ieq 'debug' -or $logLevel -ieq 'dbg' }) { return "debug" }
        ( { $logLevel -ieq 'info' -or $logLevel -ieq 'inf' }) { return "info" }
        ( { $logLevel -ieq 'warn' -or $logLevel -ieq 'wrn' }) { return "warn" }
        ( { $logLevel -ieq 'error' -or $logLevel -ieq 'err' }) { return "error" }
        ( { $logLevel -ieq 'FATAL' -or $logLevel -ieq 'ftl' }) { return "FATAL" }
        ( { $logLevel -ieq 'none' -or $logLevel -ieq 'non' }) { return $null }
        Default { return $null }
    }
}

function GetLogColor($logLevel) {
    switch ($logLevel) {
        ( { $logLevel -ieq 'trace' -or $logLevel -ieq 'trc' }) { return "DarkCyan" }
        ( { $logLevel -ieq 'debug' -or $logLevel -ieq 'dbg' }) { return "yellow" }
        ( { $logLevel -ieq 'info' -or $logLevel -ieq 'inf' }) { return "green" }
        ( { $logLevel -ieq 'warn' -or $logLevel -ieq 'wrn' }) { return "red" }
        ( { $logLevel -ieq 'error' -or $logLevel -ieq 'err' }) { return "red" }
        ( { $logLevel -ieq 'FATAL' -or $logLevel -ieq 'ftl' }) { return "red" }
        ( { $logLevel -ieq 'none' -or $logLevel -ieq 'non' }) { return $null }
        Default { return $null }
    }
}

function log {
    param (
        [Parameter(Mandatory=$true)]
        [string] $loglevel,
        [Parameter(Mandatory=$true)]
        [string] $message
    )
    #variables
    $time = (get-date -format hh:mm:ss)
    $logtype = getloglevel $loglevel
    $typeline = switch ($logtype) {
        trace { "[TRACE $time] "}
        debug { "[DEBUG $time] "}
        info { "[INFO $time] "}
        warn { "[WARN $time] "}
        error { "[ERROR $time] "}
        fatal { "[FATAL $time] "}
    }
    $color = GetLogColor $loglevel
    write-host $typeline -ForegroundColor $color -NoNewline
    write-host $message
    #File logging
    $wholemessage = "$typeline" + " " + "$message" 6>&1
    Out-File -FilePath $logfile -Append -InputObject $wholemessage
}
function INFO ($message){
    log INFO $message
}

function DEBUG ($message){
    log DEBUG $message
}

function FATAL ($message){
    log FATAL $message
}

function TRACE ($message){
    log TRACE $message
}

function WARN ($message){
    log WARN $message
}

function enabledebug () {
    if ((Read-Host "Enable Debug Log? `[Y/N`]") -eq "Y") {
        $debug = $TRUE
    }
    startup
}

function dbg ($message) {
    if ($debug -eq $true) {
        DEBUG $message
    }
}

function start-log {
    if (!(test-path "$rundir/logs")) {
        dbg "Log directory $rundir/logs does not exist"
        mkdir $rundir/logs
    }
    chmod 755 "$rundir/logs" -R
    $date = (get-date -format yyyyMMdd)
    $logname = "$date`_openflixr3"
    if (test-path $rundir/logs/$logname) {
        Dbg "Log exists"
    }
    $GLOBAL:logfile = "$rundir/logs/$logname"
    touch $logfile
    Out-File -filepath $Logfile -inputObject "-----START OF LOG-----"
}