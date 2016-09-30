<#
.SYNOPSIS
    Gets the Spotify OAuth Token.
.DESCRIPTION
    Gets the Spotify OAuth Token from https://open.spotify.com/token.
.INPUTS
    None.
.OUTPUTS
    System.String.
.EXAMPLE
    PS C:\> Get-SpotifyOauthKey
    fyKTmJGRUJYbNZbEPwC63KgrXUsOvWiIsLVxhXsWuaeKHo2fLyTxbt4vOi0Gxh33ClUe
.NOTES
    Spotify needs to running for this to work.  This validation takes place when the module is imported.
.LINK
    https://bartsimons.me
.LINK
    https://dotps1.github.io
#>

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
