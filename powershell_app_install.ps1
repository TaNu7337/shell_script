# 管理者権限の確認
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "This script requires administrator privileges. Restarting script with elevated privileges..."
    Start-Sleep -Seconds 2
    Start-Process powershell.exe -Verb RunAs -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`""
    Exit
}

# インストールするプログラムの一覧
$programs = @(
    "7zip.7zip"
    "Mozilla.Firefox",
    "Git.Git",
    "9NRWMJP3717K", #Python
    "Bitwarden.Bitwarden",
    "Docker.DockerDesktop",
    "XP89DCGQ3K6VLD", #PowerToys
    "SumatraPDF.SumatraPDF",
    "TortoiseGit.TortoiseGit",
    "BlenderFoundation.Blender.LTS",
    "Discord.Discord",
    "LINE.LINE",
    "NordSecurity.NordVPN",
    "Microsoft.VisualStudioCode",
    "ArduinoSA.IDE.stable",
    "AVRDudes.AVRDUDE",
    "OBSProject.OBSStudio",
    "Microsoft.VisualStudio.2022.Community",
    "GIMP.GIMP",
    "Inkscape.Inkscape",
    "Valve.Steam",
    "ElectronicArts.EADesktop"
    # 必要なプログラムを追加
)

foreach ($program in $programs) {
    Write-Host "Installing $program"
    winget install --id $program -e
}
