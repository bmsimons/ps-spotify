Function Find-SpotifyItem {
    
    [CmdletBinding()]
    [OutputType(
        [PSCustomObject]
    )]

    Param (
        [Parameter(
            Mandatory = $true
        )]
        [String]
        $SearchQuery, 
        
        [Parameter(
            Mandatory = $true
        )]
        [ValidateSet(
            "Artist",
            "Track",
            "Playlist",
            "Album"
        )]
        [String]
        $SearchType, 
        
        [Parameter()]
        [Int]
        $Limit = 50, 
        
        [Parameter()]
        [Int]
        $Offset = 0
    )

    $params = @{
        Method = "Get"
        Uri = "https://api.spotify.com/v1/search?q={0}&type={1}&limit={2}&offset={3}" -f $SearchQuery, $SearchType, $Limit, $Offset
        ErrorAction = "Stop"
    }
    try {
        $result = Invoke-RestMethod @params

        Write-Output -InputObject $result."${SearchType}s".items
    } catch {
        $_
    }
}
