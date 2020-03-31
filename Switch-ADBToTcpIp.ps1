<#
.SYNOPSIS
    Reconnectes an Andrdoid debug session using network.  YMMV.
#>
$ifConfig = (adb shell ifconfig)
$matches = ($ifConfig | Select-String -AllMatches -Pattern 'inet addr:\b(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})\b')
$address = $matches[0].Matches.Groups[1].Value
adb tcpip 5555
adb connect "$($address):5555"

