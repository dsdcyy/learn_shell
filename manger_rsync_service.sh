#!/bin/bash
lsb_function="/lib/lsb/init-functions"
# shellcheck source=/lib/lsb/init-functions
[ -f "$lsb_function" ] && source "$lsb_function" || exit 1

check_params() {
  if [ "$#" -ne 1 ]; then
    log_failure_msg "Usage:$0{start|stop|restart}"
    exit 1
  fi
}

check_run_as_root() {
  uid=$(id -u)
  if [ "${uid}" -eq 0 ]; then echo "run as sudo"; else
    log_failure_msg "Please run as root!"
    exit 1
  fi
}

check_rsync_status() {
  rsync_status=$(pgrep rsync)
  [ -n "$rsync_status" ] && return 0 || return 1
}

start() {
  # check_rsync_status
  if check_rsync_status; then
    log_failure_msg "rsync is already running"
    exit 1
  else
    rsync --daemon
    sleep 1
    echo "rsync running..."
  fi
}

stop() {
  # check_rsync_status
  if check_rsync_status; then
    killall rsync
    sleep 1
    echo "rsync stopped..."
  else
    log_failure_msg "rsync is already stopping..."
  fi
}

restart() {
  # check_rsync_status
  if check_rsync_status; then
    killall rsync
    sleep 1
    echo "rsync stopped..."
    rsync --daemon
    echo "rsync starting..."
  else
    echo "rsync stopped..."
    sleep 1
    rsync --daemon
    echo "rsync running..."
  fi
  echo "Restart..."
}

main() {
  check_run_as_root

  check_params "$@"

  case $1 in
  'start')
    start
    ;;
  'stop')
    stop
    ;;
  'restart')
    restart
    ;;
  *)
    log_failure_msg "Usage:$0{start|stop|restart}"
    exit 1
    ;;
  esac
}

# check_rsync_status
main "$*"
