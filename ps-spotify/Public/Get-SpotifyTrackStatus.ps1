<#
.SYNOPSIS
    Gets the status of a Spotify track.
.DESCRIPTION
    Gets the status of a Spotify track playing on the local client.
.INPUTS
    None.
.OUTPUTS
    System.Managment.Automation.PSCustomObject.
.PARAMETER Port
    The Port number to use when invoking the REST method against https://www.spotilocal.com
.EXAMPLE
    PS C:\> Get-SpotitfyTrackStatus

    
    version          : 9
    client_version   : 1.0.38.171.g5e1cd7b2
    playing          : True
    shuffle          : True
    repeat           : False
    play_enabled     : True
    prev_enabled     : True
    next_enabled     : True
    track            : @{track_resource=; artist_resource=; album_resource=; length=251; track_type=normal}
    context          :
    playing_position : 128.955
    server_time      : 1475271729
    volume           : 1
    online           : True
    open_graph_state : @{private_session=False; posting_disabled=True}
    running          : True
.EXAMPLE
    PS C:\> Get-SpotifyTrackStatus -Port 4371


    version          : 9
    client_version   : 1.0.38.171.g5e1cd7b2
    playing          : True
    shuffle          : True
    repeat           : False
    play_enabled     : True
    prev_enabled     : True
    next_enabled     : True
    track            : @{track_resource=; artist_resource=; album_resource=; length=251; track_type=normal}
    context          :
    playing_position : 128.955
    server_time      : 1475271729
    volume           : 1
    online           : True
    open_graph_state : @{private_session=False; posting_disabled=True}
    running          : True
.NOTES
    This JSON objects may be come Class based objects for readability.
.LINK
    https://bartsimons.me
.LINK
    https://dotps1.github.io
#>

Function Get-SpotifyTrackStatus {

    [CmdletBinding()]
    [OutputType(
        [PSCustomObject]
    )]
    
    Param (
        [Parameter()]
        [ValidateRange(
            4370, 4380
        )]
        [Int]
        $Port = (Get-SpotifyWebHelperPort)
        
    )

    $params = @{
        Method = "Get"
        Uri = "https://www.spotilocal.com:{0}/remote/status.json?oauth={1}&csrf={2}" -f $Port, (Get-SpotifyOAuthKey), (Get-SpotifyCsrfKey -Port $Port)
        Headers = @{
            Origin = "https://open.spotify.com" 
        }
        ErrorAction = "Stop"
    }

    try {
        Invoke-RestMethod @params
    } catch {
        $_
    }
}
