get-location "/opt/openflixr3"

$scripts = Get-ChildItem "./.scripts"
foreach ($file in $scripts) {
    . $file
}
