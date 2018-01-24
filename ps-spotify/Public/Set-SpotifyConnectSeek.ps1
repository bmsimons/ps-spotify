Function Set-SpotifyConnectSeek {
    <#
        .SYNOPSIS
            Seeks to the given position in the user’s currently playing track.

        .PARAMETER PositionMS
            Required. The position in milliseconds to seek to. Must be a positive number. Passing in a position that is greater than the length of the track will cause the player to start playing the next song.

        .PARAMETER DeviceID
            Optional. The id of the device this command is targeting. If not supplied, the user's currently active device is the target.

        .EXAMPLE
            Seek to the 10th second of the current playing track

            PS /Users/bart> Set-SpotifyConnectSeek -PositionMS 10000
    #>

    [CmdLetBinding(DefaultParameterSetName)]
    Param (
        [Parameter(Mandatory=$true)]
        [Int]$PositionMS,

        [Parameter(Mandatory=$false)]
        [String]$DeviceID
    )

    [String]$BaseURL = "https://api.spotify.com/v1/me/player/seek?position_ms=$PositionMS"

    If ($DeviceID)
    {
        $BaseURL = $BaseURL+"&device_id=$DeviceID"
    }

    Invoke-RestMethod -Uri $BaseURL -Method PUT -Headers @{Authorization="Bearer "+(Get-SpotifyAccessToken)}
}