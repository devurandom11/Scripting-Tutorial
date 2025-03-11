#!/bin/bash
# HELPER FUNCTION

move_on() {
    echo ""
    echo -n "Press enter to continue..."
    read -r answer
    echo ""
}
#---------- SOLUTION: LOOP MASTER -----------

echo "=== Loop Master Challenge ==="

# Section 1: Basic For Loop
echo "1. Number Printer:"
for i in 1 2 3 4 5; do # FILL: for i in 1 2 3 4 5
    echo "Number: $i"
done
move_on

# Section 2: While Loop with Condition
echo "2. Exit Controlled Loop:"
INPUT="start"
while [ "$INPUT" != "quit" ]; do # FILL: while [ "$INPUT" != "quit" ]
    echo -n "Type 'quit' to exit: "
    read INPUT # FILL: read INPUT
    echo "You entered: $INPUT"
done
move_on

# Section 3: Case Statement
echo "3. Language Detector:"
while :; do
    read -r -p "Enter a greeting: " GREETING
    case $GREETING in
    hola) echo "Spanish" ;;   # FILL: hola
    bonjour) echo "French" ;; # FILL: bonjour
    quit) break ;;
    *) echo "Unknown language" ;;
    esac
done
move_on

# Section 4: File Processing
echo "4. Capitalize Cities:"
echo -e "paris\nlondon\ntokyo" >cities.txt
echo "Processing cities.txt..."
while read line; do # FILL: read line
    echo "   ${line^}"
done <cities.txt # FILL: < cities.txt
rm cities.txt
move_on

# Section 5: Brace Expansion
echo "5. Create Directories:"
echo "   Create runlevel directories without loop"
mkdir rc{0,1,2,3,4,5,6,S}.d # FILL: mkdir rc{0,1,2,3,4,5,6,S}.d
ls -d rc*.d
move_on
rm -rf rc*.d
move_on

# Section 6: Nested Loop
echo "6. Multiplication Table:"
for i in {1..3}; do
    j=1
    while [ $j -le 3 ]; do
        echo -n "$((i * j)) "
        j=$((j + 1)) # FILL: j=$((j+1)) or ((j++))
    done
    echo ""
done
move_on

# Section 7: Infinite Loop
echo "7. Random Number Game:"
echo "   Exit with Ctrl+C when you're done"
while :; do # FILL: while : or while true
    num=$((RANDOM % 10))
    echo -n "Guess (0-9): "
    read guess
    if [[ "$guess" = "quit" ]]; then
        break
    else
        [ $num -eq "$guess" ] && echo "Correct!" || echo "Wrong! It was $num"
    fi
done
move_on

echo "=== Challenge Complete! ==="
echo ""
