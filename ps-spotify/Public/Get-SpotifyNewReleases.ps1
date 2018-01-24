Function Get-SpotifyNewReleases {
    <#
        .SYNOPSIS
            Returns a list of newly released albums on Spotify.

        .EXAMPLE
            PS /Users/bart> Get-SpotifyNewReleases

        .PARAMETER Country
            Optional. A country: an ISO 3166-1 alpha-2 country code. Provide this parameter if you want the list of returned items to be relevant to a particular country.

        .PARAMETER Limit
            Optional. The maximum number of items to return. Default: 20. Minimum: 1. Maximum: 50.

        .PARAMETER Offset
            Optional. The index of the first item to return. Default: 0 (the first object). Use with limit to get the next set of items.
    #>

    [CmdLetBinding(DefaultParameterSetName)]
    Param (
        [Parameter(Mandatory=$false)]
        [String]$Country,

        [Parameter(Mandatory=$false)]
        [String]$Limit,

        [Parameter(Mandatory=$false)]
        [String]$Offset
    )

    $BaseURL = "https://api.spotify.com/v1/browse/new-releases"

    If ($Country)
    {
        If ($BaseURL -eq "https://api.spotify.com/v1/browse/new-releases")
        {
            $BaseURL += "?country=$Country"
        }
        Else
        {
            $BaseURL += "&country=$Country"
        }
    }

    If ($Limit)
    {
        If ($BaseURL -eq "https://api.spotify.com/v1/browse/new-releases")
        {
            $BaseURL += "?limit=$Limit"
        }
        Else
        {
            $BaseURL += "&limit=$Limit"
        }
    }

    If ($Offset)
    {
        If ($BaseURL -eq "https://api.spotify.com/v1/browse/new-releases")
        {
            $BaseURL += "?offset=$Offset"
        }
        Else
        {
            $BaseURL += "&offset=$Offset"
        }
    }

    Invoke-RestMethod -Uri $BaseURL -Method GET -Headers @{Authorization="Bearer "+(Get-SpotifyAccessToken)}
}