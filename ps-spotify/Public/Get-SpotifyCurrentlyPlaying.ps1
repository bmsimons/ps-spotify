Function Get-SpotifyCurrentlyPlaying {
    <#
        .SYNOPSIS
            Returns the currently playing track.

        .EXAMPLE
            PS /Users/bart> Get-SpotifyCurrentlyPlaying
    #>

    Invoke-RestMethod -Uri "https://api.spotify.com/v1/me/player/currently-playing" -Method GET -Headers @{Authorization="Bearer "+(Get-SpotifyAccessToken)}
}