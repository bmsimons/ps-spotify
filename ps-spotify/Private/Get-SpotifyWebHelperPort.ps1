<#
.SYNOPSIS
    Gets the port used by the Spotify process.
.DESCRIPTION
    Gets the port used by the Spotify process running on the localhost.
.INPUTS
    None.
.OUTPUTS
    System.Int.
.EXAMPLE
    PS C:\> Get-SpotifyWebHelperPort
    4371
.NOTES
    This function is used in ps-spotify to find and set the default port, however it can be overridden.
.LINK
    https://bartsimons.me
.LINK
    https://dotps1.github.io
#>

Function Get-SpotifyWebHelperPort {

    [CmdletBinding()]
    [OutputType(
        [Int]
    )]

    Param (

    )

    Write-Output -InputObject (Get-NetTCPConnection -OwningProcess (Get-Process -Name "Spotify").Id -LocalPort (4370..4380)).LocalPort
}
