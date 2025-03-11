#!/bin/bash

# HELPER FUNCTIONS
move_on() {
	echo ""
	echo -n "Press enter to continue..."
	read -r answer
	echo ""
}

echo "Lesson: Special Variables and Parameters"
move_on

# 1. Script Parameters
echo "1. Understanding Script Parameters:"
echo "   Special variables provide information about script arguments:"
echo "   - \$0: Script name"
echo "   - \$1, \$2...: Positional parameters"
echo "   - \$@: All arguments as separate words"
echo "   - \$#: Number of arguments"
echo ""
echo "   Let's demonstrate with some example arguments..."
if [ $# -eq 0 ]; then
	set -- "apple" "banana" "cherry"
	echo "   No arguments provided. Using default: apple banana cherry"
else
	echo "   Using provided arguments: $@"
fi
move_on

echo "   The following commands will run:"
echo -e "\techo \"Script name: \$0\""
echo -e "\techo \"First argument: \$1\""
echo -e "\techo \"Second argument: \$2\""
echo -e "\techo \"All arguments: \$@\""
echo -e "\techo \"Argument count: \$#\""
move_on

echo "   Results:"
echo "   Script name: $0"
echo "   First argument: $1"
echo "   Second argument: $2"
echo "   All arguments: $@"
echo "   Argument count: $#"
move_on

# 2. Shift Demonstration
echo "2. Using Shift to Process Arguments:"
echo "   The shift command moves positional parameters left, discarding \$1"
echo "   This loop will process all arguments until none remain:"
echo ""
echo -e "\tcount=1"
echo -e "\twhile [ \"\$#\" -gt 0 ]; do"
echo -e "\t  echo \"Parameter \$count: \$1\""
echo -e "\t  shift"
echo -e "\t  count=\$((count + 1))"
echo -e "\tdone"
move_on

echo "   Processing current arguments: $@"
count=1
while [ "$#" -gt 0 ]; do
	echo "   Parameter $count: $1"
	shift
	count=$((count + 1))
done
echo "   All parameters processed!"
move_on

# 3. Exit Status
echo "3. Understanding Exit Status:"
echo "   Every command returns an exit status (0 = success, non-zero = error)"
echo "   This example runs 'ls' on a non-existent file and shows its exit status"
move_on
echo "   Running: ls /non/existent/file 2>/dev/null"
ls /non/existent/file 2>/dev/null
status=$?
echo "   ls exit status: $status"
[ $status -eq 0 ] && echo "   Unexpected success!" || echo "   Expected error as shown by non-zero status"
echo "   (Note: 2>/dev/null hides the error message)"
move_on

# 4. Process IDs
echo "4. Process Identification Numbers:"
echo "   Special variables track process IDs:"
echo "   - \$\$ = Current shell PID"
echo "   - \$! = Last background process PID"
move_on
echo "   Current shell PID: $$"
echo "   Starting sleep in background..."
sleep 2 &
bg_pid=$!
echo "   Background process PID: $bg_pid"
move_on

# 5. IFS Demonstration
echo "5. Custom Field Splitting with IFS:"
echo "   IFS (Internal Field Separator) controls how input is split"
echo "   We'll change IFS to colon for this demonstration"
echo ""
echo "   Current IFS value: '$(echo "$IFS" | cat -v)' (normally whitespace)"
echo "   Setting IFS to ':' for this section"
old_IFS="$IFS"
IFS=:
echo -n "   Enter 3 colon-separated items (e.g., red:green:blue): "
read -r item1 item2 item3
echo ""
echo "   Input split into:"
echo "   Item 1: $item1"
echo "   Item 2: $item2"
echo "   Item 3: $item3"
IFS="$old_IFS"
echo "   IFS restored to original value"
move_on

echo "Lesson complete! You've mastered special variables and parameters!"
echo ""
