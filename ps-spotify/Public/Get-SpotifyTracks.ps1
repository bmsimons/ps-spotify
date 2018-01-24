Function Get-SpotifyTracks {
    <#
        .SYNOPSIS
            Returns Spotify catalog information for multiple tracks.

        .EXAMPLE
            PS /Users/bart> Get-SpotifyTracks "41MnTivkwTO3UUJ8DrqEJJ","6JWc4iAiJ9FjyK0B59ABb4"

        .PARAMETER Tracks
            Required. The Spotify IDs for the tracks, supplied as an array.
    #>

    [CmdLetBinding(DefaultParameterSetName)]
    Param (
        [Parameter(Mandatory=$true)]
        [Array]$Tracks
    )

    $Tracks = [String]::Join(",", $Tracks)

    Invoke-RestMethod -Uri "https://api.spotify.com/v1/tracks/?ids=$Tracks" -Method GET -Headers @{Authorization="Bearer "+(Get-SpotifyAccessToken)}
}