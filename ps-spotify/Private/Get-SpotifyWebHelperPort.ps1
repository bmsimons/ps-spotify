Function Get-SpotifyWebHelperPort {
    [CmdletBinding()]
    [OutputType(
        [Int]
    )]

    Param (

    )

    ForEach ($Connection in Get-NetTCPConnection -State Listen | Select LocalPort, OwningProcess | where { $_.LocalPort -ge 4370 -and $_.LocalPort -le 4380 }) {
        If ((Get-Process | where { $_.ProcessName -eq "Spotify" }).Id -contains $Connection.OwningProcess) {
            return $Connection.LocalPort
        }
    }
}