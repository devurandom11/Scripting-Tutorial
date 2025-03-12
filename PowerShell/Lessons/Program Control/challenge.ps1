function Move-On {
    Write-Host ""
    Write-Host -NoNewline "Press enter to continue..."
    [System.Console]::ReadLine() | Out-Null
    Write-Host ""
}

Write-Host "=== Loop Master Challenge ==="

# Section 1: Basic For Loop
Write-Host "1. Number Printer:"
foreach ($i in 1..5) {
    Write-Host "Number: $i"
}
Move-On

# Section 2: While Loop with Condition
Write-Host "2. Exit Controlled Loop:"
$USER_INPUT = "start"
while ($USER_INPUT -ne "quit") {
    $USER_INPUT = Read-Host "Type 'quit' to exit"
    Write-Host "You entered: $USER_INPUT"
}
Move-On

# Section 3: Case Statement
Write-Host "3. Language Detector:"
while ($true) {
    $GREETING = Read-Host "Enter a greeting"
    switch ($GREETING) {
        'hola' { Write-Host "Spanish" }
        'bonjour' { Write-Host "French" }
        'quit' { break }
        default { Write-Host "Unknown language" }
    }
    if ($GREETING -eq 'quit') { break }
}
Move-On

# Section 4: File Processing
Write-Host "4. Capitalize Cities:"
"paris", "london", "tokyo" | Set-Content cities.txt
Write-Host "Processing cities.txt..."
Get-Content cities.txt | ForEach-Object {
    $capitalized = (Get-Culture).TextInfo.ToTitleCase($_)
    Write-Host "   $capitalized"
}
Remove-Item cities.txt
Move-On

# Section 5: Brace Expansion Alternative
Write-Host "5. Create Directories:"
Write-Host "   Create runlevel directories without loop"
$directories = 0..6 + 'S' | ForEach-Object { "rc$_.d" }
New-Item -ItemType Directory -Path $directories -ErrorAction SilentlyContinue | Out-Null
Get-ChildItem rc*.d | Select-Object -ExpandProperty Name
Move-On
Remove-Item rc*.d -Recurse -Force
Move-On

# Section 6: Nested Loop
Write-Host "6. Multiplication Table:"
foreach ($i in 1..3) {
    $j = 1
    while ($j -le 3) {
        Write-Host "$($i * $j) " -NoNewline
        $j++
    }
    Write-Host ""
}
Move-On

# Section 7: Infinite Loop
Write-Host "7. Random Number Game:"
Write-Host "   Type in quit when you're done"
while ($true) {
    $num = Get-Random -Minimum 0 -Maximum 10
    $guess = Read-Host "Guess (0-9)"
    if ($guess -eq "quit") {
        break
    }
    elseif ($num -eq $guess) {
        Write-Host "Correct!"
    }
    else {
        Write-Host "Wrong! It was $num"
    }
}
Move-On

Write-Host "=== Challenge Complete! ==="
Write-Host ""