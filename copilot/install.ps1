<#
.SYNOPSIS
    Installs Copilot CLI configuration by copying files into ~/.copilot/
.DESCRIPTION
    Copies settings, MCP config, instructions, agents, and skills
    into the user's ~/.copilot/ directory. Existing files are backed up.
#>

param(
    [switch]$Force
)

$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$targetDir = Join-Path $env:USERPROFILE ".copilot"

Write-Host "Installing Copilot CLI dotfiles..." -ForegroundColor Cyan
Write-Host "  Source: $scriptDir"
Write-Host "  Target: $targetDir"
Write-Host ""

# Ensure target directories exist
@("agents", "skills") | ForEach-Object {
    $dir = Join-Path $targetDir $_
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
        Write-Host "  Created: $dir" -ForegroundColor Green
    }
}

# Files to install
$files = @(
    "settings.json",
    "mcp-config.json",
    "copilot-instructions.md"
)

# Copy root config files (backup existing)
foreach ($file in $files) {
    $source = Join-Path $scriptDir $file
    $dest = Join-Path $targetDir $file

    if ((Test-Path $dest) -and -not $Force) {
        $backup = "$dest.bak"
        Copy-Item $dest $backup -Force
        Write-Host "  Backed up: $file -> $file.bak" -ForegroundColor Yellow
    }

    Copy-Item $source $dest -Force
    Write-Host "  Installed: $file" -ForegroundColor Green
}

# Copy agents
Get-ChildItem (Join-Path $scriptDir "agents") -Filter "*.md" | ForEach-Object {
    Copy-Item $_.FullName (Join-Path $targetDir "agents" $_.Name) -Force
    Write-Host "  Installed: agents/$($_.Name)" -ForegroundColor Green
}

# Copy skills
Get-ChildItem (Join-Path $scriptDir "skills") -Filter "*.md" | ForEach-Object {
    Copy-Item $_.FullName (Join-Path $targetDir "skills" $_.Name) -Force
    Write-Host "  Installed: skills/$($_.Name)" -ForegroundColor Green
}

Write-Host ""
Write-Host "Done! Restart Copilot CLI to pick up changes." -ForegroundColor Cyan
Write-Host ""
Write-Host "Note: Plugins from settings.json will auto-install on first use." -ForegroundColor DarkGray
