Function Get-SpotifyOauthKey {

    [CmdletBinding()]
    [OutputType(
        [String]
    )]

    Param (

    )

    $params = @{
        Method = "Get"
        Uri = "https://open.spotify.com/token"
        ErrorAction = "Stop"
    }

    try {
        $request = Invoke-RestMethod @params
        Write-Output -InputObject $request.t
    } catch {
        $_
    }
}
