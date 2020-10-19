class systems {
    $sonarrInstalled = $false
    $radarrinstalled = $false
    $bazarrInstalled = $false
    $nzbgetInstalled = $false
    $nzbHydraInstalled = $false
    $delugeInstalled = $false
    $jackettInstalled = $false
}

class toInstall {
    [int]$sonarr = 0
    [int]$radarr = 0
    [int]$bazarr = 0
    [int]$nzbget = 0
    [int]$nzbHydra = 0
    [int]$deluge = 0
    [int]$jackett = 0
}

class ports {
    [int]$sonarr = 10001
    [int]$radarr = 10002
    [int]$bazarr = 10003
    [int]$nzbget = 10004
    [int]$nzbHydra = 10005
    [int]$deluge = 10006
    [int]$jackett = 10007
}

class downloadType {
    [bool]$nzb = 0
    [bool]$torrent = 0
    [bool]$both = 0
}