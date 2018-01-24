Function Get-SpotifyAccessToken {
    <#
        .SYNOPSIS
            Always returns a usable Spotify access token to use. This cmdlet checks if your current access token is still valid and if that's not the case, it will refresh it for you.

        .EXAMPLE
            PS /Users/bart> Get-SpotifyAccessToken
    #>

    If ((Get-Date) -gt $SpotifyAccessTokenDateExpires)
    {
        $Result = Invoke-RestMethod -Uri "https://accounts.spotify.com/api/token" -Method POST -Headers @{Authorization="Basic $SpotifyBasicBearer"} -Body @{grant_type="refresh_token";refresh_token="$SpotifyRefreshToken"}
        If ($Result)
        {
            Set-Variable -Name SpotifyAccessToken -Value $Result.access_token -Scope Global
            Set-Variable -Name SpotifyAccessTokenDateExpires -Value (Get-Date).AddSeconds(3540) -Scope Global
        }
    }

    return $SpotifyAccessToken
}