<#
.SYNOPSIS
    Remove an item from Machine path
.PARAMETER ItemToRemove
    This item will be removed from the path
.PARAMETER Help
    Show this help.
.EXAMPLE
    Remove-SystemPathItem "C:\Some-bad-path"
#>
param([string]$ItemToRemove,[switch]$Help)
$ErrorActionPreference = "Stop"

if (($itemToRemove -eq "") -or ($help.IsPresent)) {
    Get-Help $PSCommandPath -Full
    exit
}

$path = [Environment]::GetEnvironmentVariable("Path", "Machine")
$paths = $path.Split(";")
$newPaths = $paths | where { $_ -ne $ItemToRemove }
$newPath =  $newPaths -join ";"

[Environment]::SetEnvironmentVariable("Path", "$newPath", "Machine")