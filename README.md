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

**Command arguments:**
- `Get-SpotifyCsrfKey [[-Port] <string>]`
- `Get-SpotifyOauthKey`
- `Get-SpotifyStatus [[-OauthKey] <string>] [[-CsrfKey] <string>] [[-Port] <string>]`
- `Set-SpotifyMusic [[-OauthKey] <string>] [[-CsrfKey] <string>] [[-Uri] <string>] [[-Port] <string>]`
- `Set-SpotifyPause [[-OauthKey] <string>] [[-CsrfKey] <string>] [[-Port] <string>]`
- `Set-SpotifyResume [[-OauthKey] <string>] [[-CsrfKey] <string>] [[-Port] <string>]`

**Usage examples:**
- Get the client's status:  
`Get-SpotifyStatus -OauthKey (Get-SpotifyOauthKey) -CsrfKey (Get-SpotifyCsrfKey -Port "4371") -Port "4371"`
  
- Pause music:  
`Set-SpotifyPause -OauthKey (Get-SpotifyOauthKey) -CsrfKey (Get-SpotifyCsrfKey -Port "4371") -Port "4371"`
  
- Resume music:  
`Set-SpotifyResume -OauthKey (Get-SpotifyOauthKey) -CsrfKey (Get-SpotifyCsrfKey -Port "4371") -Port "4371"`
  
- Play a playlist/song/album:  
`Set-SpotifyMusic -OauthKey (Get-SpotifyOauthKey) -CsrfKey (Get-SpotifyCsrfKey -Port "4371") -Uri "spotify:album:6TJmQnO44YE5BtTxH8pop1" -Port "4371"`

**Notes:**  
Please note that the Port flag defaults to port 4371. If the script doesn't work, try setting the port flag to a value between 4370 and 4380.
Happy Spotify-ing through PowerShell!

**Install guide:**  
First of all, make sure you have Git installed on your computer (I recommend the Github client).  
Start up a Git shell and change the working directory to C:

**Changelog:**  
v0.1e (Current): Added a `Get-SpotifySearch` function  
v0.1d: Readme markdown fixes  
v0.1c: Readme markdown fixes  
v0.1b: Readme markdown fixes  
v0.1a: Readme markdown fixes  
v0.1: Initial release