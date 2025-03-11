#!/bin/bash

# HELPER FUNCTION
move_on() {
    echo -n "Press enter to continue..."
    read -r answer
    echo ""
}

echo "Lesson: Introduction to For Loops"
move_on

# 1. Basic For Loop (unchanged)
echo "1. Basic For Loop Example:"
echo "The following script will run:"
echo ""
echo -e "\t#!/bin/sh"
echo -e "\tfor i in 1 2 3 4 5"
echo -e "\tdo"
echo -e "\t  echo \"Looping ... number \$i\""
echo -e "\tdone"
move_on

echo '#!/bin/sh
for i in 1 2 3 4 5
do
  echo "Looping ... number $i"
done' >basic_for.sh
chmod +x basic_for.sh
echo "Running the script..."
./basic_for.sh
rm basic_for.sh
move_on

# 2. User Input with Wildcards (modified)
echo "2. Custom For Loop with Your Own Input:"
echo "Creating temporary files temp_1 and temp_2..."
touch temp_1 temp_2
echo -n "Enter space-separated items to loop through (try including *): "
read -r USER_ITEMS
echo "The script will use your input: $USER_ITEMS"
echo "Code:"
echo -e "\t#!/bin/sh"
echo -e "\tfor i in $USER_ITEMS"
echo -e "\tdo"
echo -e "\t  echo \"Looping ... i is set to \$i\""
echo -e "\tdone"
move_on

echo '#!/bin/sh
for i in '"$USER_ITEMS"'
do
  echo "Looping ... i is set to $i"
done' >custom_for.sh
chmod +x custom_for.sh
echo "Running the script..."
./custom_for.sh
echo "Cleaning up temporary files..."
rm custom_for.sh temp_1 temp_2
move_on

# 3. Quoted Wildcard (unchanged)
echo "3. For Loop with Quoted Wildcard:"
echo "Here, the wildcard is quoted, preventing expansion."
echo "The script uses \"*\" instead of *."
echo "Code:"
echo ""
echo -e "\t#!/bin/sh"
echo -e "\tfor i in hello 1 \"*\" 2 goodbye"
echo -e "\tdo"
echo -e "\t  echo \"Looping ... i is set to \$i\""
echo -e "\tdone"
move_on

echo '#!/bin/sh
for i in hello 1 "*" 2 goodbye
do
  echo "Looping ... i is set to $i"
done' >quoted_wildcard_for.sh
chmod +x quoted_wildcard_for.sh
echo "Running the script..."
./quoted_wildcard_for.sh
rm quoted_wildcard_for.sh
move_on

# 4. Variable List (unchanged)
echo "4. Using a Variable for the List:"
echo "The list is stored in a variable, then used in the for loop."
echo "Creating temporary files variable_temp_1 and variable_temp_2..."
touch variable_temp_1 variable_temp_2
echo "Code:"
echo ""
echo -e "\t#!/bin/sh"
echo -e "\tLIST=\"hello 1 * 2 goodbye\""
echo -e "\tfor i in \$LIST"
echo -e "\tdo"
echo -e "\t  echo \"Looping ... i is set to \$i\""
echo -e "\tdone"
move_on

echo '#!/bin/sh
LIST="hello 1 * 2 goodbye"
for i in $LIST
do
  echo "Looping ... i is set to $i"
done' >variable_list_for.sh
chmod +x variable_list_for.sh
echo "Running the script..."
./variable_list_for.sh
echo "Cleaning up..."
rm variable_list_for.sh variable_temp_1 variable_temp_2
move_on

# 5. New C-style Countdown Loop
echo "5. C-style Countdown Loop:"
echo -n "Enter starting number for countdown: "
read -r START
echo "The code will be:"
echo -e "\tfor ((i=$START; i>0; i--))"
echo -e "\tdo"
echo -e "\t  echo \"Countdown: \$i\""
echo -e "\tdone"
move_on

echo '#!/bin/bash
for ((i='"$START"'; i>0; i--))
do
  echo "Countdown: $i"
done' >countdown.sh
chmod +x countdown.sh
echo "Running countdown..."
./countdown.sh
rm countdown.sh
move_on

echo "End of for loop demo. You've mastered different loop types!"
