#!/bin/bash

#---------- CHALLENGE: TRAVEL PLANNER -----------
# Complete the missing parts using concepts from:
# Lesson 1: Variables, quoting, scope
# Lesson 2: Special params, shift, IFS, $!
# Lesson 3: Default values, braces, :=/:-

# Initialize with default location using Lesson 3 technique
DESTINATION="${DESTINATION:-Paris}" # Solution: Default value parameter expansion

echo "=== Travel Planner ==="
echo "Current destination: $DESTINATION"

# Lesson 1: Get user input with spaces
echo -n "Enter preferred transportation (with spaces): "
read -r TRANSPORT # Solution: Read with space preservation

# Lesson 2: Handle arguments
echo "Processing command line arguments..."
count=1
while [ $# -gt 0 ]; do
    echo "   Argument ${count}: ${1}" # Solution: $1 parameter
    shift                             # Solution: Shift arguments
    count=$((count + 1))
done

# Lesson 3: Prevent variable ambiguity
season="fall"
echo -n "Creating filename: "
echo "${season}_planner" # Solution: Braces for variable isolation

# Lesson 2: IFS splitting
echo -n "Enter activities (comma-separated): "
old_IFS="$IFS"
IFS=, # Solution: Set IFS to comma
read activity1 activity2 activity3
IFS="$old_IFS"
echo "Planned Activities:"
echo -e "\t- $activity1"
echo -e "\t- $activity2"
echo -e "\t- $activity3"

# Lesson 3: Default value for undefined variable
echo "Recommended hotel: ${HOTEL:-GrandHotel}" # Solution:- operator

# Lesson 2: Process IDs
echo "Starting background weather check..."
sleep 2 &
echo "   Planner PID: $$" # Solution: Current PID
echo "   Weather PID: $!" # Solution: Background PID

# Lesson 1: Variable scope demonstration
echo '#!/bin/sh
echo "   Subshell TRANSPORT: $TRANSPORT"' >sub.sh
chmod +x sub.sh
echo -n "Running subshell test..."
export TRANSPORT # Solution: Export variable
./sub.sh

# Cleanup
rm sub.sh

echo "=== Planning Complete! ==="
