function start-log {
    if (!(test-path ./logs)) {
        mkdir ./logs
    }
    $date = (get-date -format yyyyMMdd)
    $logname = "$date`_openflixr3"
    if (test-path ./logs/$logname) {
        $a = read-host "Log exists. Would you like to overwrite? (Y/N)"
        if ($a -eq "Y") {
            rm ./logs/$logname
        }
        else {
            Write-Warning "Log not overwritten. Cannot log. Exit Session"
            Exit-PSSession
        }
    }
    $logfile = "./logs/$logname"
    touch $logfile
}
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