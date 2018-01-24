Function Get-SpotifyAlbum {
    <#
        .SYNOPSIS
            Returns Spotify catalog information for a single album.

        .EXAMPLE
            PS /Users/bart> Get-SpotifyAlbum 0sNOF9WDwhWunNAHPD3Baj

        .PARAMETER Album
            Required. The Spotify ID for the album.
    #>

    [CmdLetBinding(DefaultParameterSetName)]
    Param (
        [Parameter(Mandatory=$true)]
        [String]$Album
    )

    Invoke-RestMethod -Uri "https://api.spotify.com/v1/albums/$Album" -Method GET -Headers @{Authorization="Bearer "+(Get-SpotifyAccessToken)}
}