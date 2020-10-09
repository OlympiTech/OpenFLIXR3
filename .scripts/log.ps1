function info($message) {
    $time = get-date -format hh:mm:ss
    $logmessage = write-host "[INFO $time ] "-NoNewline 6>&1
    $wholemessage = "$logmessage" + " " + "$message" 6>&1
    Tee-Object -filepath $Logfile -inputObject $wholemessage
}

function FATAL($message) {
    $time = get-date -format hh:mm:ss
    $logmessage = write-host "[FATAL $time ] "-NoNewline 6>&1
    $wholemessage = "$logmessage" + " " + "$message" 6>&1
    Tee-Object -filepath $Logfile -inputObject $wholemessage
}