<#
.SYNOPSIS
    Set the current Spotify track.
.DESCRIPTION
    Sets the state of the current Spotify track.
.INPUTS
    System.String.
.OUTPUTS
    None.
.PARAMETER SpotifyUri
    The Spotify URI to play.
.PARAMETER Pause
    Switch used to pause the current track.
.PARAMETER Resume
    Switch used to resume playback of the current track.
.PARAMETER Port
    The Port number to use when invoking the REST method against https://www.spotilocal.com
.EXAMPLE
    PS C:\> Set-SpotifyTrack -SpotifyUri "spotify:track:2gTXHAdDkCTGT9paqmgzEB"
.EXAMPLE
    PS C:\> Set-SpotifyTrack -Pause
.NOTES
.LINK
    https://bartsimons.me
.LINK
    https://dotps1.github.io
#>

Function Set-SpotifyTrack {
    
    [CmdletBinding(
        DefaultParameterSetName = "__AllParameterSets"
    )]
    [OutputType(
        [Void]
    )]

    Param (
        [Parameter(
            Mandatory = $true,
            ParameterSetName = "Play",
            ValueFromPipelineByPropertyName = $true
        )]
        [String]
        $SpotifyUri, 
        
        [Parameter(
            ParameterSetName = "Pause"
        )]
        [Switch]
        $Pause,

        [Parameter(
            ParameterSetName = "Resume"
        )]
        [Switch]
        $Resume,

        [Parameter()]
        [ValidateRange(
            4370, 4380
        )]
        [Int]
        $Port = (Get-SpotifyWebHelperPort)
    )

    switch ($PSCmdlet.ParameterSetName) {
        "Pause" {
            $restUri = "https://www.spotilocal.com:{0}/remote/pause.json?oauth={1}&csrf={2}&pause=true" -f $Port, (Get-SpotifyOAuthKey), (Get-SpotifyCsrfKey -Port $Port)
        }

        "Resume" {
            $restUri = "https://www.spotilocal.com:{0}/remote/pause.json?oauth={1}&csrf={2}&pause=false" -f $Port, (Get-SpotifyOAuthKey), (Get-SpotifyCsrfKey -Port $Port)
        }

        "Play" {
            $restUri = "https://www.spotilocal.com:{0}/remote/play.json?oauth={1}&csrf={2}&uri={3}" -f $Port, (Get-SpotifyOAuthKey), (Get-SpotifyCsrfKey -Port $Port), $SpotifyUri
        }
    }

    $params = @{
        Method = "Get"
        Uri = $restUri
        Headers = @{
            Origin = "https://open.spotify.com"
        }
        ErrorAction = "Stop"
    }

    try {
        Invoke-RestMethod @params | 
            Out-Null
    } catch {
        $_
    }
}
