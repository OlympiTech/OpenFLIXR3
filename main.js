const utils = require("./scripts/utils.js")
const fs = require('fs');
const {INFO, FATAL, DEBUG} = require('./scripts/log.js')


function runtime() {

	const user = process.env.SUDO_USER
	console.log(process.env.SUDO_USER)
	global.rundir = `/home/${user}/.openflixr3`
	chowninfo = `${user} + ":" + ${user}`
	try {
		if (fs.existsSync(rundir)) {
			DEBUG("Run directory exists, moving onto the next step.")
		} else if (!(fs.existsSync(rundir))) {
			DEBUG("Run directory does not exist, creating and continuing.")
			fs.mkdirSync(rundir)
		}
	} catch(err) {
		FATAL("Failed to create and take ownership of run directory")
		throw err
	}
}

function main() {
	utils.sudoCheck() // Checks the script was launched using SUDO
	runtime() // Initialises the run directory under the user profile
	startlog // Initialises the logging process	
}

main()