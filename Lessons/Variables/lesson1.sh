#!/bin/bash

# HELPER FUNCTIONS
move_on() {
    echo -n "Press enter to continue..."
    read -r answer
    echo ""
}

display_code() {
    echo "The following code will be executed:"
    echo -e "\n\t#!/bin/bash"
    while read -r line; do
        echo -e "\t$line"
    done <<<"$1"
    echo ""
}

# Lesson Header
echo "Lesson: Introduction to Bash Variables"
move_on

# 1. Basic Variable Assignment
echo "1. Basic Variable Assignment"
display_code 'MY_MESSAGE="Hello World"
echo "Simple variable: $MY_MESSAGE"'

MY_MESSAGE="Hello World"
echo "   Actual output: $MY_MESSAGE"
echo "   Explanation: We created a variable MY_MESSAGE and assigned it a string value"
move_on

# 2. User Input with Read
echo "2. Getting User Input with 'read'"
display_code 'echo -n "What'\''s your name? "
read MY_NAME
echo "Hello $MY_NAME!"'

echo -n "   What's your name? "
read MY_NAME
echo "   Actual output: Hello $MY_NAME!"
echo "   Explanation: The read command stores user input in a variable"
move_on

# 3. Variable Scope Demonstration
echo "3. Understanding Variable Scope"
echo "   We'll demonstrate how variable exporting affects subprocesses:"
move_on

display_code 'echo "   Inside script: MYVAR was $MYVAR"
MYVAR="hi there"
echo "   Inside script: MYVAR is now $MYVAR"'

# Create temporary script
echo '#!/bin/bash
echo "   Inside script: MYVAR was $MYVAR"
MYVAR="hi there"
echo "   Inside script: MYVAR is now $MYVAR"' >temp_script.sh
chmod +x temp_script.sh

echo -n "   Enter any value for MYVAR: "
read USER_VAR
MYVAR=$USER_VAR
echo "   Main shell: MYVAR=$MYVAR"
move_on

echo "   First test: Running script WITHOUT export..."
echo "   Expected outcome: The script won't see our MYVAR"
echo -n "   Press enter to run..."
read -r
./temp_script.sh
echo "   Main shell after script: MYVAR=$MYVAR (no change)"
move_on

echo "   Second test: Running script WITH export..."
echo "   Expected outcome: The script will see original value but changes won't affect parent"
echo -n "   Press enter to export and run..."
read -r
export MYVAR
./temp_script.sh
echo "   Main shell after script: MYVAR=$MYVAR (still unchanged)"
move_on

# Clean up
rm temp_script.sh
echo "   Cleaned up temporary script"
move_on

# 4. Formatting and Quoting
echo "4. Variable Formatting and Quoting"
echo "   Proper quoting is essential for handling special characters and spaces"
display_code 'echo -n "Enter name with spaces: "
read USER_NAME
echo "Creating file: ${USER_NAME}_file"
touch "${USER_NAME}_file"'

echo -n "   Try entering a name with spaces (e.g., 'John Doe'): "
read USER_NAME
echo "   Creating file: ${USER_NAME}_file"
touch "${USER_NAME}_file"
echo "   File created with contents:"
ls -l "${USER_NAME}_file"
echo "   Explanation: Quotes preserve spaces in filenames"

# Clean up user-created file
rm "${USER_NAME}_file"
echo "   Cleaned up example file"
move_on

echo "Lesson complete! You've learned:"
echo "- Variable assignment"
echo "- User input handling"
echo "- Variable scoping"
echo "- Proper quoting techniques"
