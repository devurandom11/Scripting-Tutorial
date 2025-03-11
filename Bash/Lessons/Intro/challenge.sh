#!/bin/bash
#
# Lesson 1 -- Bash Basics
#
print_command() {
	echo "Output of command: $1"
}

# What happens under these scenarios?

print_command "echo \"Hello       World\""
read answer
echo "Hello       World"
echo ""

print_command "echo \"Hello World\""
read answer
echo "Hello World"
echo ""

print_command "echo \"Hello * World\""
read answer
echo "Hello * World"
echo ""

print_command "echo Hello * World"
read answer
echo Hello * World
echo ""

print_command "echo Hello World"
read answer
echo Hello World
echo ""

print_command "echo \"Hello\" World"
read answer
echo "Hello" World
echo ""

print_command "echo Hello \"     \" World"
read answer
echo Hello "     " World
echo ""

print_command "echo \"Hello \"*\" World\""
read answer
echo "Hello "*" World"
echo ""

print_command "echo \$(hello) world"
read answer
echo $(hello) world
echo ""

print_command "echo 'hello' world"
read answer
echo 'hello' world
echo ""
