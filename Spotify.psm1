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

Export-ModuleMember 'Get-SpotifyOauthKey'
Export-ModuleMember 'Get-SpotifyCsrfKey'
Export-ModuleMember 'Set-SpotifyPause'
Export-ModuleMember 'Set-SpotifyResume'
Export-ModuleMember 'Get-SpotifyStatus'
Export-ModuleMember 'Set-SpotifyMusic'