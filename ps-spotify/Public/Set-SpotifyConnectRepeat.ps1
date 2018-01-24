Function Set-SpotifyConnectRepeat {
    <#
        .SYNOPSIS
            Set the repeat mode for the user’s playback. 

        .PARAMETER State
            Required. track will repeat the current track. context will repeat the current context. off will turn repeat off.

        .PARAMETER DeviceID
            Optional. The id of the device this command is targeting. If not supplied, the user's currently active device is the target.

        .EXAMPLE Repeat the current track only
            PS /Users/bart> Set-SpotifyConnectRepeat -State track
    #>

    [CmdLetBinding(DefaultParameterSetName)]
    Param (
        [Parameter(Mandatory=$true)]
        [ValidateSet('track','context','off')]
        [String]$State,

        [Parameter(Mandatory=$false)]
        [String]$DeviceID
    )

    [String]$BaseURL = "https://api.spotify.com/v1/me/player/repeat?state=$State"

    If ($DeviceID)
    {
        $BaseURL = $BaseURL+"&device_id=$DeviceID"
    }

    Invoke-RestMethod -Uri $BaseURL -Method PUT -Headers @{Authorization="Bearer "+(Get-SpotifyAccessToken)}
}