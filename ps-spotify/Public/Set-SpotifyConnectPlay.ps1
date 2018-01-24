Function Set-SpotifyConnectPlay {
    <#
        .SYNOPSIS
            Start Spotify playback using Spotify Connect.

        .PARAMETER ContextURI
            Optional. Spotify URI of the context to play. Valid contexts are albums, artists & playlists.

        .PARAMETER URIs
            Optional. Spotify track URIs to play.

        .PARAMETER Offset
            Optional. Indicates from where in the context playback should start. Only available when ContextURI corresponds to an album or playlist object, or when the URIs parameter is used. Offset starts at 0 and can't be negative.

        .EXAMPLE
            Play an album.

            PS /Users/bart> Set-SpotifyConnectPlay -ContextURI "spotify:album:1Je1IMUlBXcx1Fz0WE7oPT"

        .EXAMPLE
            Play two songs, start at offset 0

            PS /Users/bart> Set-SpotifyConnectPlay -URIs "spotify:track:6KeXJbrg02axATKVgdW8am","spotify:track:0Dkibk70FDp6t7eOZNemNQ" -Offset 0

        .EXAMPLE
            Start playing with the currently available queue

            PS /Users/bart> Set-SpotifyConnectPlay
    #>

    [CmdLetBinding(DefaultParameterSetName)]
    Param (
        [Parameter(Mandatory=$false)]
        [String]$ContextURI,

        [Parameter(Mandatory=$false)]
        [Array]$URIs,

        [Parameter(Mandatory=$false)]
        [Int]$Offset,

        [Parameter(Mandatory=$false)]
        [Boolean]$Play = $true
    )

    $Body = New-Object PSCustomObject

    If ($ContextURI)
    {
        $Body | Add-Member -Name "context_uri" -Value $ContextURI -MemberType NoteProperty
    }

    If ($URIs)
    {
        $Body | Add-Member -Name "uris" -Value $URIs -MemberType NoteProperty
    }

    If ($Offset)
    {
        $Body | Add-Member -Name "offset" -Value ([PSCustomObject]@{position = $Offset}) -MemberType NoteProperty
    }

    Invoke-RestMethod -Uri "https://api.spotify.com/v1/me/player/play" -Method PUT -Headers @{Authorization="Bearer "+(Get-SpotifyAccessToken)} -Body ($Body | ConvertTo-JSON)
}