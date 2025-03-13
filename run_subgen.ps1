# PowerShell script to activate Conda environment and run launcher.py with admin privileges

# Check if running as administrator
# $Principal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
# if (-Not $Principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
#     # Relaunch the script as administrator
#     Start-Process powershell -Verb runAs -ArgumentList "-File", $MyInvocation.MyCommand.Definition
#     exit
# }

# Start PowerShell script
param (
    [string]$condaEnv = "whisperai",
    [string]$scriptPath = "C:\Users\braba\projects\subgen\launcher.py"
)

# Activate Conda environment using conda.bat
cmd.exe /c "D:\miniconda3\condabin\conda.bat activate $condaEnv && python $scriptPath"

# Keep the terminal open
Write-Host "Script executed. Press any key to close this window..."
$Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
