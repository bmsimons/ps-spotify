<#
.SYNOPSIS
    Finds a Spotify Item.
.DESCRIPTION
    Finds a Spotify Items using the REST API.
.INPUTS
    System.String.
    System.Int.
.OUTPUTS
    System.Managment.Automation.PSCustomObject.
.PARAMETER SearchQuery
    The text value to search on.
.PARAMETER SearchType
    The item type to return from the search.
.PARAMETER limit
    A maximum number of results to return.
.PARAMETER offset
.EXAMPLE
    PS C:\> Find-SpotifyItem -SearchQuery "Mudvayne" -SearchType Artist


    external_urls : @{spotify=https://open.spotify.com/artist/2Pfv2w8a20xzC7Dr7QXRqM}
    followers     : @{href=; total=160592}
    genres        : {alternative metal, groove metal, industrial metal, melodic metalcore...}
    href          : https://api.spotify.com/v1/artists/2Pfv2w8a20xzC7Dr7QXRqM
    id            : 2Pfv2w8a20xzC7Dr7QXRqM
    images        : {@{height=1137; url=https://i.scdn.co/image/3b22c0ea1e522a12b1bf299d4bfbbd61a948484d; width=1000}, @{height=728;
                    url=https://i.scdn.co/image/551c5eb5ff81aa51f2752690c1771026717fb5f7; width=640}, @{height=227;
                    url=https://i.scdn.co/image/5f53134f0b12e4653eaba2a75ab96a0417517478; width=200}, @{height=73;
                    url=https://i.scdn.co/image/72ba4be670f00bcd78a918edcdebd06ab0f31fc0; width=64}}
    name          : Mudvayne
    popularity    : 60
    type          : artist
    uri           : spotify:artist:2Pfv2w8a20xzC7Dr7QXRqM

    external_urls : @{spotify=https://open.spotify.com/artist/7DSmGVe0vJZBzwS2BSg3he}
    followers     : @{href=; total=24}
    genres        : {}
    href          : https://api.spotify.com/v1/artists/7DSmGVe0vJZBzwS2BSg3he
    id            : 7DSmGVe0vJZBzwS2BSg3he
    images        : {@{height=640; url=https://i.scdn.co/image/5e57b13b6a27e0614200ea4b04bd329af7c3bec8; width=640}, @{height=300;
                    url=https://i.scdn.co/image/2ecd5196add32ed3cd8cfc560efa9902630ce81a; width=300}, @{height=64;
                    url=https://i.scdn.co/image/cde49245872f177d3a586a092823204300fde1bd; width=64}}
    name          : Mudvayne Tribute
    popularity    : 1
    type          : artist
    uri           : spotify:artist:7DSmGVe0vJZBzwS2BSg3he

    external_urls : @{spotify=https://open.spotify.com/artist/6LDg4vqMCyUMhcKsRJqM5u}
    followers     : @{href=; total=3}
    genres        : {}
    href          : https://api.spotify.com/v1/artists/6LDg4vqMCyUMhcKsRJqM5u
    id            : 6LDg4vqMCyUMhcKsRJqM5u
    images        : {}
    name          : Various Artists - Mudvayne Tribute
    popularity    : 0
    type          : artist
    uri           : spotify:artist:6LDg4vqMCyUMhcKsRJqM5u
.EXAMPLE
    PS C:\> Find-SpotifyItem -SearchQuery "nothing to gein" -SearchType Track


    album             : @{album_type=album; available_markets=System.Object[]; external_urls=; href=https://api.spotify.com/v1/albums/79cxLehm2WE9NMIRcJaqK9;
                        id=79cxLehm2WE9NMIRcJaqK9; images=System.Object[]; name=L.D. 50; type=album; uri=spotify:album:79cxLehm2WE9NMIRcJaqK9}
    artists           : {@{external_urls=; href=https://api.spotify.com/v1/artists/2Pfv2w8a20xzC7Dr7QXRqM; id=2Pfv2w8a20xzC7Dr7QXRqM; name=Mudvayne;
                        type=artist; uri=spotify:artist:2Pfv2w8a20xzC7Dr7QXRqM}}
    available_markets : {AD, AR, AU, BE...}
    disc_number       : 1
    duration_ms       : 328733
    explicit          : False
    external_ids      : @{isrc=USSM10011127}
    external_urls     : @{spotify=https://open.spotify.com/track/099F8DBwudywg5KK6WVFox}
    href              : https://api.spotify.com/v1/tracks/099F8DBwudywg5KK6WVFox
    id                : 099F8DBwudywg5KK6WVFox
    name              : Nothing To Gein
    popularity        : 34
    preview_url       : https://p.scdn.co/mp3-preview/25425dec1ef9831283e01998bba522233a05b882
    track_number      : 8
    type              : track
    uri               : spotify:track:099F8DBwudywg5KK6WVFox
.NOTES
    These JSON objects may be come Class based objects for readability.
.LINK
    https://bartsimons.me
.LINK
    https://dotps1.github.io
#>

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
