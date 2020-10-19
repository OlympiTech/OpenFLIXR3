function enabledebug () {
    if ((Read-Host "Enable Debug Log? `[Y/N`]") -eq "Y") {
        $debug = $TRUE
    }
    startup
}

function debugging ($message) {
    if ($debug -eq $true) {
        DEBUG $message
    }
}

function start-log {
    if (!(test-path ./logs)) {
        mkdir ./logs
    }
    $date = (get-date -format yyyyMMdd)
    $logname = "$date`_openflixr3"
    if (test-path ./logs/$logname) {
        DEBUGGING "Log exists"
    }
    $GLOBAL:logfile = "./logs/$logname"
    touch $logfile
    Out-File -filepath $Logfile -inputObject "-----START OF LOG-----"
}
function info($message) {
    $time = get-date -format hh:mm:ss
    $logmessage = write-host "[INFO $time ] " -ForegroundColor Green -NoNewline 6>&1
    $wholemessage = "$logmessage" + " " + "$message" 6>&1
    Tee-Object -append -filepath $Logfile -inputObject $wholemessage
}

function FATAL($message) {
    $time = get-date -format hh:mm:ss
    $logmessage = write-host "[FATAL $time ] " -ForegroundColor Red -NoNewline 6>&1
    $wholemessage = "$logmessage" + " " + "$message" 6>&1
    Tee-Object -append -filepath $Logfile -inputObject $wholemessage
}

function DEBUG($message) {
    $time = get-date -format hh:mm:ss
    $logmessage = write-host "[DEBUG $time ] " -ForegroundColor Yellow -NoNewline 6>&1
    $wholemessage = "$logmessage" + " " + "$message" 6>&1
    Tee-Object -append -filepath $Logfile -inputObject $wholemessage
}