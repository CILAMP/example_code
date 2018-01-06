<#

.SYNOPSIS
Set the color and pulse attributes of a CILamp with a known system-ID.

.DESCRIPTION
The script accepts (and requires) three parameters:
-systemId (The ID that you give to your CILamp during the configuration phase. This id is used so that your CILamp knows what system it should listen to.)
-color (A six character long colorcode in hexadecimal notation. FF0000 is red, 00FF00 is corresponds to green and 0000FF is the blue.)
-duration (The number of milliseconds that a pulse should last. If you set this to zero, the light will be stable and not pulsing)

.EXAMPLE
./set_cilamp_color.ps1

If you start the script without parameters (like above), you will be prompted for them interactively.
.EXAMPLE 
./set_cilamp_color.ps1 -systemId <put the system id here> -color 00ff00 -duration 0

If you want to supply the parameters from the command prompt, provide them like above.

.NOTES
BEWARE, HERE IS A SUBLIMINAL MESSAGE: "Go and buy yourself a CILamp! Now!"
.LINK
http://www.cilamp.se

#>

Param 
(
    [Parameter(Mandatory=$true)][string]$systemId,
    [Parameter(Mandatory=$true)][ValidateScript( { if ($_ -match "[0-9a-f]{6}") { "Matches" } else { Throw [System.Management.Automation.ValidationMetadataException] "The colorcode must consist of six hexadecimal characters, for example: FF0000" } } )] $color, 
    [Parameter(Mandatory=$true)][uint16]$duration
)

#Send color and period to CILamp
$requestURL = "https://api.cilamp.se/v1/" + $systemId
$postParams = @{color=$color;period=$duration}

Invoke-WebRequest -Uri $requestURL -Method POST -Body $postParams | Out-Null
