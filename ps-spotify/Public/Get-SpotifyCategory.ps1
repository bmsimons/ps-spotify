Function Get-SpotifyCategory {
    <#
        .SYNOPSIS
            Returns a single category used to tag items in Spotify.

        .EXAMPLE
            PS /Users/bart> Get-SpotifyCategory

        .PARAMETER CategoryID
            Required. The Spotify category ID for the category.

        .PARAMETER Locale
            Optional. The desired language, consisting of a lowercase ISO 639 language code and an uppercase ISO 3166-1 alpha-2 country code, joined by an underscore.

        .PARAMETER Country
            Optional. A country: an ISO 3166-1 alpha-2 country code. Provide this parameter if you want the list of returned items to be relevant to a particular country.
    #>

    [CmdLetBinding(DefaultParameterSetName)]
    Param (
        [Parameter(Mandatory=$true)]
        [String]$CategoryID,
        
        [Parameter(Mandatory=$false)]
        [String]$Locale,

        [Parameter(Mandatory=$false)]
        [String]$Country
    )

    $BaseURL = "https://api.spotify.com/v1/browse/categories/$CategoryID"

    If ($Locale)
    {
        If ($BaseURL -eq "https://api.spotify.com/v1/browse/categories/$CategoryID")
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
        If ($BaseURL -eq "https://api.spotify.com/v1/browse/categories/$CategoryID")
        {
            $BaseURL += "?country=$Country"
        }
        Else
        {
            $BaseURL += "&country=$Country"
        }
    }

    Invoke-RestMethod -Uri $BaseURL -Method GET -Headers @{Authorization="Bearer "+(Get-SpotifyAccessToken)}
}