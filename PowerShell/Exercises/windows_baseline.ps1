#Requires -RunAsAdministrator
#Requires -Modules ActiveDirectory

# ROOT CHECK
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Please run as Administrator" -ForegroundColor Red
    exit 1
}

$REPORT_FILE = "system_baseline_$(Get-Date -Format 'yyyyMMdd_HHmmss').txt"

function Create-Report {
    "=== System Baseline Report ===" | Out-File -FilePath $REPORT_FILE
    "Generated: $(Get-Date)" | Out-File -Append -FilePath $REPORT_FILE
    "" | Out-File -Append -FilePath $REPORT_FILE
}

function Get-HostnameIP {
    "[+] Hostname and IP" | Out-File -Append -FilePath $REPORT_FILE
    "Hostname: $($env:COMPUTERNAME)" | Out-File -Append -FilePath $REPORT_FILE
    "" | Out-File -Append -FilePath $REPORT_FILE
    
    "IP Addresses:" | Out-File -Append -FilePath $REPORT_FILE
    Get-NetIPAddress -AddressFamily IPv4 | 
        Where-Object { $_.InterfaceAlias -notlike '*Loopback*' } |
        Format-Table InterfaceAlias, IPAddress -AutoSize |
        Out-File -Append -FilePath $REPORT_FILE -Width 4096
    "" | Out-File -Append -FilePath $REPORT_FILE
}

function Get-Users {
    "[+] Users" | Out-File -Append -FilePath $REPORT_FILE
    $adminGroups = @("Domain Admins", "Enterprise Admins", "Administrators")
    $adminUsers = @()
    
    foreach ($group in $adminGroups) {
        try {
            $members = Get-ADGroupMember -Identity $group -Recursive -ErrorAction Stop |
                       Where-Object { $_.objectClass -eq 'user' } |
                       Select-Object -ExpandProperty SamAccountName
            $adminUsers += $members
        }
        catch {}
    }
    $adminUsers = $adminUsers | Sort-Object -Unique
    
    $allUsers = Get-ADUser -Filter * | Select-Object -ExpandProperty SamAccountName
    $regularUsers = $allUsers | Where-Object { $_ -notin $adminUsers }

    "=== Regular Users ===" | Out-File -Append -FilePath $REPORT_FILE
    $regularUsers | Out-File -Append -FilePath $REPORT_FILE
    "" | Out-File -Append -FilePath $REPORT_FILE
    
    "=== Admin Users ===" | Out-File -Append -FilePath $REPORT_FILE
    $adminUsers | Out-File -Append -FilePath $REPORT_FILE
    "" | Out-File -Append -FilePath $REPORT_FILE
}

function Get-Groups {
    "[+] Groups" | Out-File -Append -FilePath $REPORT_FILE
    Get-ADGroup -Filter * | Select-Object -ExpandProperty Name | Out-File -Append -FilePath $REPORT_FILE
    "" | Out-File -Append -FilePath $REPORT_FILE
}

function Get-Sudoers {
    "[+] Sudoers and Admin Groups" | Out-File -Append -FilePath $REPORT_FILE
    $adminGroups = @("Domain Admins", "Enterprise Admins", "Administrators")
    
    foreach ($group in $adminGroups) {
        try {
            $members = Get-ADGroupMember -Identity $group -Recursive -ErrorAction Stop |
                       Where-Object { $_.objectClass -eq 'user' } |
                       Select-Object -ExpandProperty SamAccountName
            
            "Group $group members:" | Out-File -Append -FilePath $REPORT_FILE
            $members | Out-File -Append -FilePath $REPORT_FILE
        }
        catch {}
    }
    "" | Out-File -Append -FilePath $REPORT_FILE
}

function Get-Services {
    "[+] Services" | Out-File -Append -FilePath $REPORT_FILE
    "=== Enabled Services ===" | Out-File -Append -FilePath $REPORT_FILE
    Get-CimInstance -ClassName Win32_Service |
        Where-Object { $_.StartMode -eq 'Auto' } |
        Select-Object Name, DisplayName, StartMode |
        Sort-Object Name |
        Format-Table -AutoSize |
        Out-File -Append -FilePath $REPORT_FILE -Width 4096
    
    "" | Out-File -Append -FilePath $REPORT_FILE
    
    "=== Running Services ===" | Out-File -Append -FilePath $REPORT_FILE
    Get-Service | Where-Object { $_.Status -eq 'Running' } |
        Select-Object DisplayName, Name, Status |
        Sort-Object Name |
        Format-Table -AutoSize |
        Out-File -Append -FilePath $REPORT_FILE -Width 4096
    "" | Out-File -Append -FilePath $REPORT_FILE
}

function Get-OpenPorts {
    "[+] Open Ports" | Out-File -Append -FilePath $REPORT_FILE
    "TCP Listeners:" | Out-File -Append -FilePath $REPORT_FILE
    Get-NetTCPConnection -State Listen |
        Select-Object LocalAddress, LocalPort, State |
        Sort-Object LocalPort |
        Format-Table -AutoSize |
        Out-File -Append -FilePath $REPORT_FILE -Width 4096
    
    "UDP Endpoints:" | Out-File -Append -FilePath $REPORT_FILE
    Get-NetUDPEndpoint |
        Select-Object LocalAddress, LocalPort |
        Sort-Object LocalPort |
        Format-Table -AutoSize |
        Out-File -Append -FilePath $REPORT_FILE -Width 4096
    "" | Out-File -Append -FilePath $REPORT_FILE
}

function Get-ScheduledTasks {
    "[+] Scheduled Tasks" | Out-File -Append -FilePath $REPORT_FILE
    "=== System Tasks ===" | Out-File -Append -FilePath $REPORT_FILE
    Get-ScheduledTask |
        Where-Object { $_.State -ne 'Disabled' } |
        Select-Object TaskName, State |
        Sort-Object TaskName |
        Format-Table -AutoSize |
        Out-File -Append -FilePath $REPORT_FILE -Width 4096
    "" | Out-File -Append -FilePath $REPORT_FILE
}

function Main {
    Create-Report
    Get-HostnameIP
    Get-Users
    Get-Groups
    Get-Sudoers
    Get-Services
    Get-OpenPorts
    Get-ScheduledTasks
    
    Write-Host "Baseline report created: $REPORT_FILE" -ForegroundColor Green
}

Main
