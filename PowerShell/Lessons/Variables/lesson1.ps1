function Move-On {
    Write-Host ""
    Read-Host "Press enter to continue..." | Out-Null
    Write-Host ""
}

function Display-Code {
    param([string]$Code)
    Write-Host "The following code will be executed:"
    Write-Host "`n    # PowerShell"
    $Code -split "`r?`n" | ForEach-Object {
        Write-Host "    $_"
    }
    Write-Host ""
}

# Lesson Header
Write-Host "Lesson: Introduction to PowerShell Variables"
Move-On

# 1. Basic Variable Assignment
Write-Host "1. Basic Variable Assignment"
Display-Code -Code '$MY_MESSAGE = "Hello World"
Write-Host "Simple variable: $MY_MESSAGE"'

$MY_MESSAGE = "Hello World"
Write-Host "   Actual output: $MY_MESSAGE"
Write-Host "   Explanation: We created a variable MY_MESSAGE and assigned it a string value"
Move-On

# 2. User Input with Read-Host
Write-Host "2. Getting User Input with 'Read-Host'"
Display-Code -Code '$MY_NAME = Read-Host "What''s your name? "
Write-Host "Hello $MY_NAME!"'

$MY_NAME = Read-Host "   What's your name? "
Write-Host "   Actual output: Hello $MY_NAME!"
Write-Host "   Explanation: The Read-Host command stores user input in a variable"
Move-On

# 3. Variable Scope Demonstration
Write-Host "3. Understanding Variable Scope"
Write-Host "   We'll demonstrate how variable exporting affects subprocesses:"
Move-On

Display-Code -Code 'Write-Host "   Inside script: MYVAR was $($env:MYVAR)"
$env:MYVAR = "hi there"
Write-Host "   Inside script: MYVAR is now $($env:MYVAR)"'

# Create temporary script
@'
Write-Host "   Inside script: MYVAR was $($env:MYVAR)"
$env:MYVAR = "hi there"
Write-Host "   Inside script: MYVAR is now $($env:MYVAR)"
'@ | Out-File -FilePath temp_script.ps1 -Encoding utf8

Write-Host -NoNewline "   Enter any value for MYVAR: "
$USER_VAR = Read-Host
$MYVAR = $USER_VAR
Write-Host "   Main shell: MYVAR=$MYVAR"
Move-On

Write-Host "   First test: Running script WITHOUT export..."
Write-Host "   Expected outcome: The script won't see our MYVAR"
Read-Host "   Press enter to run..."
pwsh temp_script.ps1
Write-Host "   Main shell after script: MYVAR=$MYVAR (no change)"
Move-On

Write-Host "   Second test: Running script WITH export..."
Write-Host "   Expected outcome: The script will see original value but changes won't affect parent"
Read-Host "   Press enter to export and run..."
$env:MYVAR = $MYVAR
pwsh temp_script.ps1
Write-Host "   Main shell after script: MYVAR=$MYVAR (still unchanged)"
Move-On

Remove-Item temp_script.ps1
Write-Host "   Cleaned up temporary script"
Move-On

# 4. Formatting and Quoting
Write-Host "4. Variable Formatting and Quoting"
Write-Host "   Proper quoting is essential for handling special characters and spaces"
Display-Code -Code '$USER_NAME = Read-Host "Enter name with spaces: "
Write-Host "Creating file: ${USER_NAME}_file"
New-Item -Path "${USER_NAME}_file" -ItemType File'

Write-Host -NoNewline "   Try entering a name with spaces (e.g., 'John Doe'): "
$USER_NAME = Read-Host
Write-Host "   Creating file: ${USER_NAME}_file"
New-Item -Path "${USER_NAME}_file" -ItemType File
Write-Host "   File created with contents:"
Get-ChildItem "${USER_NAME}_file"
Write-Host "   Explanation: Quotes preserve spaces in filenames"

Remove-Item "${USER_NAME}_file"
Write-Host "   Cleaned up example file"
Move-On

Write-Host "Lesson complete! You've learned:"
Write-Host "- Variable assignment"
Write-Host "- User input handling"
Write-Host "- Variable scoping"
Write-Host "- Proper quoting techniques"
Write-Host ""