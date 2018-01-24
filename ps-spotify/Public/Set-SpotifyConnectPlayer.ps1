Function Set-SpotifyConnectPlayer {
    <#
        .SYNOPSIS
            Transfer playback to one or more Spotify Connect devices.

        .PARAMETER Devices
            The device or multiple devices to connect to.

        .PARAMETER Play
            Enable playback status on devices, or just se.

        .EXAMPLE
            PS /Users/bart> Set-SpotifyConnectPlayer -Devices "10012","10013","10014" -Play $false
    #>

    [CmdLetBinding(DefaultParameterSetName)]
    Param (
        [Parameter(Mandatory=$true)]
        [Array]$Devices,

        [Parameter(Mandatory=$false)]
        [Boolean]$Play = $true
    )

    Invoke-RestMethod -Uri "https://api.spotify.com/v1/me/player" -Method PUT -Headers @{Authorization="Bearer "+(Get-SpotifyAccessToken)} -Body (@{device_ids=$Devices;play=$Play} | ConvertTo-JSON)
}