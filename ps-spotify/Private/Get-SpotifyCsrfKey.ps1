<#
.SYNOPSIS
    Gets the Csrf Key Value.
.DESCRIPTION
    Gets the Crsf Key Value from the https://www.spotilocal.com (localhost).
.INPUTS
    None.
.OUTPUTS
    System.String.
.PARAMETER Port
    The Port number to use when invoking the REST method against https://www.spotilocal.com
.EXAMPLE
    PS C:\> Get-SpotifyCsrfKey -Port 4371
    0e00268419ba53396c2f559759c95dbd
.EXAMPLE
    PS C:\> Get-SPotifyCsrfKey -Port (Get-SpotifyWebHelperPort)
    0e00268419ba53396c2f559759c95dbd
.NOTES
    The Port Parameter is Mandatory on this function as it is a private function and will always be passed via the other ps-spotify Cmdlets. 
.LINK
    https://bartsimons.me
.LINK
    https://dotps1.github.io
#>

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
