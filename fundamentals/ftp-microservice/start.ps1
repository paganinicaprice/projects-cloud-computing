Write-Host "Starting FTP server..."
Start-Process -NoNewWindow -FilePath "docker-compose" -ArgumentList "up -d"
Write-Host "FTP server is running! Connect using: ftp 127.0.0.1"