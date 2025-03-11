# Challenge 1

function print_command {
    param(
        [string]$command
    )
    Write-Output "Output of command: $command"
}

# What happens under these scenarios?

print_command 'Write-Output "Hello       World"'
Read-Host
Write-Output "Hello       World"
Write-Output ""

print_command 'Write-Output "Hello World"'
Read-Host
Write-Output "Hello World"
Write-Output ""

print_command 'Write-Output "Hello * World"'
Read-Host
Write-Output "Hello * World"
Write-Output ""

print_command 'Write-Output Hello * World'
Read-Host
Write-Output Hello * World
Write-Output ""

print_command 'Write-Output Hello World'
Read-Host
Write-Output Hello World
Write-Output ""

print_command 'Write-Output "Hello" World'
Read-Host
Write-Output "Hello" World
Write-Output ""

print_command 'Write-Output Hello "     " World'
Read-Host
Write-Output Hello "     " World
Write-Output ""

print_command 'Write-Output "Hello "*" World"'
Read-Host
Write-Output "Hello "*" World"
Write-Output ""

print_command 'Write-Output $(hello) world'
Read-Host
Write-Output $(hello) world
Write-Output ""

print_command 'Write-Output ''hello'' world'
Read-Host
Write-Output 'hello' world
Write-Output ""