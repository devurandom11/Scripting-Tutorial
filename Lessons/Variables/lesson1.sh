#!/bin/bash
# Lesson 1: Introduction to Variables

# Basic variable assignment
MY_MESSAGE="Hello World"
echo "1. Simple variable: $MY_MESSAGE"

# Using read to get user input
echo -n "2. What's your name? "
read MY_NAME
echo "Hello $MY_NAME - hope you're well!"

# Variable scope demonstration
echo "3. Variable Scope Example:"

# Create temporary script
echo '#!/bin/sh
echo "   Inside script: MYVAR was $MYVAR"
MYVAR="hi there"
echo "   Inside script: MYVAR is now $MYVAR"' | tee temp_script.sh
chmod +x temp_script.sh
echo -n "Enter any value for a variable: "
read USER_VAR
MYVAR=$USER_VAR
echo "   Main shell: MYVAR=$MYVAR"
echo -n "Press enter to run script without export..."
read ENTER
./temp_script.sh
echo "   Main shell after script: MYVAR=$MYVAR"

echo -n "Press enter to run script with export:"
read ENTER
export MYVAR
./temp_script.sh
echo "   Main shell after script: MYVAR=$MYVAR"

# Clean up
rm temp_script.sh

# Variable formatting and quoting
echo "4. Formatting and Quoting:"
echo -n "Try entering a name with spaces! "
read USER_NAME
echo "   Creating file: ${USER_NAME}_file"
touch "${USER_NAME}_file"
ls -l "${USER_NAME}_file"
