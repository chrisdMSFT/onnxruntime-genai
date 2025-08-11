# Copyright (c) Microsoft Corporation. All rights reserved.
# ShowGdnSuppress.ps1 2022-10-20 aluty@microsoft.com

#requires -Version 5

<#
.SYNOPSIS
    Show Guardian supporessions.
.NOTES
    OneBranch wiki: Suppress SDL issues
    https://onebranch.visualstudio.com/OneBranch/_wiki/wikis/OneBranch.wiki/4640/Suppress-SDL-issues
#>
[CmdletBinding()]
param
(
    [ValidateNotNullOrEmpty()]
    [ValidatePattern("[.]gdnsuppress$")]
    [ValidateScript({ Test-Path -Path $_ -PathType Leaf })]
    [string] $Path
)

if (-not $Path)
{
    $Path = Get-ChildItem -Path "$PSScriptRoot\*.gdnsuppress"
}

Write-Verbose -Message "Loading Guardian suppressions: $Path" -Verbose
$gdnsuppress = Get-Content -Path $Path -Raw  | ConvertFrom-Json
$names = ($gdnsuppress.results | Get-Member -MemberType NoteProperty).Name
$list = @()
foreach ($name in $names)
{
    $list += $gdnsuppress.results.$name
}
$suppressions = $list | Select-Object * -Exclude alternativeSignatures
$suppressions | Format-Table -AutoSize
Write-Verbose -Message "Found $($suppressions.Count) suppressions." -Verbose

$suppressions | Out-GridView -Title $Path -Wait
