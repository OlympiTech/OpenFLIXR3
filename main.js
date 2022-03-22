const utils = require("./scripts/utils.js")
const fs = require('fs');
const {INFO, FATAL, DEBUG} = require('./scripts/log.js')


function runtime() {

	const user = process.env.SUDO_USER
	console.log(process.env.SUDO_USER)
	global.rundir = `/home/${user}/.openflixr3`
	chowninfo = `${user} + ":" + ${user}`
	try {
		if (fs)
	} catch(err) {
		FATAL("Failed to create and take ownership of run directory")
		process.exit(1)
	}
	if (fs.accessSync rundir) {
		INFO("Creating run directory")
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