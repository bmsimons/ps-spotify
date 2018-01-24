Function Set-SpotifyConnectVolume {
    <#
        .SYNOPSIS
            Set the volume for the user’s current playback device.

        .PARAMETER VolumePercent
            Required. The volume to set. Must be a value from 0 to 100 inclusive.

        .PARAMETER DeviceID
            Optional. The id of the device this command is targeting. If not supplied, the user's currently active device is the target.

        .EXAMPLE Sets the volume of the current playing device to 80 percent
            PS /Users/bart> Set-SpotifyConnectVolume -VolumePercent 80
    #>

    [CmdLetBinding(DefaultParameterSetName)]
    Param (
        [Parameter(Mandatory=$true)]
        [ValidateRange(0,100)] 
        [Int]$VolumePercent,

        [Parameter(Mandatory=$false)]
        [String]$DeviceID
    )

    [String]$BaseURL = "https://api.spotify.com/v1/me/player/volume?volume_percent=$VolumePercent"

    If ($DeviceID)
    {
        $BaseURL = $BaseURL+"&device_id=$DeviceID"
    }

    Invoke-RestMethod -Uri $BaseURL -Method PUT -Headers @{Authorization="Bearer "+(Get-SpotifyAccessToken)}
}