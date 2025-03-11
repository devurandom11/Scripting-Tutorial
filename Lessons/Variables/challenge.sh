#!/bin/bash

#---------- CHALLENGE: TRAVEL PLANNER -----------
# Complete the missing parts using concepts from:
# Lesson 1: Variables, quoting, scope
# Lesson 2: Special params, shift, IFS, $!
# Lesson 3: Default values, braces, :=/:-

# Initialize with default location using Lesson 3 technique
___="Paris" # FILL_IN: Set default if not configured

echo "=== Travel Planner ==="
echo "Current destination: $DESTINATION"

# Lesson 1: Get user input with spaces
echo -n "Enter preferred transportation (with spaces): "
___ # FILL_IN: Read into TRANSPORT variable

# Lesson 2: Handle arguments
echo "Processing command line arguments..."
count=1
while [ $# -gt 0 ]; do
    # FILL_IN: Display arguments using special variable
    echo "   Argument $count: ___"
    ___
    count=$((count + 1))
done

# Lesson 3: Prevent variable ambiguity
season="fall"
echo -n "Creating filename: "
echo "___" # FILL_IN: Combine season and _planner without ambiguity

# Lesson 2: IFS splitting
echo "Enter activities (comma-separated): "
old_IFS="$IFS"
___
read activity1 activity2 activity3
IFS="$old_IFS"

# Lesson 3: Default value for undefined variable
echo "Recommended hotel: ${___:-GrandHotel}" # FILL_IN

# Lesson 2: Process IDs
echo "Starting background weather check..."
sleep 2 &
echo "   Planner PID: ___" # FILL_IN current PID
echo "   Weather PID: ___" # FILL_IN background PID

# Lesson 1: Variable scope demonstration
echo '#!/bin/sh
echo "   Subshell TRANSPORT: $TRANSPORT"' >sub.sh
chmod +x sub.sh
echo -n "Running subshell test..."
___ # FILL_IN: Export variable to make it visible in sub.sh
./sub.sh

# Cleanup
rm sub.sh

echo "=== Planning Complete! ==="
