Function Invoke-SpotifyConnectSkip {
    <#
        .SYNOPSIS
            Skips the current song using Spotify Connect.

        .PARAMETER DeviceID
            Optional. The id of the device this command is targeting. If not supplied, the user's currently active device is the target.

        .EXAMPLE
            Skip the current song

            PS /Users/bart> Invoke-SpotifyConnectSkip
    #>

    [CmdLetBinding(DefaultParameterSetName)]
    Param (
        [Parameter(Mandatory=$false)]
        [String]$DeviceID
    )

    $Body = New-Object PSCustomObject

    If ($DeviceID)
    {
        $Body | Add-Member -Name "device_id" -Value $DeviceID -MemberType NoteProperty
    }

    Invoke-RestMethod -Uri "https://api.spotify.com/v1/me/player/next" -Method POST -Headers @{Authorization="Bearer "+(Get-SpotifyAccessToken)} -Body ($Body | ConvertTo-JSON)
}