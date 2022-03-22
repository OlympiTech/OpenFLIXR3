const utils = require("./utils.js");

function INFO(message) {
log("INFO", message)
}

function DEBUG (message){
log(debug, message)
}

function FATAL (message){
  log(fatal, message)
}

function TRACE (message){
log(trace, message)
}

function WARN (message){
log(warn, message)
}

function getLogLevel(levelCode = utils.isRequired(levelCode)) {
  switch (levelCode) {
      case "trace":
          return "trace"
          break;
      case "debug":
          return "debug"
          break;
      case "INFO":
          return "INFO"
          break;
      case "warn":
          return "warn"
          break;
      case "error":
          return "error"
          break;
      case "fatal":
          return "FATAL"
          break;
      default:
          return;
  }
}

function getColor (levelCode = utils.isRequired(levelCode)) {
  switch (levelCode) {
    case "trace":
      return "\x1b[36m"
      break;
    case "debug":
      return "\x1b[33m"
      break;
    case "INFO":
      return "\x1b[32m"
      break;
    case "warn":
      return "\x1b[31m"
      break;
    case "error":
      return "\x1b[31m"
      break;
    case "fatal":
      return "\x1b[31m"
      break;
    default:
      return;
  }
}

function log (level = utils.isRequired("logLevel"), message = utils.isRequired("message to be displayed")) {
  const timestamp = utils.getTimeStamp("timeDate")
  const logType = getLogLevel(level)
  switch (logType) {
    case "trace":
      typeLine = `[TRACE ${timestamp}`
      break;
    case "debug":
      typeLine = `[DEBUG ${timestamp}`
      break;
    case "INFO":
      typeLine = `[INFO ${timestamp}`
      break;
    case "warn":
      typeLine = `[WARN ${timestamp}`
      break;
    case "error":
      TypeLine = `[ERROR ${timestamp}`
      break;
    case "fatal":
      typeLine = `[FATAL ${timestamp}`
      break;
    default:
      console.log("Nope, Something fucked up big time")
      return;
  }
  const logColor = getColor(level)
  console.log(logColor, typeLine + ":" + " " + message + "]")
  // Logging to file next
}

function dbg ($message) {
  if ($debug -eq $true) {
      DEBUG $message
  }
}
function startlog {
  if (!(test-path "$rundir/logs")) {
      dbg "Log directory $rundir/logs does not exist"
      mkdir $rundir/logs
  }
  chmod 755 "$rundir/logs" -R
  chown $chowninfo "$rundir/logs"
  $date = (get-date -format yyyyMMdd)
  $logname = "$date`_openflixr3"
  if (test-path $rundir/logs/$logname) {
      Dbg "Log exists"
  }
  $GLOBAL:logfile = "$rundir/logs/$logname"
  touch $logfile
  chown $chowninfo $logfile
  Out-File -filepath $Logfile -inputObject "-----START OF LOG-----"
}