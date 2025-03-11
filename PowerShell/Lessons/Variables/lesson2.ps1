function Move-On {
    Write-Host ""
    Read-Host "Press enter to continue..." | Out-Null
    Write-Host ""
}

Write-Host "Lesson: Special Variables and Parameters"
Move-On

# 1. Script Parameters
Write-Host "1. Understanding Script Parameters:"
Write-Host "   Special variables provide information about script arguments:"
Write-Host "   - `$MyInvocation.MyCommand.Name: Script name"
Write-Host "   - `$args[0], `$args[1], ...: Positional parameters"
Write-Host "   - `$args: All arguments as an array"
Write-Host "   - `$args.Count: Number of arguments"
Write-Host ""
Write-Host "   Let's demonstrate with some example arguments..."

if ($args.Count -eq 0) {
    $scriptArgs = @("apple", "banana", "cherry")
    Write-Host "   No arguments provided. Using default: apple banana cherry"
}
else {
    $scriptArgs = $args
    Write-Host "   Using provided arguments: $scriptArgs"
}
Move-On

Write-Host "   The following commands will run:"
Write-Host "   Write-Host `"Script name: `$(`$MyInvocation.MyCommand.Name)`""
Write-Host "   Write-Host `"First argument: `$scriptArgs[0]`""
Write-Host "   Write-Host `"Second argument: `$scriptArgs[1]`""
Write-Host "   Write-Host `"All arguments: `$(`$scriptArgs -join ' ')`""
Write-Host "   Write-Host `"Argument count: `$(`$scriptArgs.Count)`""
Move-On

Write-Host "   Results:"
Write-Host "   Script name: $($MyInvocation.MyCommand.Name)"
Write-Host "   First argument: $($scriptArgs[0])"
Write-Host "   Second argument: $($scriptArgs[1])"
Write-Host "   All arguments: $($scriptArgs -join ' ')"
Write-Host "   Argument count: $($scriptArgs.Count)"
Move-On

# 2. Shift Demonstration
Write-Host "2. Using Shift to Process Arguments:"
Write-Host "   In PowerShell, we can process arguments using array indexing:"
Write-Host "   This loop will process all arguments using a for loop:"
Write-Host ""
Write-Host "   for (`$i = 0; `$i -lt `$scriptArgs.Count; `$i++) {"
Write-Host "       Write-Host `"Parameter `$(`$i+1) : `$(`$scriptArgs[`$i])`""
Write-Host "   }"
Move-On

Write-Host "   Processing current arguments: $scriptArgs"
for ($i = 0; $i -lt $scriptArgs.Count; $i++) {
    Write-Host "   Parameter $($i+1) : $($scriptArgs[$i])"
}
Write-Host "   All parameters processed!"
Move-On

# 3. Exit Status
Write-Host "3. Understanding Exit Status:"
Write-Host "   External commands return an exit code (0 = success, non-zero = error)"
Write-Host "   This example runs 'ls' on a non-existent file and shows its exit code"
Move-On
Write-Host "   Running: powershell.exe -Command ls /non/existent/file 2>`$null"
powershell.exe -Command ls /non/existent/file 2>$null
$status = $LASTEXITCODE
Write-Host "   dir exit status: $status"
if ($status -eq 0) {
    Write-Host "   Unexpected success!"
}
else {
    Write-Host "   Expected error as shown by non-zero status"
}
Write-Host "   (Note: 2>`$null hides the error message)"
Move-On

# 4. Process IDs
Write-Host "4. Process Identification Numbers:"
Write-Host "   Special variables track process IDs:"
Write-Host "   - `$PID = Current shell PID"
Write-Host "   - Last background process PID (retrieved via Start-Process)"
Write-Host ""
Move-On

Write-Host "   Current shell PID: $PID"
Write-Host "   Starting sleep in background..."
$process = Start-Process -FilePath "powershell.exe" -WindowStyle Hidden -ArgumentList "-Command Start-Sleep 2" -PassThru
$bg_pid = $process.Id
Write-Host "   Background process PID: $bg_pid"
Move-On

# 5. Custom Field Splitting
Write-Host "5. Custom Field Splitting with -split Operator:"
Write-Host "   In PowerShell, the -split operator splits strings based on a delimiter."
Write-Host "   We'll use a colon as the delimiter for this demonstration."
Write-Host ""
Write-Host "   Example input: 'red:green:blue' splits into three items."
Write-Host -NoNewline "   Enter 3 colon-separated items (e.g., red:green:blue): "
$inputLine = Read-Host
$items = $inputLine -split ':'
Write-Host ""
Write-Host "   Input split into:"
Write-Host "   Item 1: $($items[0])"
Write-Host "   Item 2: $($items[1])"
Write-Host "   Item 3: $($items[2])"
Move-On

Write-Host "Lesson complete! You've mastered special variables and parameters in PowerShell!"
Write-Host ""