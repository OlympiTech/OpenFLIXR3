function gitd {
    $lastcommit = (git log --format="%as" -1)   
    (git log --format="%as`t%h`t%an`t%s" -3 --skip=1 --before=$lastcommit) | ConvertFrom-Csv -Delimiter "`t" -Header ("Date","Id","Author","Subject")

    #rest of script
}

function gitu {
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

function gitc {
    $GIT_DIFF = git diff
    if ($GIT_DIFF -ne $null) {
        WARN "OpenFLIXR Setup Script doesn't match with the repository's branch.`n"
        $r = (read-host "Recommend rebasing to latest commit. Would you like to proceed? [Y/N]")
        if ($r -eq "Y") {
            Random Change
            git reset --hard
            WARN "System reset and updated to the latest Commit"
            $path = git rev-parse --show-toplevel
            chown -R $chowninfo $path
        } elseif ($r -eq "N") {
            WARN "Local changes to the code is not supported by OlympiTech. If you have issues, you will be asked to reset to the latest commit before support is offered."
            write-host "`nPlease press any key to accept liability."
            read-host
        } else {
            return "Please answer Y or N" ;
        }
    }
    else {
        dbg "The local files are identical to the base commit."
    }
}