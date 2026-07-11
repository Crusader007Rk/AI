param(
  [string]$SourceRoot = (Join-Path $PSScriptRoot '..'),
  [string]$DestinationRoot = $env:VSCODE_USER_PROMPTS_FOLDER
)

if (-not $DestinationRoot) {
  $DestinationRoot = Join-Path $env:APPDATA 'Code\User\prompts'
}

$agentsSource = Join-Path $SourceRoot 'agents'
$skillsSource = Join-Path $SourceRoot 'skills'

$targetAgents = Join-Path $DestinationRoot 'agents'
$targetSkills = Join-Path $DestinationRoot 'skills'

New-Item -ItemType Directory -Path $targetAgents -Force | Out-Null
New-Item -ItemType Directory -Path $targetSkills -Force | Out-Null

Get-ChildItem -Path $agentsSource -File | Where-Object { $_.Extension -eq '.md' } | ForEach-Object {
  Copy-Item -Path $_.FullName -Destination (Join-Path $targetAgents $_.Name) -Force
}

Get-ChildItem -Path $skillsSource -Directory | ForEach-Object {
  $skillFile = Join-Path $_.FullName 'SKILL.md'
  if (Test-Path $skillFile) {
    $skillTargetDir = Join-Path $targetSkills $_.Name
    New-Item -ItemType Directory -Path $skillTargetDir -Force | Out-Null
    Copy-Item -Path $skillFile -Destination (Join-Path $skillTargetDir 'SKILL.md') -Force
  }
}

Write-Host "Installed agents and skills into $DestinationRoot"
