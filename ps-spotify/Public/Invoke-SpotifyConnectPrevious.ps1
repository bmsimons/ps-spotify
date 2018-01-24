Function Invoke-SpotifyConnectPrevious {
    <#
        .SYNOPSIS
            Sets the current song to the previous song using Spotify Connect.

        .PARAMETER DeviceID
            Optional. The id of the device this command is targeting. If not supplied, the user's currently active device is the target.

        .EXAMPLE
            Go back to the previous song

            PS /Users/bart> Invoke-SpotifyConnectPrevious
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

    Invoke-RestMethod -Uri "https://api.spotify.com/v1/me/player/previous" -Method POST -Headers @{Authorization="Bearer "+(Get-SpotifyAccessToken)} -Body ($Body | ConvertTo-JSON)
}