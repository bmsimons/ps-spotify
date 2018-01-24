Function Set-SpotifyConnectVolume {
    <#
        .SYNOPSIS
            Toggle shuffle on or off for user’s playback.

        .PARAMETER State
            Required. Specifies whether the user's playback needs to be shuffled.

        .PARAMETER DeviceID
            Optional. The id of the device this command is targeting. If not supplied, the user's currently active device is the target.

        .EXAMPLE Shuffles the user's playback
            PS /Users/bart> Set-SpotifyConnectShuffle -State $true
    #>

    [CmdLetBinding(DefaultParameterSetName)]
    Param (
        [Parameter(Mandatory=$true)]
        [Boolean]$State,

        [Parameter(Mandatory=$false)]
        [String]$DeviceID
    )

    If ($State)
    {
        $State = "true"
    }
    Else
    {
        $State = "false"
    }

    [String]$BaseURL = "https://api.spotify.com/v1/me/player/shuffle?state=$State"

    If ($DeviceID)
    {
        $BaseURL = $BaseURL+"&device_id=$DeviceID"
    }

    Invoke-RestMethod -Uri $BaseURL -Method PUT -Headers @{Authorization="Bearer "+(Get-SpotifyAccessToken)}
}