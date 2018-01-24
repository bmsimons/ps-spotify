Function Get-SpotifyConnectDevices {
    <#
        .SYNOPSIS
            Returns a list of Spotify Connect devices listed on the connected Spotify account.

        .EXAMPLE
            PS /Users/bart> Get-SpotifyConnectDevices
    #>

    Invoke-RestMethod -Uri "https://api.spotify.com/v1/me/player/devices" -Method GET -Headers @{Authorization="Bearer "+(Get-SpotifyAccessToken)}
}