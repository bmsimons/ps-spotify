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
