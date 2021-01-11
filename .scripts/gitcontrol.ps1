function git-downgrade {
    $lastcommit = (git log --format="%as" -1)   
    (git log --format="%as`t%h`t%an`t%s" -3 --skip=1 --before=$lastcommit) | ConvertFrom-Csv -Delimiter "`t" -Header ("Date","Id","Author","Subject")

    #rest of script
}



$commits = (git log --format="%ai`t%h`t%an`t%s" -3) | ConvertFrom-Csv -Delimiter "`t" -Header ("Date","Id","Author","Subject")

$lastcommit = (git log --format="%as" -1)   
    (git log --format="%as`t%h`t%s" -3 --skip=1 --before=$lastcommit) | ConvertFrom-Csv -Delimiter "`t" -Header ("Date","Id","Subject")

function git-upgrade {
    $gitremote = (git rev-parse --short origin)
    $gitlocal = (git rev-parse --short HEAD)

    If (!($gitlocal -eq $gitremote)) {
        INFO "There is a new update `"$git-remote`"" >> $null
        Write-Host "`n`tThere is a new update `"$gitremote`" `n" -ForegroundColor Magenta
        $r = read-Host "`tDo you want to apply the update? [Y/N]"
    }
    if ($r -eq "Y") {
        git pull
    } elseif ($r -eq "N") {
        #continue down the list
    } else {
        return "Please answer Y or N" ;
    }
}

$GIT_DIFF = git diff
if ($GIT_DIFF -ne $null) {
    write-host "OpenFLIXR Setup Script doesn't match with the repository's branch."
} else {
    write-host whoopee
}