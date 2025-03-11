#!/bin/bash

REPORT_FILE="system_baseline_$(date +%Y%m%d_%H%M%S).txt"

create_report() {
    echo "=== System Baseline Report ===" >"$REPORT_FILE"
    echo "Generated: $(date)" >>"$REPORT_FILE"
    echo "" >>"$REPORT_FILE"
}

get_users() {

}

get_groups() {

}

get_sudoers() {

}

get_services() {

}

get_open_ports() {

}

get_scheduled_tasks() {

}

get_hostname_ip() {

}

main() {
    create_report
    get_users
    get_groups
    get_sudoers
    get_services
    get_open_ports
    get_scheduled_tasks
    get_hostname_ip

    echo "Baseline report created: $REPORT_FILE"
}

main
