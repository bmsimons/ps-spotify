$global:SpotifyBasicBearer             = ""
$global:SpotifyRefreshToken            = ""
$global:SpotifyAccessToken             = ""
$global:SpotifyAccessTokenDateExpires  = (Get-Date)

. $PSScriptRoot\Private\Get-SpotifyAccessToken.ps1
. $PSScriptRoot\Public\Get-SpotifyConnectDevice.ps1
. $PSScriptRoot\Public\Get-SpotifyConnectDevices.ps1
. $PSScriptRoot\Public\Get-SpotifyCurrentlyPlaying.ps1
. $PSScriptRoot\Public\Invoke-SpotifyConnectPrevious.ps1
. $PSScriptRoot\Public\Invoke-SpotifyConnectSkip.ps1
. $PSScriptRoot\Public\Set-SpotifyConnectPause.ps1
. $PSScriptRoot\Public\Set-SpotifyConnectPlay.ps1
. $PSScriptRoot\Public\Set-SpotifyConnectPlayer.ps1
. $PSScriptRoot\Public\Set-SpotifyConnectRepeat.ps1
. $PSScriptRoot\Public\Set-SpotifyConnectSeek.ps1
. $PSScriptRoot\Public\Set-SpotifyConnectShuffle.ps1
. $PSScriptRoot\Public\Set-SpotifyConnectVolume.ps1
. $PSScriptRoot\Public\Get-SpotifyFeaturedPlaylists.ps1
. $PSScriptRoot\Public\Get-SpotifyNewReleases.ps1
. $PSScriptRoot\Public\Get-SpotifyCategories.ps1
. $PSScriptRoot\Public\Get-SpotifyCategory.ps1
. $PSScriptRoot\Public\Get-SpotifyAlbum.ps1
. $PSScriptRoot\Public\Get-SpotifyTrack.ps1
. $PSScriptRoot\Public\Get-SpotifyAlbums.ps1
. $PSScriptRoot\Public\Get-SpotifyTracks.ps1
. $PSScriptRoot\Public\Get-SpotifyUser.ps1
. $PSScriptRoot\Public\Find-SpotifyItem.ps1