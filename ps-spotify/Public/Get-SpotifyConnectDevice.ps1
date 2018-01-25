Function Get-SpotifyConnectDevice {
    <#
        .SYNOPSIS
            Returns the currently active Spotify Connect device.

        .EXAMPLE
            PS /Users/bart> Get-SpotifyConnectDevice
    #>

    Invoke-RestMethod -Uri "https://api.spotify.com/v1/me/player" -Method GET -Headers @{Authorization="Bearer "+(Get-SpotifyAccessToken)}
}