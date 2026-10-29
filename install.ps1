[CmdletBinding()]
param(
    [string]$Project,
    [switch]$Force
)

$ErrorActionPreference = 'Stop'
$repoUrl = 'https://github.com/gmreyescdev/web-design-harness.git'
$zipUrl = 'https://github.com/gmreyescdev/web-design-harness/archive/refs/heads/main.zip'

# Locate the kit. When run via "irm ... | iex" there is no $PSScriptRoot,
# so download the repository zip to a temporary folder.
$kit = $PSScriptRoot
$kitAgents = $null
if (-not [string]::IsNullOrWhiteSpace($kit)) {
    $kitAgents = Join-Path $kit 'AGENTS.md'
}

if ([string]::IsNullOrWhiteSpace($kit) -or -not (Test-Path -LiteralPath $kitAgents)) {
    Write-Host "Descargando el harness..." -ForegroundColor Cyan
    $zip = Join-Path $env:TEMP 'web-design-harness.zip'
    $tmp = Join-Path $env:TEMP 'web-design-harness-main'

    Invoke-WebRequest -Uri $zipUrl -OutFile $zip -UseBasicParsing
    if (Test-Path -LiteralPath $tmp) {
        Remove-Item -LiteralPath $tmp -Recurse -Force
    }
    Expand-Archive -Path $zip -DestinationPath $env:TEMP -Force
    $kit = $tmp
}

if (-not (Test-Path -LiteralPath (Join-Path $kit 'AGENTS.md'))) {
    throw "No se pudo preparar el kit. Revisa tu conexion o clona el repositorio manualmente."
}

Write-Host ""
Write-Host "Web Design Harness - instalador" -ForegroundColor Green
Write-Host ""

if ([string]::IsNullOrWhiteSpace($Project)) {
    $desktop = [Environment]::GetFolderPath('Desktop')
    $default = Join-Path $desktop 'mi-proyecto'
    $Project = Read-Host "Carpeta de tu proyecto (Enter para usar $default)"
    if ([string]::IsNullOrWhiteSpace($Project)) {
        $Project = $default
    }
}

$Project = $Project.Trim().Trim('"')
if (-not (Test-Path -LiteralPath $Project)) {
    New-Item -ItemType Directory -Path $Project -Force | Out-Null
    Write-Host "Carpeta creada: $Project" -ForegroundColor Cyan
}
$Project = (Resolve-Path -LiteralPath $Project).Path

$agentsPath = Join-Path $Project 'AGENTS.md'
if ((Test-Path -LiteralPath $agentsPath) -and (-not $Force)) {
    $answer = Read-Host "Ya existe AGENTS.md en el proyecto. Sobrescribir? (s/N)"
    if ($answer -notmatch '^(s|si|y|yes)$') {
        Write-Host "Instalacion cancelada. No se modifico nada." -ForegroundColor Yellow
        exit 1
    }
}

Copy-Item -LiteralPath (Join-Path $kit 'AGENTS.md') -Destination $agentsPath -Force

$docs = Join-Path $Project 'docs\harness'
New-Item -ItemType Directory -Path $docs -Force | Out-Null

$files = @(
    'README.md',
    'HARNESS.md',
    'MODEL-NOTES.md',
    'SUBAGENTS.md',
    'COST.md',
    'SKILLS.md',
    'KICKOFF.md',
    'QUESTION-BANK.md'
)
foreach ($file in $files) {
    Copy-Item -LiteralPath (Join-Path $kit $file) -Destination (Join-Path $docs $file) -Force
}

foreach ($dir in @('templates', 'state', 'checklists')) {
    Copy-Item -LiteralPath (Join-Path $kit $dir) -Destination $docs -Recurse -Force
}

$skillsSource = Join-Path $kit 'skills'
$skillsTarget = Join-Path $Project '.opencode\skills'
$realSkills = @()
if (Test-Path -LiteralPath $skillsSource) {
    $realSkills = @(Get-ChildItem -LiteralPath $skillsSource -Directory | Where-Object { $_.Name -notlike '_*' })
}
if ($realSkills.Count -gt 0) {
    New-Item -ItemType Directory -Path $skillsTarget -Force | Out-Null
    foreach ($skill in $realSkills) {
        Copy-Item -LiteralPath $skill.FullName -Destination (Join-Path $skillsTarget $skill.Name) -Recurse -Force
    }
}

if (-not (Test-Path -LiteralPath (Join-Path $Project '.git'))) {
    if (Get-Command git -ErrorAction SilentlyContinue) {
        Push-Location $Project
        try { git init -b main | Out-Null } catch { }
        Pop-Location
    }
}

Write-Host ""
Write-Host "Listo. Harness instalado en:" -ForegroundColor Green
Write-Host "  $Project"
Write-Host ""
Write-Host "Ahora:" -ForegroundColor Cyan
Write-Host "  1. Abri OpenCode en esa carpeta."
Write-Host "  2. Pega este mensaje:"
Write-Host ""
Write-Host "     Inicia el Web Design Harness en modo Express. Hazme la Ronda 1." -ForegroundColor White
Write-Host ""
Write-Host "  3. Responde las 5 preguntas."
Write-Host ""
Write-Host "No se escribe codigo hasta que apruebes el diseno." -ForegroundColor DarkGray
Write-Host ""
