ps-spotify
==========
A PowerShell module that talks to your Spotify client!

**How does this work?**  
  
This PowerShell module acts as a wrapper around the ![Spotify Web API](https://developer.spotify.com/web-api/endpoint-reference/). You will be able to e.g. search for songs, albums and playlists, you can even fiddle around with Spotify Connect if you want to. Just like any other Spotify API implementation, you'll need to provide a basic bearer (base64 encoded string of client_id_goes_here:client_secret_goes_here) and a refresh token. Please take a look at my other project - ![dotnet-core-spotify-authentication](https://github.com/bmsimons/dotnet-core-spotify-authentication) - this is an open-source utility you can use to get your needed refresh token. You fill in the two needed tokens in ps-spotify.psm1 and you are good to go!

If things are unclear, please check out these two articles on my website:

https://bartsimons.me/net-core-and-the-spotify-api-getting-authenticated/     
https://bartsimons.me/ps-spotify-a-powershell-module-to-control-the-spotify-web-api/     

**Currently implemented functions:**
- `Find-SpotifyItem`
- `Get-SpotifyAlbum`
- `Get-SpotifyAlbums`
- `Get-SpotifyCategory`
- `Get-SpotifyCategories`
- `Get-SpotifyCategoryPlaylists`
- `Get-SpotifyConnectDevice`
- `Get-SpotifyConnectDevices`
- `Get-SpotifyCurrentlyPlaying`
- `Get-SpotifyFeaturedPlaylists`
- `Get-SpotifyNewReleases`
- `Get-SpotifyTrack`
- `Get-SpotifyTracks`
- `Get-SpotifyUser`
- `Invoke-SpotifyConnectPrevious`
- `Invoke-SpotifyConnectSkip`
- `Set-SpotifyConnectPause`
- `Set-SpotifyConnectPlay`
- `Set-SpotifyConnectPlayer`
- `Set-SpotifyConnectRepeat`
- `Set-SpotifyConnectSeek`
- `Set-SpotifyConnectShuffle`
- `Set-SpotifyConnectVolume`

**Install guide:**  
First of all, make sure you have Git installed on your computer (I recommend the Github client).  
Start up a Git shell, and run the following command  
`git clone https://github.com/bmsimons/ps-spotify.git`
You can now close your git client window. You can now import this module like this:  
`Import-Module ./ps-spotify/ps-spotify`  
and now you can make use of all documented commands. Happy Spotifying!  

**Compatibility**
This module has been tested and proven to be working on Microsoft Windows, Apple macOS, and Linux.
If something doesn't work, try to upgrade to a newer PowerShell release.
In case if you are using Microsoft Windows, try to use the ![open-source PowerShell version](https://github.com/powershell/powershell).

**Changelog:**
- v1.0 (Current): Code base has been completely rebuilt.  
- v0.3a: Added automatic Spotify web helper port fetching.  
- v0.3: Major overhaul, added cmdlet parameter binding and merged play functions into single cmdlet. 
- v0.2 Second release  
- v0.1g: Updated markdown  
- v0.1f: Updated the documentation, renamed module file  
- v0.1e: Added a `Get-SpotifySearch` function
- v0.1a: Readme markdown fixes  
- v0.1: Initial release
