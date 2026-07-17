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

function Copy-AgentTree {
  param(
    [Parameter(Mandatory=$true)][string]$SourcePath,
    [Parameter(Mandatory=$true)][string]$DestinationPath
  )

  New-Item -ItemType Directory -Path $DestinationPath -Force | Out-Null

  Get-ChildItem -Path $SourcePath | ForEach-Object {
    $sourceItem = $_.FullName
    $destItem = Join-Path $DestinationPath $_.Name

    if ($_.PSIsContainer) {
      Copy-AgentTree -SourcePath $sourceItem -DestinationPath $destItem
    }
    elseif ($_.Extension -eq '.md') {
      Copy-Item -Path $sourceItem -Destination $destItem -Force
    }
  }
}

Copy-AgentTree -SourcePath $agentsSource -DestinationPath $targetAgents

Get-ChildItem -Path $skillsSource -Directory | ForEach-Object {
  $skillFile = Join-Path $_.FullName 'SKILL.md'
  if (Test-Path $skillFile) {
    $skillTargetDir = Join-Path $targetSkills $_.Name
    New-Item -ItemType Directory -Path $skillTargetDir -Force | Out-Null
    Copy-Item -Path $skillFile -Destination (Join-Path $skillTargetDir 'SKILL.md') -Force
  }
}

Write-Host "Installed agents and skills into $DestinationRoot"
