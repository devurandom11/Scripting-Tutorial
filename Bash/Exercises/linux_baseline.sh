#!/bin/bash

REPORT_FILE="system_baseline_$(date +%Y%m%d_%H%M%S).txt"

create_report() {
    echo "=== System Baseline Report ===" > "$REPORT_FILE"
    echo "Generated: $(date)" >> "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"
}

get_hostname_ip() {
    echo "[+] Hostname and IP" >> "$REPORT_FILE"
    # FILL IN LOGIC
    echo "" >> "$REPORT_FILE"
}

get_users() {
    echo "[+] Users" >> "$REPORT_FILE"
    echo "=== Regular Users ===" >> "$REPORT_FILE"
    # FILL IN LOGIC 
    echo "" >> "$REPORT_FILE"
    echo "=== Admin Users ===" >> "$REPORT_FILE"
    # FILL IN LOGIC 
    echo "" >> "$REPORT_FILE"
}

get_groups() {
    echo "[+] Groups" >> "$REPORT_FILE"
    # FILL IN LOGIC
    echo "" >> "$REPORT_FILE"
}

get_sudoers() {
    echo "[+] Sudoers and Admin Groups" >> "$REPORT_FILE"
    echo "=== Sudoers File Contents ===" >> "$REPORT_FILE"
    # FILL IN LOGIC 
    echo "" >> "$REPORT_FILE"
    echo "=== Admin Group Members ===" >> "$REPORT_FILE"
    # FILL IN LOGIC
    echo "" >> "$REPORT_FILE"
}

get_services() {
    echo "[+] Services" >> "$REPORT_FILE"
    echo "=== Enabled Services ===" >> "$REPORT_FILE"
    # FILL IN LOGIC 
    echo "" >> "$REPORT_FILE"
    echo "=== Running Services ===" >> "$REPORT_FILE"
    # FILL IN LOGIC
    echo "" >> "$REPORT_FILE"
}

get_open_ports() {
    echo "[+] Open Ports" >> "$REPORT_FILE"
    # FILL IN LOGIC
    echo "" >> "$REPORT_FILE"
}

get_scheduled_tasks() {
    echo "[+] Scheduled Tasks" >> "$REPORT_FILE"
    echo "=== System Crontabs ===" >> "$REPORT_FILE"
    # FILL IN LOGIC 
    echo "" >> "$REPORT_FILE"
    echo "=== User Crontabs ===" >> "$REPORT_FILE"
    # FILL IN LOGIC
    echo "" >> "$REPORT_FILE"
}


main() {
    create_report
    get_hostname_ip
    get_users
    get_groups
    get_sudoers
    get_services
    get_open_ports
    get_scheduled_tasks
    
    echo "Baseline report created: $REPORT_FILE"
}

main