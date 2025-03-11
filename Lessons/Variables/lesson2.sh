#!/bin/bash

# HELPER FUNCTIONS - IGNORE
move_on() {
	echo -n "Press enter to continue..."
	read answer
	echo ""
	export answer
}
# Lesson 2: Special Variables and Parameters

# Show script information
echo "1. Script Parameters:"
echo "   Script name: $0"
echo "   First argument: $1"
echo "   Second argument: $2"
echo "   All arguments: $@"
echo "   Argument count: $#"
move_on

# Demonstrate shift
echo "2. Shift Demonstration:"

count=1
while [ "$#" -gt 0 ]; do
	echo "   Parameter $count: $1"
	shift
	count=$((count + 1))
done
move_on

# Exit status demonstration
echo "3. Exit Status:"
ls /non/existent/file 2>/dev/null
echo "   ls exit status: $?"
move_on

# Process IDs
echo "4. Process IDs:"
echo "   Current PID: $$"
sleep 2 & # Background process
echo "   Background PID: $!"
move_on

# IFS demonstration
echo "5. IFS Example:"
echo "   Enter 3 items separated by colons (e.g., hello:world:example)"
old_IFS="$IFS"
IFS=:
read item1 item2 item3
echo "   Item 1: $item1"
echo "   Item 2: $item2"
echo "   Item 3: $item3"
IFS="$old_IFS"
