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
            ParameterSetName = "Play"
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
        $Port = 4371
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
