#!/bin/bash
# HELPER FUNCTIONS - IGNORE
move_on() {
    echo ""
    echo -n "Press enter to continue..."
    read -r answer
    echo ""
}

echo "Lesson 3: Advanced Variable Techniques"
move_on

# 1. Variable Ambiguity
echo "1. Variable Ambiguity Prevention with Braces"
echo "When using variables adjacent to other text, we need {} to show where the variable ends."
echo ""
echo "Example problem:"
echo -e "\tfruit=\"apple\""
echo -e "\techo \"I have many \$fruit_s\"   # Tries to find variable 'fruit_s'"
echo -e "\techo \"I have many \${fruit}s\"  # Properly references 'fruit'"
move_on

echo -n "Let's try it! Enter a fruit: "
read -r fruit
echo ""
echo "Testing without braces:"
echo "   echo \"I have many \$fruit_s\" => I have many $fruit_s"
echo ""
echo "Testing with braces:"
echo "   echo \"I have many \${fruit}s\" => I have many ${fruit}s"
move_on

# 2. Default Values (:-)
echo "2. Using Default Values with :-"
echo "This syntax provides fallback values for unset/empty variables:"
echo -e "\t\${variable:-default}"
echo ""
echo "First, let's try when you provide a value:"
echo -n "Enter your name [default: $(whoami)]: "
read -r username
echo ""
echo "   echo \"Hello, \${username:-$(whoami)}\" => Hello, ${username:-$(whoami)}"
move_on

echo "Now let's test with empty input:"
echo -n "Press enter without typing anything: "
read -r username
echo ""
echo "   echo \"Hello, \${username:-$(whoami)}\" => Hello, ${username:-$(whoami)}"
echo "Key point: The variable remains unset/empty after using :-"
move_on

# 3. Default Assignment (:=)
echo "3. Setting Default Values with :="
echo "This syntax both uses AND SETS the default value:"
echo -e "\t\${variable:=default}"
echo ""
echo "Let's see it in action with an unset variable:"
unset city
echo "   Start: city is unset"
echo "   echo \"\${city:=Hackerville}\" => ${city:=Hackerville}"
echo "   Now city is: $city"
move_on

# 4. :- vs := Comparison
echo "4. :- vs := Side-by-Side Comparison"
echo "Creating two unset variables:"
unset var1 var2
echo ""
echo "Testing \${var1:-default}:"
echo "   Result: ${var1:-default}"
echo "   var1 after: ${var1-unset (still not set)}"
echo ""
echo "Testing \${var2:=default}:"
echo "   Result: ${var2:=default}"
echo "   var2 after: $var2"
echo ""
echo "Key difference: := permanently sets the variable, :- just uses the default temporarily"
move_on

echo "Advanced variable techniques mastered! Great work learning:"
echo " - Variable ambiguity prevention"
echo " - Default values with :-"
echo " - Default assignment with :="
echo " - Difference between temporary and permanent defaults"
echo ""
