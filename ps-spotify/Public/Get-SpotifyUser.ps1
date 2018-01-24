Function Get-SpotifyUser {
    <#
        .SYNOPSIS
            Returns Spotify catalog information for a single track identified by its unique Spotify ID.

        .EXAMPLE
            PS /Users/bart> Get-SpotifyUser tuggareutangranser

        .PARAMETER User
            Required. The Spotify ID for the user.
    #>

    [CmdLetBinding(DefaultParameterSetName)]
    Param (
        [Parameter(Mandatory=$true)]
        [String]$User
    )

    Invoke-RestMethod -Uri "https://api.spotify.com/v1/users/$User" -Method GET -Headers @{Authorization="Bearer "+(Get-SpotifyAccessToken)}
}