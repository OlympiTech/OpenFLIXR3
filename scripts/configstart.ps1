# class systems {
#     $sonarrInstalled = $false
#     $radarrinstalled = $false
#     $bazarrInstalled = $false
#     $nzbgetInstalled = $false
#     $nzbHydraInstalled = $false
#     $delugeInstalled = $false
#     $jackettInstalled = $false
# }

# class toInstall {
#     [int]$sonarr = 0
#     [int]$radarr = 0
#     [int]$bazarr = 0
#     [int]$nzbget = 0
#     [int]$nzbHydra = 0
#     [int]$deluge = 0
#     [int]$jackett = 0
# }

$configports = [PSCustomObject]@{
        sonarr = "10001"
        radarr = "10002"
        bazarr = "10003"
        nzbget = "10004"
        nzbHydra = "10005"
        deluge = "10006"
        jackett = "10007"
    }

$configDownloadType = [pscustomobject]@{
    nzb = "0"
    torrent = "0"
    both = "0"
}

$configinstall = [pscustomobject]@{
    state = "$false"
}