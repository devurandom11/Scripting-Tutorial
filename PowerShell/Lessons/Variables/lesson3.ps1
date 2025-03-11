function Move-On {
    Write-Host ""
    Write-Host "Press enter to continue..." -NoNewLine
    [Console]::ReadLine() | Out-Null
    Write-Host ""
}

Write-Host "Lesson 3: Advanced Variable Techniques"
Move-On

# 1. Variable Ambiguity
Write-Host "1. Variable Ambiguity Prevention with Braces"
Write-Host "When using variables adjacent to other text, we need {} to show where the variable ends."
Write-Host ""
Write-Host "Example problem:"
Write-Host "    `$fruit = 'apple'"
Write-Host "    Write-Host `"I have many `$fruit_s`"   # Tries to find variable 'fruit_s'"
Write-Host "    Write-Host `"I have many `$(`$fruit)s`"  # Properly references 'fruit'"
Move-On

Write-Host "Enter a fruit: " -NoNewLine
$fruit = [Console]::ReadLine()
Write-Host ""
Write-Host "Testing without braces:"
Write-Host "    Write-Host `"I have many `$fruit_s`" => I have many $($fruit_s)"
Write-Host ""
Write-Host "Testing with braces:"
Write-Host "    Write-Host `"I have many `$(`$fruit)s`" => I have many $($fruit)s"
Move-On

# 2. Default Values (Classic PowerShell)
Write-Host "2. Using Default Values with Conditional Checks"
Write-Host "PowerShell uses conditional logic for default values:"
Write-Host "    if (`$variable) { `$variable } else { 'default' }"
Write-Host ""
Write-Host "First, let's try when you provide a value:"
Write-Host "Enter your name [default: $($env:USERNAME)]: " -NoNewLine
$username = [Console]::ReadLine()
Write-Host ""
$displayName = if ($username) { $username } else { $env:USERNAME }
Write-Host "    Write-Host `"Hello, $displayName`" => Hello, $displayName"
Move-On

Write-Host "Now let's test with empty input:"
Write-Host "Press enter without typing anything: " -NoNewLine
$username = [Console]::ReadLine()
Write-Host ""
$displayName = if ($username) { $username } else { $env:USERNAME }
Write-Host "    Write-Host `"Hello, $displayName`" => Hello, $displayName"
Write-Host "Key point: The original variable remains unchanged"
Move-On

# 3. Default Assignment (PowerShell-style)
Write-Host "3. Setting Default Values with Conditional Assignment"
Write-Host "PowerShell uses conditional logic for permanent assignment:"
Write-Host "    if (-not `$var) { `$var = 'default' }"
Write-Host ""
Write-Host "Let's see it in action with an unset variable:"
Remove-Variable -Name city -ErrorAction SilentlyContinue
Write-Host "    Start: city is unset"
if (-not (Test-Path variable:city)) { $city = "Hackerville" }
Write-Host "    Result: $city"
Write-Host "    Now city is: $city"
Move-On

# 4. Temporary vs Permanent Defaults
Write-Host "4. Temporary vs Permanent Default Comparison"
Write-Host "Creating two unset variables:"
Remove-Variable -Name var1, var2 -ErrorAction SilentlyContinue
Write-Host ""

Write-Host "Testing temporary default:"
$tempResult = if ($var1) { $var1 } else { 'default' }
Write-Host "    Result: $tempResult"
Write-Host "    var1 after: $(if (Test-Path variable:var1) { $var1 } else { 'unset (still not set)' })"
Write-Host ""

Write-Host "Testing permanent assignment:"
if (-not (Test-Path variable:var2)) { $var2 = 'default' }
Write-Host "    Result: $var2"
Write-Host "    var2 after: $(if (Test-Path variable:var2) { $var2 } else { 'unset' })"
Write-Host ""
Write-Host "Key difference: Conditional assignment permanently sets the variable"
Move-On

Write-Host "Advanced variable techniques mastered! Great work learning:"
Write-Host " - Variable ambiguity prevention"
Write-Host " - Conditional default values"
Write-Host " - Permanent default assignment"
Write-Host " - Difference between temporary and permanent defaults"
Write-Host ""