# Test if Spotify is installed.
if (-not (Test-Connection -ComputerName "www.spotilocal.com" -Count 1 -Quiet)) {
    Write-Error -Message "Spotify is not installed."
    $_
    return
}

# Launch spotify if its not running.
if (-not (Get-Process -Name "Spotify" -ErrorAction SilentlyContinue)) {
    try {
        Start-Process -FilePath "$env:APPDATA\Spotify\Spotify.exe" -ErrorAction Stop -PassThru
    } catch {
        Write-Error -Message "Failed to start Spotify."
        $_
        return
    }
}

$paths = @(
    'Private',
    'Public'
)

foreach ($path in $paths) {
    "$(Split-Path -Path $MyInvocation.MyCommand.Path)\$path\*.ps1" | 
        Resolve-Path | 
            ForEach-Object { 
                . $_.ProviderPath 
            }
}
