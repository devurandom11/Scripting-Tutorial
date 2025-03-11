#!/bin/bash
# HELPER FUNCTIONS - IGNORE
move_on() {
    echo -n "Press enter to continue..."
    read answer
    echo ""
    export answer
}

# Lesson 3: Advanced Variable Techniques

# Variable ambiguity example
echo "1. Variable Ambiguity:"
echo -n "Enter the name of a fruit: "
read ANSWER
fruit="$ANSWER"
echo "   Without braces: \$fruit_s => $fruit_s"
echo "   With braces: \${fruit}s => ${fruit}s"
move_on

# Default values demonstration
echo "2. Default Values (:-):"
echo -n "   Enter your name [$(whoami)]: "
read username
echo ""
echo "   Hello, ${username:-$(whoami)}!"
echo -n "   Just press enter without typing anything: "
read username
echo ""
echo "   Hello, ${username:-$(whoami)}!"
move_on

# Assignment with default values
echo "3. Default Assignment (:=):"
unset city
echo "   City before: $city"
echo "   Your city is: ${city:=Hackerville}"
echo "   City after: $city"
move_on

# Difference between :- and :=
echo "4. :- vs := Comparison:"
unset var1 var2
echo "   Using :-: ${var1:-default} (var1 remains: ${var1-unset})"
echo "   Using :=: ${var2:=default} (var2 now: $var2)"
