const utils = require("./scripts/utils.js")


function runtime() {

	const userInfo = process.env.SUDO_USER
	console.log(process.env.SUDO_USER)
	const user = $userinfo.value 
	global.rundir = `/home/${user}/.openflixr3`
	$script:chowninfo = `$user + ":" + $user`
	if (!(test-path $rundir)) {
		write-host "Creating run directory"
		mkdir "$rundir" || Write-host "Failed"
		chown $chowninfo $rundir || Write-host "Failed"
	}
}

function main() {
	runtime // Initialises the run directory under the user profile
	startlog // Initialises the logging process'
	utils.sudoCheck() // Checks the script was launched using SUDO
}

main()