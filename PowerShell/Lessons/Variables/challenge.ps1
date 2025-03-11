#---------- CHALLENGE: TRAVEL PLANNER -----------
# Complete the missing parts using concepts from:
# Lesson 1: Variables, quoting, scope
# Lesson 2: Special params, shift, IFS, $!
# Lesson 3: Default values, braces, :=/:-

# Initialize with default location using Lesson 3 technique
if (-not (Test-Path variable:DESTINATION)) { $DESTINATION = "Paris" }

Write-Host "=== Travel Planner ==="
Write-Host "Current destination: $DESTINATION"

# Lesson 1: Get user input with spaces
$TRANSPORT = Read-Host "Enter preferred transportation (with spaces): "

# Lesson 2: Handle arguments
Write-Host "Processing command line arguments..."
$count = 1
foreach ($arg in $args) {
    Write-Host "   Argument ${count}: $arg"
    $count++
}

# Lesson 3: Prevent variable ambiguity
$season = "fall"
Write-Host -NoNewLine "Creating filename: "
Write-Host "${season}planner"

# Lesson 2: IFS splitting (PowerShell equivalent)
Write-Host -NoNewLine "Enter activities (comma-separated): "
$activities = (Read-Host).Split(',')
Write-Host "Planned Activities:"
Write-Host "`t- $($activities[0])"
Write-Host "`t- $($activities[1])"
Write-Host "`t- $($activities[2])"

# Lesson 3: Default value for undefined variable
Write-Host "Recommended hotel: $(if ($HOTEL) { $HOTEL } else { 'GrandHotel' })"

# Lesson 2: Process IDs
Write-Host "Starting background weather check..."
$job = Start-Job -ScriptBlock { Start-Sleep 2 }
Write-Host "   Planner PID: $pid"
Write-Host "   Weather PID: $($job.Id)"

# Lesson 1: Variable scope demonstration
@'
Write-Host "   Subshell TRANSPORT: $env:TRANSPORT"
'@ | Out-File sub.ps1
Write-Host -NoNewLine "Running subshell test..."
$env:TRANSPORT = $TRANSPORT
powershell -File sub.ps1

# Cleanup
Remove-Item sub.ps1

Write-Host "=== Planning Complete! ==="