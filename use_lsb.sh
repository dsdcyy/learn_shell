#!bin/bash
lsb_function="/lib/lsb/init-functions"
[ -f "$lsb_function" ] && source $lsb_function || exit 1

check_params() {
    if [ "$#" -ne 1 ]; then
        log_failure_msg "Usage:$0{must
        be 1 params}"
        exit 1
    fi
}

check_url() {
    wget --spider -q -o /dev/null --tries=1 -T 5 $1
    if [ $? -eq 0 ]; then
        log_success_msg  "$1 is running"
    else
        log_failure_msg  "$1 is down..."
    fi
}

main(){
    check_params $@
    check_url $1
}
main $*
