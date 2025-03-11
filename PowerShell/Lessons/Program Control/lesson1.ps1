# Lesson 1 - PowerShell Version

# HELPER FUNCTION
function Move-On {
    Write-Host ""
    Read-Host "Press enter to continue..."
    Write-Host ""
}

Write-Host "Lesson: Introduction to For Loops"
Move-On

# 1. Basic For Loop
Write-Host "1. Basic For Loop Example:"
Write-Host "The following script will run:"
Write-Host ""
Write-Host "`tforeach (`$i in 1..5) {"
Write-Host "`t    Write-Host `"Looping ... number `$i`""
Write-Host "`t}"
Move-On

@'
foreach ($i in 1..5) {
    Write-Host "Looping ... number $i"
}
'@ | Out-File basic_for.ps1
Write-Host "Running the script..."
& .\basic_for.ps1
Remove-Item basic_for.ps1
Move-On

# 2. User Input with Wildcards
Write-Host "2. Custom For Loop with Your Own Input:"
Write-Host "Creating temporary files temp_1 and temp_2..."
New-Item temp_1, temp_2 -ItemType File -Force | Out-Null
$userItems = Read-Host "Enter space-separated items to loop through (try including *)"
Write-Host "The script will use your input: $userItems"

# Generate expanded array content
$itemsArray = @()
foreach ($item in ($userItems -split ' ')) {
    if ($item -match '[*?\[\]]') {
        $expanded = Get-ChildItem $item | Select-Object -ExpandProperty Name
        if ($expanded) { $itemsArray += $expanded }
        else { $itemsArray += $item }
    }
    else { $itemsArray += $item }
}

@"
`$items = @('$($itemsArray -join "','")')
foreach (`$i in `$items) {
    Write-Host "Looping ... i is set to `$i"
}
"@ | Out-File custom_for.ps1

Write-Host "Running the script..."
& .\custom_for.ps1
Write-Host "Cleaning up temporary files..."
Remove-Item custom_for.ps1, temp_1, temp_2 -ErrorAction SilentlyContinue
Move-On

# 3. Quoted Wildcard
Write-Host "3. For Loop with Quoted Wildcard:"
Write-Host "Here, the wildcard is quoted, preventing expansion."
Write-Host "The script uses `"*`" instead of *."
Write-Host "Code:"
Write-Host "`tforeach (`$i in 'hello', 1, '*', 2, 'goodbye') {"
Write-Host "`t    Write-Host `"Looping ... i is set to `$i`""
Write-Host "`t}"
Move-On

@'
foreach ($i in 'hello', 1, '*', 2, 'goodbye') {
    Write-Host "Looping ... i is set to $i"
}
'@ | Out-File quoted_wildcard_for.ps1
Write-Host "Running the script..."
& .\quoted_wildcard_for.ps1
Remove-Item quoted_wildcard_for.ps1
Move-On

# 4. Variable List
Write-Host "4. Using a Variable for the List:"
Write-Host "The list is stored in a variable, then used in the for loop."
Write-Host "Creating temporary files variable_temp_1 and variable_temp_2..."
New-Item variable_temp_1, variable_temp_2 -ItemType File -Force | Out-Null
Move-On

@'
$list = "hello 1 * 2 goodbye"
$items = $list -split ' '
$expanded = @()
foreach ($item in $items) {
    if ($item -match '[*?\[\]]') {
        $matches = Get-ChildItem $item
        if ($matches) { $expanded += $matches.Name }
        else { $expanded += $item }
    }
    else { $expanded += $item }
}
foreach ($i in $expanded) {
    Write-Host "Looping ... i is set to $i"
}
'@ | Out-File variable_list_for.ps1

Write-Host "Running the script..."
& .\variable_list_for.ps1
Write-Host "Cleaning up..."
Remove-Item variable_list_for.ps1, variable_temp_1, variable_temp_2 -ErrorAction SilentlyContinue
Move-On

# 5. C-style Countdown Loop
Write-Host "5. C-style Countdown Loop:"
$start = Read-Host "Enter starting number for countdown"
Write-Host "The code will be:"
Write-Host "`tfor (`$i = $start; `$i -gt 0; `$i--) {"
Write-Host "`t    Write-Host `"Countdown: `$i`""
Write-Host "`t}"
Move-On

@'
param([int]$START)
for ($i = $START; $i -gt 0; $i--) {
    Write-Host "Countdown: $i"
}
'@ | Out-File countdown.ps1

Write-Host "Running countdown..."
& .\countdown.ps1 -START $start
Remove-Item countdown.ps1
Move-On

Write-Host "End of for loop demo. You've mastered different loop types!"
Write-Host ""