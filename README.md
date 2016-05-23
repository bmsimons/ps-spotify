ps-spotify
==========
A PowerShell module that talks to your Spotify client!

**How does this work?**  
  
The Spotify client for Windows, Mac and Linux has a built-in local API server that runs when you are running the client.
This API server was built in by Spotify to make the so-called "Spotify Play" buttons talk to your Spotify client running on your computer.
ps-spotify is able to send crafted GET requests to this API server to control your Spotify client.

**Currently implemented functions:**
- `Get-SpotifyCsrfKey`
- `Get-SpotifyOauthKey`
- `Get-SpotifyStatus`
- `Set-SpotifyMusic`
- `Set-SpotifyPause`
- `Set-SpotifyResume`
- `Get-SpotifySearch`

**Command arguments:**
- `Get-SpotifyCsrfKey [[-Port] <string>]`
- `Get-SpotifyOauthKey`
- `Get-SpotifyStatus [[-OauthKey] <string>] [[-CsrfKey] <string>] [[-Port] <string>]`
- `Set-SpotifyMusic [[-OauthKey] <string>] [[-CsrfKey] <string>] [[-Uri] <string>] [[-Port] <string>]`
- `Set-SpotifyPause [[-OauthKey] <string>] [[-CsrfKey] <string>] [[-Port] <string>]`
- `Set-SpotifyResume [[-OauthKey] <string>] [[-CsrfKey] <string>] [[-Port] <string>]`
- `Get-SpotifySearch [[-SearchQuery] <string>] [[-SearchType] <string>] [[-Limit] <int>] [[-Offset] <int>]`

**Usage examples:**
- Get the client's status:  
`Get-SpotifyStatus -OauthKey (Get-SpotifyOauthKey) -CsrfKey (Get-SpotifyCsrfKey -Port "4371") -Port "4371"`
  
- Pause music:  
`Set-SpotifyPause -OauthKey (Get-SpotifyOauthKey) -CsrfKey (Get-SpotifyCsrfKey -Port "4371") -Port "4371"`
  
- Resume music:  
`Set-SpotifyResume -OauthKey (Get-SpotifyOauthKey) -CsrfKey (Get-SpotifyCsrfKey -Port "4371") -Port "4371"`
  
- Play a playlist/song/album:  
`Set-SpotifyMusic -OauthKey (Get-SpotifyOauthKey) -CsrfKey (Get-SpotifyCsrfKey -Port "4371") -Uri "spotify:album:6TJmQnO44YE5BtTxH8pop1" -Port "4371"`

- Search for a playlist:  
`Get-SpotifySearch -SearchQuery "playlist 123" -SearchType "playlist"`

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
v0.2 (Current): Second release
v0.1g: Updated markdown  
v0.1f: Updated the documentation, renamed module file  
v0.1e: Added a `Get-SpotifySearch` function   
v0.1a: Readme markdown fixes  
v0.1: Initial release