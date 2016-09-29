Function Get-SpotifyCsrfKey {
    
    [CmdletBinding()]
    [OutputType(
        [String]
    )]

    Param (
        [Parameter(
            Mandatory = $true
        )]
        [ValidateRange(
            4370, 4380
        )]
        [Int]
        $Port
    )

    $params = @{
        Method = "Get"
        Uri = "https://www.spotilocal.com:{0}/simplecsrf/token.json" -f $Port
        Headers = @{
            "Origin" = "https://open.spotify.com"
        }
        ErrorAction = "Stop"
    }

    try {
        $request = Invoke-RestMethod @params
        Write-Output -InputObject $request.token
    } catch {
        $_
    }
}
