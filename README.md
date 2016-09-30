ps-spotify
==========
A PowerShell module that talks to your Spotify client!

**How does this work?**  
  
The Spotify client for Windows, Mac and Linux has a built-in local API server that runs when you are running the client.
This API server was built in by Spotify to make the so-called "Spotify Play" buttons talk to your Spotify client running on your computer.
ps-spotify is able to send crafted GET requests to this API server to control your Spotify client.

**Currently implemented functions:**
- `Find-SpotifyItem`
- `Get-SpotifyTrackStatus`
- `Set-SpotifyTrack`

**Command arguments:**
- `Find-SpotifyItem [-SearchQuery] <string> [-SearchType] {Artist | Track | Playlist | Album} [[-Limit] <int>] [[-Offset] <int>]  [<CommonParameters>]`
- `Get-SpotifyTrackStatus [[-Port] <string>]  [<CommonParameters>]`
- `Set-SpotifyTrack [-Port <string>]  [<CommonParameters>]`
- `Set-SpotifyTrack -SpotifyUri <string> [-Port <string>]  [<CommonParameters>]`
- `Set-SpotifyTrack [-Pause] [-Port <string>]  [<CommonParameters>]`
- `Set-SpotifyTrack [-Resume] [-Port <string>]  [<CommonParameters>]`

**Notes:**  
Please note that the Port flag defaults to port 4371. If the script doesn't work, try setting the port flag to a value between 4370 and 4380.  
The SearchType flag used in `Get-SpotifySearch` only supports the following strings: 'album', 'artist', 'playlist' and 'track'.  
The Limit flag in `Get-SpotifySearch` defaults to 50.  
The Offset flag in `Get-SpotifySearch` defaults to 0.

**Install guide:**  
First of all, make sure you have Git installed on your computer (I recommend the Github client).  
Start up a Git shell, and run the following command  
`git clone https://github.com/bmsimons/ps-spotify.git C:\Users\YOURUSERNAMEHERE\Documents\WindowsPowerShell\Modules\ps-spotify`  
You can now close your git client window. You can now import this module like this:  
`Import-Module ps-spotify`  
and now you can make use of all documented commands. Happy Spotifying!  


**Changelog:**
- v0.3a (Current): Added automatic Spotify web helper port fetching.  
- v0.3: Major overhaul, added cmdlet parameter binding and merged play functions into single cmdlet. 
- v0.2 Second release
- v0.1g: Updated markdown  
- v0.1f: Updated the documentation, renamed module file  
- v0.1e: Added a `Get-SpotifySearch` function
- v0.1a: Readme markdown fixes  
- v0.1: Initial release
