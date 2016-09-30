if (-not (Test-Connection -ComputerName "www.spotilocal.com" -Count 1 -Quiet)) {
    Write-Error -Message "Spotify is not installed."
    return
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
