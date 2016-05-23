<# Spotify.psm1 - A PowerShell module that talks to your Spotify client! #>
<# See 'README.md' for usage and version information #>

function Get-SpotifyOauthKey {
    return (Invoke-RestMethod -Method Get "https://open.spotify.com/token").t
}

function Get-SpotifyCsrfKey([string]$Port = "4371") {
    return (Invoke-RestMethod -Method Get "https://www.spotilocal.com:$PORT/simplecsrf/token.json" -Headers @{ "Origin" = "https://open.spotify.com" }).token
}

function Set-SpotifyPause([string]$OauthKey, [string]$CsrfKey, [string]$Port = "4371") {
    Invoke-RestMethod -Method GET "https://www.spotilocal.com:$Port/remote/pause.json?oauth=$OauthKey&csrf=$CsrfKey&pause=true" -Headers @{ "Origin" = "https://open.spotify.com" } | Out-Null
}

function Set-SpotifyResume([string]$OauthKey, [string]$CsrfKey, [string]$Port = "4371") {
    Invoke-RestMethod -Method GET "https://www.spotilocal.com:$Port/remote/pause.json?oauth=$OauthKey&csrf=$CsrfKey&pause=false" -Headers @{ "Origin" = "https://open.spotify.com" } | Out-Null
}

function Get-SpotifyStatus([string]$OauthKey, [string]$CsrfKey, [string]$Port = "4371") {
    Invoke-RestMethod -Method GET "https://www.spotilocal.com:$Port/remote/status.json?oauth=$OauthKey&csrf=$CsrfKey" -Headers @{ "Origin" = "https://open.spotify.com" }
}

function Set-SpotifyMusic([string]$OauthKey, [string]$CsrfKey, [string]$Uri, [string]$Port = "4371") {
    Invoke-RestMethod -Method GET "https://www.spotilocal.com:$Port/remote/play.json?oauth=$OauthKey&csrf=$CsrfKey&uri=$Uri" -Headers @{ "Origin" = "https://open.spotify.com" } | Out-Null
}

function Get-SpotifySearch([string]$SearchQuery, [string]$SearchType, [int]$Limit = 50, [int]$Offset = 0) {
    If ($SearchType -eq "artist") {
        (Invoke-RestMethod -Method GET "https://api.spotify.com/v1/search?q=$SearchQuery&type=$SearchType&limit=$Limit&offset=$Offset").artists
    } ElseIf ($SearchType -eq "track") {
        (Invoke-RestMethod -Method GET "https://api.spotify.com/v1/search?q=$SearchQuery&type=$SearchType&limit=$Limit&offset=$Offset").track
    } ElseIf ($SearchType -eq "playlist") {
        (Invoke-RestMethod -Method GET "https://api.spotify.com/v1/search?q=$SearchQuery&type=$SearchType&limit=$Limit&offset=$Offset").playlists
    } ElseIf ($SearchType -eq "album") {
        (Invoke-RestMethod -Method GET "https://api.spotify.com/v1/search?q=$SearchQuery&type=$SearchType&limit=$Limit&offset=$Offset").albums
    } Else {
        Invoke-RestMethod -Method GET "https://api.spotify.com/v1/search?q=$SearchQuery&type=$SearchType&limit=$Limit&offset=$Offset"
    }
}

Export-ModuleMember 'Get-SpotifyOauthKey'
Export-ModuleMember 'Get-SpotifyCsrfKey'
Export-ModuleMember 'Set-SpotifyPause'
Export-ModuleMember 'Set-SpotifyResume'
Export-ModuleMember 'Get-SpotifyStatus'
Export-ModuleMember 'Set-SpotifyMusic'
Export-ModuleMember 'Get-SpotifySearch'