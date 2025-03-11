#!/bin/bash

# HELPER FUNCTION
move_on() {
    echo ""
    echo -n "Press enter to continue..."
    read -r answer
    echo ""
}

echo "Lesson: While Loops and Case Statements"
move_on

# 1. Basic while loop with exit condition
echo "1. Basic While Loop with Exit Condition:"
echo "This loop runs until you enter 'bye'"
echo "The code:"
echo -e "\twhile [ \"\$INPUT\" != \"bye\" ]"
echo -e "\tdo"
echo -e "\t  read -p \"Type something: \" INPUT"
echo -e "\t  echo \"You entered: \$INPUT\""
echo -e "\tdone"
move_on

INPUT=hello
while [ "$INPUT" != "bye" ]; do
    read -r -p "Type something (try 'bye' to exit): " INPUT
    echo "   You entered: $INPUT"
done
echo "Exited basic while loop!"
move_on

# 2. Infinite while loop with case statement
echo "2. Infinite While Loop with Case Statement:"
echo "This loop runs forever - use Ctrl+C to quit"
echo "The code:"
echo -e "\twhile :"
echo -e "\tdo"
echo -e "\t  read -p \"Ask me something: \" INPUT"
echo -e "\t  case \$INPUT in"
echo -e "\t    hello) echo 'English' ;;"
echo -e "\t    gday)  echo 'Australian' ;;"
echo -e "\t    bonjour) echo 'French' ;;"
echo -e "\t    \"guten tag\") echo 'German' ;;"
echo -e "\t    exit)  break ;;"
echo -e "\t    *)     echo 'Unknown language' ;;"
echo -e "\t  esac"
echo -e "\tdone"
move_on

echo "Let's create a simple language detector!"
echo "Try these commands: hello, gday, bonjour, or anything else"
echo "Type in exit to quit"
move_on

while :; do
    read -r -p "Say hello in your language: " INPUT
    case $INPUT in
    hello) echo "   English" ;;
    gday) echo "   Australian" ;;
    bonjour) echo "   French" ;;
    "guten tag") echo "   German" ;;
    exit) break ;;
    *) echo "   Unknown language: $INPUT" ;;
    esac
done
echo "" # Needed for clean exit after Ctrl+C

# 3. File processing with while read and case
echo "3. File Processing with While Read:"
echo "Let's create a sample file and process it"
echo "Creating myfile.txt with random content..."
echo -e "hello\ngday\nbonjour\nhola\nThis is a test" >myfile.txt
echo "File contents:"
cat myfile.txt
move_on

echo "The code:"
echo -e "\twhile read line"
echo -e "\tdo"
echo -e "\t  case \$line in"
echo -e "\t    hello) echo English ;;"
echo -e "\t    gday)  echo Australian ;;"
echo -e "\t    bonjour) echo French ;;"
echo -e "\t    *)     echo \"Unknown: \$line\" ;;"
echo -e "\t  esac"
echo -e "\tdone < myfile.txt"
move_on

echo "Processing myfile.txt:"
while read -r line; do
    case $line in
    hello) echo "   English" ;;
    gday) echo "   Australian" ;;
    bonjour) echo "   French" ;;
    *) echo "   Unknown Language: $line" ;;
    esac
done <myfile.txt
rm myfile.txt
move_on

# 4. Brace expansion demo
echo "4. Brace Expansion Trick:"
echo "Create multiple directories with brace expansion"
echo "Compare traditional loop vs brace expansion"
move_on

echo "Traditional loop method:"
echo -e "\tfor runlevel in 0 1 2 3 4 5 6 S"
echo -e "\tdo"
echo -e "\t  mkdir rc\${runlevel}.d"
echo -e "\tdone"
echo "Creating directories with loop..."
for runlevel in 0 1 2 3 4 5 6 S; do
    mkdir -p "rc${runlevel}.d"
done
ls -d rc*.d
move_on
echo "Cleaning up..."
rm -rf rc*.d
move_on

echo "Brace expansion method:"
echo -e "\tmkdir rc{0,1,2,3,4,5,6,S}.d"
echo "Creating directories with brace expansion..."
mkdir -p rc{0,1,2,3,4,5,6,S}.d
ls -d rc*.d
move_on
echo "Cleaning up..."
rm -rf rc*.d
move_on

# 5. Nested brace expansion demo
echo "5. Advanced Brace Expansion:"
echo "Create nested directory structure"
echo "Code: mkdir -p {,usr,usr/local}/{bin,sbin,lib}"
move_on

echo "Creating directory structure..."
mkdir -p {,usr,usr/local}/{bin,sbin,lib}
echo "Resulting structure:"
tree -d 2>/dev/null || ls -R | grep : | sed -e 's/://' -e 's/[^-][^\/]*\//--/g'
move_on
echo "Cleaning up..."
rm -rf usr/ bin/ lib/ sbin/
move_on

echo "Lesson complete! You've learned:"
echo "- While loops with conditions"
echo "- Infinite loops with case statements"
echo "- File processing with while read"
echo "- Brace expansion tricks"
echo ""
