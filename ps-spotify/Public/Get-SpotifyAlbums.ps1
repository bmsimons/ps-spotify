Function Get-SpotifyAlbums {
    <#
        .SYNOPSIS
            Returns Spotify catalog information for multiple albums.

        .EXAMPLE
            PS /Users/bart> Get-SpotifyAlbums "41MnTivkwTO3UUJ8DrqEJJ","6JWc4iAiJ9FjyK0B59ABb4"

        .PARAMETER Albums
            Required. The Spotify IDs for the albums, supplied as an array.
    #>

    [CmdLetBinding(DefaultParameterSetName)]
    Param (
        [Parameter(Mandatory=$true)]
        [Array]$Albums
    )

    $Albums = [String]::Join(",", $Albums)

    Invoke-RestMethod -Uri "https://api.spotify.com/v1/albums/?ids=$Albums" -Method GET -Headers @{Authorization="Bearer "+(Get-SpotifyAccessToken)}
}