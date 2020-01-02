<#
.SYNOPSIS
    Adds a path item
.PARAMETER Item
    This item will be added to the path
.PARAMETER Target
    Machine or User
.PARAMETER Help
    Show this help.
.EXAMPLE
    Add-PathItem "C:\Utils" Machine
#>
param([string]$Item, [string]$Target, [switch]$Help)
$ErrorActionPreference = "Stop"

if (($Item -eq "") -or ($Target -eq "") -or ($help.IsPresent)) {
    Get-Help $PSCommandPath -Full
    exit
}

$path = [Environment]::GetEnvironmentVariable("Path", $Target)
$newPath =  $path + ";$Item"

[Environment]::SetEnvironmentVariable("Path", "$newPath", $Target)