Function Get-SpotifyCategories {
    <#
        .SYNOPSIS
            Returns a list of categories used to tag items in Spotify.

        .EXAMPLE
            PS /Users/bart> Get-SpotifyCategories

        .PARAMETER Locale
            Optional. The desired language, consisting of a lowercase ISO 639 language code and an uppercase ISO 3166-1 alpha-2 country code, joined by an underscore.

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
        [String]$Locale,

        [Parameter(Mandatory=$false)]
        [String]$Country,

        [Parameter(Mandatory=$false)]
        [String]$Limit,

        [Parameter(Mandatory=$false)]
        [String]$Offset
    )

    $BaseURL = "https://api.spotify.com/v1/browse/categories"

    If ($Locale)
    {
        If ($BaseURL -eq "https://api.spotify.com/v1/browse/categories")
        {
            $BaseURL += "?locale=$Locale"
        }
        Else
        {
            $BaseURL += "&locale=$Locale"
        }
    }

    If ($Country)
    {
        If ($BaseURL -eq "https://api.spotify.com/v1/browse/categories")
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
        If ($BaseURL -eq "https://api.spotify.com/v1/browse/categories")
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
        If ($BaseURL -eq "https://api.spotify.com/v1/browse/categories")
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