<# Spotify.psm1 - A PowerShell module that talks to your Spotify client! #>
<# See 'README.md' for usage and version information #>

Function Get-SpotifyOauthKey {
    Write-Output -InputObject (Invoke-RestMethod -Method Get "https://open.spotify.com/token").t
}

Function Get-SpotifyCsrfKey {
    
    Param (
        [Parameter()]
        [String]
        $Port = "4371"
    )

    Write-Output -InputObject (Invoke-RestMethod -Method Get "https://www.spotilocal.com:$PORT/simplecsrf/token.json" -Headers @{ "Origin" = "https://open.spotify.com" }).token
}

Function Set-SpotifyPause {
    Param (
        [Parameter()]
        [String]
        $OauthKey = (Get-SpotifyOauthKey), 
        
        [Parameter()]
        [String]
        $CsrfKey = (Get-SpotifyCsrfKey), 
        
        [Parameter()]
        [String]
        $Port = "4371"
    )

    Invoke-RestMethod -Method GET "https://www.spotilocal.com:$Port/remote/pause.json?oauth=$OauthKey&csrf=$CsrfKey&pause=true" -Headers @{ "Origin" = "https://open.spotify.com" } | 
        Out-Null
}

Function Set-SpotifyResume {

    Param (
        [Parameter()]
        [String]
        $OauthKey = (Get-SpotifyOauthKey), 
        
        [Parameter()]
        [String]
        $CsrfKey = (Get-SpotifyCsrfKey), 
        
        [Parameter()]
        [String]
        $Port = "4371"
    )

    Invoke-RestMethod -Method GET "https://www.spotilocal.com:$Port/remote/pause.json?oauth=$OauthKey&csrf=$CsrfKey&pause=false" -Headers @{ "Origin" = "https://open.spotify.com" } | 
        Out-Null
}

Function Get-SpotifyStatus {
    
    Param (
        [Parameter()]
        [String]
        $OauthKey = (Get-SpotifyOauthKey), 
        
        [Parameter()]
        [String]$CsrfKey = (Get-SpotifyCsrfKey), 
        
        [Paremter()]
        [String]
        $Port = "4371"
        
    )

    Write-Output -InputObject (Invoke-RestMethod -Method GET "https://www.spotilocal.com:$Port/remote/status.json?oauth=$OauthKey&csrf=$CsrfKey" -Headers @{ "Origin" = "https://open.spotify.com" })
}

Function Set-SpotifyMusic {
    
    Param (
        [Parameter()]
        [String]
        $OauthKey = (Get-SpotifyOauthKey), 
        
        [Parameter()]
        [String]
        $CsrfKey = (Get-SpotifyCsrfKey), 
        
        [Parameter(
            Mandatory = $true
        )]
        [String]
        $Uri, 
        
        [Parameter()]
        [String]
        $Port = "4371"
    )

    Invoke-RestMethod -Method GET "https://www.spotilocal.com:$Port/remote/play.json?oauth=$OauthKey&csrf=$CsrfKey&uri=$Uri" -Headers @{ "Origin" = "https://open.spotify.com" } | 
        Out-Null
}

Function Get-SpotifySearch {
        
    Param (
        [Parameter(
            Mandatory = $true
        )]
        [String]
        $SearchQuery, 
        
        [Parameter()]
        [ValidateSet(
            "Artist",
            "Track",
            "Playlist",
            "Album"
        )]
        [String]
        $SearchType = $null, 
        
        [Parameter()]
        [Int]
        $Limit = 50, 
        
        [Parameter()]
        [Int]
        $Offset = 0
    )

    $results = nvoke-RestMethod -Method GET "https://api.spotify.com/v1/search?q=$SearchQuery&type=$SearchType&limit=$Limit&offset=$Offset"

    if ($PSBoundParameters.ContainsKey("SeachType")) {
        $results = $results.$SearchType
    }

    Write-Output -InputObject $results
}

Export-ModuleMember -Function *
