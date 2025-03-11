#!/bin/bash
# VARIABLE MASTERY CHALLENGE

# === INSTRUCTIONS ===
# Complete the script using concepts from lessons 1-3:
# 1. Variable assignment/quoting
# 2. Special parameters
# 3. Default values
# 4. Variable scope
# 5. IFS/parsing

# === START CHALLENGE ===
echo "=== Variable Challenge ==="

# Task 1: Handle arguments with default (Lesson 3)
# If no arguments passed, use "apple:banana cherry"
FILL_1=${@:-"apple:banana cherry"}

# Task 2: Split first item by colon (Lesson 2/3)
IFS=:
read fruit1 fruit2 <<<"$FILL_2"

# Task 3: Preserve space in second item (Lesson 1)
third_item="FILL_3"
echo "  Fruit Bowl: $fruit1, $fruit2, and $third_item"

# Task 4: Process remaining args (Lesson 2)
echo "Extra items:"
while [ "$#" -gt 0 ]; do
    echo "  - $FILL_4"
    shift
done

# Task 5: Child script (Lesson 1/3)
export fruit2 # Make available to child script
./challenge_helper.sh "$FILL_5"

# === CLEANUP ===
unset IFS
