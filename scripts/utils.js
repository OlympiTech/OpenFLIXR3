function getTimeStamp(duration) {
    let date_ob = new Date();
  
    // current date YYYY:MM:DD
    let day = ("0" + date_ob.getDate()).slice(-2);
    let month = ("0" + (date_ob.getMonth() + 1)).slice(-2);
    let year = date_ob.getFullYear();
  
    // Setup for HH:MM:SS
    let hours = date_ob.getHours();
    let minutes = date_ob.getMinutes();
    let seconds = date_ob.getSeconds();
  
    // returns date & time in YYYY-MM-DD HH:MM:SS format
    if (duration === "timeDate") {
    return (year + "-" + month + "-" + day + " " + hours + ":" + minutes + ":" + seconds);
    } else if (duration === "date") {
      return (year + "-" + month + "-" + day);
    }
  }

  function sudoCheck() {
    if ((id -u) === '0') {
        INFO("Sudo running. Continuing.")
    }
    else {
        FATAL("You must run this with SUDO")
        process.exit(1);
    }
}

  // All functions above this line
module.exports = {
    getTimeStamp,
    sudoCheck

}