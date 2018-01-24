Function Find-SpotifyItem {
    <#
        .SYNOPSIS
            Returns Spotify catalog information about artists, albums, tracks or playlists that match a keyword string.

        .EXAMPLE
            PS /Users/bart> Find-SpotifyItem -Type track -Query "suburban train"

        .PARAMETER Type
            Required. A comma-separated list of item types to search across. Valid types are: album, artist, playlist, and track.

    #>

    [CmdLetBinding(DefaultParameterSetName)]
    Param (
        [Parameter(Mandatory=$true)]
        [ValidateSet('album','artist','playlist','track')]
        [Array]$Type,

        [Parameter(Mandatory=$true)]
        [String]$Query
    )

    $Query = [Uri]::EscapeDataString($Query)
    $Type  = [String]::Join(",", $Type)

    Invoke-RestMethod -Uri "https://api.spotify.com/v1/search?q=$Query&type=$Type" -Method GET -Headers @{Authorization="Bearer "+(Get-SpotifyAccessToken)}
}