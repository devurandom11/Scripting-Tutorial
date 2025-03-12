# Lesson 1

# HELPER FUNCTION
function Move-On {
    Write-Host ""
    $null = Read-Host -Prompt "Press enter to continue..."
    Write-Host ""
}

Write-Host "Lesson: While Loops and Switch Statements"
Move-On

# 1. Basic while loop with exit condition
Write-Host "1. Basic While Loop with Exit Condition:"
Write-Host "This loop runs until you enter 'bye'"
Write-Host "The code:"
Write-Host "`$USER_INPUT = 'hello'"
Write-Host "while (`$USER_INPUT -ne 'bye') {"
Write-Host "    `$USER_INPUT = Read-Host 'Type something (try ''bye'' to exit)'"
Write-Host "    Write-Host '   You entered: `$USER_INPUT'"
Write-Host "}"
Move-On

$USER_INPUT = 'hello'
while ($USER_INPUT -ne 'bye') {
    $USER_INPUT = Read-Host "Type something (try 'bye' to exit)"
    Write-Host "   You entered: $USER_INPUT"
}
Write-Host "Exited basic while loop!"
Move-On

# 2. Infinite while loop with case statement
Write-Host "2. Infinite While Loop with Switch Statement:"
Write-Host "This loop runs forever - use Ctrl+C to quit"
Write-Host "The code:"
Write-Host "while (`$true) {"
Write-Host "    `$USER_INPUT = Read-Host 'Say hello in your language'"
Write-Host "    switch -CaseSensitive (`$USER_INPUT) {"
Write-Host "        'hello'   { Write-Host '   English' }"
Write-Host "        'gday'    { Write-Host '   Australian' }"
Write-Host "        'bonjour' { Write-Host '   French' }"
Write-Host "        'guten tag' { Write-Host '   German' }"
Write-Host "        'exit'    { break }"
Write-Host "        default   { Write-Host '   Unknown language: `$USER_INPUT' }"
Write-Host "    }"
Write-Host "}"
Move-On

Write-Host "Let's create a simple language detector!"
Write-Host "Try these commands: hello, gday, bonjour, or anything else"
Write-Host "Type 'exit' to quit"
Move-On

:language while ($true) {
    $USER_INPUT = Read-Host "Say hello in your language"
    switch -CaseSensitive ($USER_INPUT) {
        'hello' { Write-Host "   English" }
        'gday' { Write-Host "   Australian" }
        'bonjour' { Write-Host "   French" }
        'guten tag' { Write-Host "   German" }
        'exit' { break language }
        default { Write-Host "   Unknown language: $USER_INPUT" }
    }
}
Write-Host ""
Move-On

# 3. File processing with while read and case
Write-Host "3. File Processing with While Read:"
Write-Host "Let's create a sample file and process it"
Write-Host "Creating myfile.txt with random content..."
@("hello", "gday", "bonjour", "hola", "This is a test") | Set-Content myfile.txt
Write-Host "File contents:"
Get-Content myfile.txt
Move-On

Write-Host "The code:"
Write-Host "Get-Content myfile.txt | ForEach-Object {"
Write-Host "    switch -CaseSensitive (`$_) {"
Write-Host "        'hello'   { Write-Host '   English' }"
Write-Host "        'gday'    { Write-Host '   Australian' }"
Write-Host "        'bonjour' { Write-Host '   French' }"
Write-Host "        default   { Write-Host '   Unknown Language: `$_' }"
Write-Host "    }"
Write-Host "}"
Move-On

Write-Host "Processing myfile.txt:"
Get-Content myfile.txt | ForEach-Object {
    switch -CaseSensitive ($_) {
        'hello' { Write-Host "   English" }
        'gday' { Write-Host "   Australian" }
        'bonjour' { Write-Host "   French" }
        default { Write-Host "   Unknown Language: $_" }
    }
}
Remove-Item myfile.txt
Move-On

# 4. Directory creation methods
Write-Host "4. Directory Creation Tricks:"
Write-Host "Create multiple directories with different methods"
Move-On

Write-Host "Traditional loop method:"
Write-Host "foreach (`$runlevel in 0,1,2,3,4,5,6) {"
Write-Host "    New-Item -Path rc`$runlevel.d -ItemType Directory"
Write-Host "}"
Write-Host "Creating directories with loop..."
foreach ($runlevel in 0, 1, 2, 3, 4, 5, 6) {
    New-Item -Path "rc$runlevel.d" -ItemType Directory -Force | Out-Null
}
Get-ChildItem -Directory -Filter rc*.d | Select-Object -ExpandProperty Name
Move-On
Write-Host "Cleaning up..."
Remove-Item -Path rc*.d -Recurse -Force
Move-On

Write-Host "Array method:"
Write-Host "`$dirs = 0..6  | ForEach-Object { 'rc' + `$_ + '.d' }"
Write-Host "New-Item -Path `$dirs -ItemType Directory"
Write-Host "Creating directories with array method..."
$dirs = 0..6 | ForEach-Object { "rc$_.d" }
New-Item -Path $dirs -ItemType Directory -Force | Out-Null
Get-ChildItem -Directory -Filter rc*.d | Select-Object -ExpandProperty Name
Move-On
Write-Host "Cleaning up..."
Remove-Item -Path rc*.d -Recurse -Force
Move-On

# 5. Nested directory structure (fixed version)
Write-Host "5. Advanced Directory Structure Creation:"
Write-Host "Create nested directory structure"
Move-On

Write-Host "Creating directory structure..."
$parents = @('.', 'usr', 'usr\local')  # Changed empty string to current directory
$children = @('bin', 'sbin', 'lib')

foreach ($parent in $parents) {
    foreach ($child in $children) {
        $path = Join-Path $parent $child
        New-Item -Path $path -ItemType Directory -Force | Out-Null
    }
}

Write-Host "Resulting structure:"
$resulting_structure = Get-ChildItem -Recurse -Directory | Select-Object FullName
Write-Host $resulting_structure
Move-On

Write-Host "Cleaning up..."
Remove-Item -Path bin, sbin, lib, usr -Recurse -Force -ErrorAction SilentlyContinue
Move-On

Write-Host "Lesson complete! You've learned:"
Write-Host "- While loops with conditions"
Write-Host "- Infinite loops with switch statements"
Write-Host "- File processing with Get-Content and ForEach-Object"
Write-Host "- Creating directories with loops and array methods"
Write-Host ""