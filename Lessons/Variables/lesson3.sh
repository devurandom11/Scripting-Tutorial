#!/bin/bash
# Lesson 3: Advanced Variable Techniques

# Variable ambiguity example
echo "1. Variable Ambiguity:"
fruit="apple"
echo "   Without braces: \$fruit_s => $fruit_s"
echo "   With braces: \${fruit}s => ${fruit}s"

# Default values demonstration
echo "2. Default Values (:-):"
echo -n "   Enter your name [$(whoami)]: "
read username
echo "   Hello, ${username:-$(whoami)}!"

# Assignment with default values
echo "3. Default Assignment (:=):"
unset city
echo "   City before: $city"
echo "   Your city is: ${city:=Unknown}"
echo "   City after: $city"

# Difference between :- and :=
echo "4. :- vs := Comparison:"
unset var1 var2
echo "   Using :-: ${var1:-default} (var1 remains: ${var1-unset})"
echo "   Using :=: ${var2:=default} (var2 now: $var2)"
