#!/bin/bash

# HELPER FUNCTION
move_on() {
    echo ""
    echo -n "Press enter to continue..."
    read -r answer
    echo ""
}

#---------- CHALLENGE: LOOP MASTER -----------
# Complete the missing parts using concepts from:
# For Loops, While/Case, Brace Expansion

echo "=== Loop Master Challenge ==="

# Section 1: Basic For Loop (Lesson 1)
echo "1. Number Printer:"
echo "   Print numbers 1-5 using a for loop"
___ in ___ # FILL_IN: Loop structure
do
  echo "Number: $i"
done
move_on

# Section 2: While Loop with Condition (Lesson 2)
echo "2. Exit Controlled Loop:"
INPUT="start"
___ [ "$INPUT" != "quit" ] # FILL_IN: While condition
do
  echo -n "Type 'quit' to exit: "
  ___ INPUT # FILL_IN: Read command
  echo "You entered: $INPUT"
done
move_on


# Section 3: Case Statement
echo "3. Language Detector:"
while :; do
    read -r -p "Enter a greeting: " GREETING
    case $GREETING in
    ___) echo "Spanish" ;;   # FILL in for language
    ___) echo "French" ;; # FILL in for language
    quit) break ;;
    *) echo "Unknown language" ;;
    esac
done
move_on

# Section 4: File Processing (Lesson 2)
echo "4. Capitalize Cities:"
echo -e "paris\nlondon\ntokyo" > cities.txt
echo "Processing cities.txt..."
while ___ # FILL_IN: Read line from file
do
  echo "   ${line^}"
done ___ # FILL_IN: File redirection
move_on
rm cities.txt
move_on

# Section 5: Brace Expansion (Lesson 2)
echo "5. Create Directories:"
echo "   Create runlevel directories without loop"
___ # FILL_IN: Brace expansion command
ls -d rc*.d
move_on
rm -rf rc*.d
move_on

# Section 6: Nested Loop (Lesson 1+2)
echo "6. Multiplication Table:"
for i in {1..3}
do
  j=1
  while [ $j -le 3 ]
  do
    echo -n "$((i*j)) "
    ___ # FILL_IN: Increment j
  done
  echo ""
done
move_on

# Section 7: Infinite Loop (Lesson 2)
echo "7. Random Number Game:"
echo "   Exit with Ctrl+C when you're done"
___ # FILL_IN: Infinite loop syntax
do
  num=$((RANDOM%10))
  echo -n "Guess (0-9): "
  read guess
    if [[ "$guess" = "quit" ]]; then
        break
    else
        [ $num -eq "$guess" ] && echo "Correct!" || echo "Wrong! It was $num"
    fi
done
move_on


echo "=== Challenge Complete! Check your implementations ==="
echo ""