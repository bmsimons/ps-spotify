Function Get-SpotifyTrack {
    <#
        .SYNOPSIS
            Returns Spotify catalog information for a single track identified by its unique Spotify ID.

        .EXAMPLE
            PS /Users/bart> Get-SpotifyTrack 3n3Ppam7vgaVa1iaRUc9Lp

        .PARAMETER Track
            Required. The Spotify ID for the track.
    #>

    [CmdLetBinding(DefaultParameterSetName)]
    Param (
        [Parameter(Mandatory=$true)]
        [String]$Track
    )

    Invoke-RestMethod -Uri "https://api.spotify.com/v1/tracks/$Track" -Method GET -Headers @{Authorization="Bearer "+(Get-SpotifyAccessToken)}
}