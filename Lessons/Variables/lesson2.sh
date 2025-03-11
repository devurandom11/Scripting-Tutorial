#!/bin/bash
# Lesson 2: Special Variables and Parameters

# Show script information
echo "1. Script Parameters:"
echo "   Script name: $0"
echo "   First argument: $1"
echo "   Second argument: $2"
echo "   All arguments: $@"
echo "   Argument count: $#"

# Demonstrate shift
echo "2. Shift Demonstration:"
set -- first second third fourth # Set some dummy parameters
count=1
while [ "$#" -gt 0 ]; do
	echo "   Parameter $count: $1"
	shift
	count=$((count + 1))
done

# Exit status demonstration
echo "3. Exit Status:"
ls /non/existent/file 2>/dev/null
echo "   ls exit status: $?"

# Process IDs
echo "4. Process IDs:"
echo "   Current PID: $$"
sleep 2 & # Background process
echo "   Background PID: $!"

# IFS demonstration
echo "5. IFS Example:"
echo "   Enter items separated by colons (e.g., hello:world:example)"
old_IFS="$IFS"
IFS=:
read item1 item2 item3
echo "   Item 1: $item1"
echo "   Item 2: $item2"
echo "   Item 3: $item3"
IFS="$old_IFS"
