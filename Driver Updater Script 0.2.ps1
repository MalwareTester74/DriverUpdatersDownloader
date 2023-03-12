# Welcome message and credits
Write-Host "Welcome to the driver installer script!" -ForegroundColor Green
Write-Host ""
Write-Host "This script was created by Anothergame#5027 from PC Help Hub." -ForegroundColor Cyan
Write-Host ""

# Check for internet connection
$ping = New-Object System.Net.NetworkInformation.Ping
$ip = "8.8.8.8" # Google's DNS server
$timeout = 1000 # Timeout in milliseconds
$pingResult = $ping.Send($ip, $timeout)

if ($pingResult.Status -ne "Success") {
    # No internet connection, exit script
    Write-Host "Check your internet connection and try again." -ForegroundColor Red
    Read-Host "Press Enter to exit..."
    exit
} else {
    Write-Host "Internet connection detected. Installation of the programs can now proceed." -ForegroundColor DarkYellow
}

# Check if system is 32-bit
$is32Bit = $env:PROCESSOR_ARCHITECTURE -eq "x86"

# Prompt user to confirm download
$confirmation = Read-Host "This script will download Snappy Driver Installer and DriversCloud and save them on your Desktop. Do you want to proceed? (Y/N)"

if ($confirmation -eq "Y" -or $confirmation -eq "y") {
    # Define download URLs
    $sdioUrl = "https://www.glenn.delahoy.com/downloads/sdio/SDIO_1.12.9.749.zip"
    $driversCloudUrl = "https://www.driverscloud.com/en/start/DownloadApp?type=INSTALL64ZIP"
    if ($is32Bit) {
        $driversCloudUrl = "https://www.driverscloud.com/en/start/DownloadApp?type=INSTALL32ZIP"
    }
    $patchMyPCUrl = "https://patchmypc.com/freeupdater/PatchMyPC.exe"

    # Define desktop path
    $desktopPath = [Environment]::GetFolderPath("Desktop")

    # Download Snappy Driver Installer
    Write-Host "Downloading Snappy Driver Installer..." -ForegroundColor Yellow
    Invoke-WebRequest -Uri $sdioUrl -OutFile "$desktopPath\SDIO_1.12.9.749.zip"
    Write-Host "Snappy Driver Installer has been downloaded and saved on your Desktop!" -ForegroundColor Green
    Write-Host ""

    # Extract Snappy Driver Installer
    Write-Host "Extracting Snappy Driver Installer..." -ForegroundColor Yellow
    Expand-Archive -Path "$desktopPath\SDIO_1.12.9.749.zip" -DestinationPath "$desktopPath\SDIO" -Force
    Write-Host "Snappy Driver Installer has been extracted to your Desktop!" -ForegroundColor Green
    Write-Host ""

    # Download DriversCloud
    Write-Host "Downloading DriversCloud..." -ForegroundColor Yellow
    Invoke-WebRequest -Uri $driversCloudUrl -OutFile "$desktopPath\DriversCloud.zip"
    Write-Host "DriversCloud has been downloaded and saved on your Desktop!" -ForegroundColor Green
    Write-Host ""

    # Extract DriversCloud
    Write-Host "Extracting DriversCloud..." -ForegroundColor Yellow
    Expand-Archive -Path "$desktopPath\DriversCloud.zip" -DestinationPath "$desktopPath\DriversCloud" -Force
    Write-Host "DriversCloud has been extracted to your Desktop!" -ForegroundColor Green
    Write-Host ""

}

Write-Host "Cleaning up..." -ForegroundColor Yellow
Remove-Item "$desktopPath\SDIO_1.12.9.749.zip" -Force
Remove-Item "$desktopPath\DriversCloud.zip" -Force
Write-Host "Zip files deleted." -ForegroundColor Green
Write-Host ""
$patchMyPCConfirmation = Read-Host "Do you want to download and run PatchMyPC to update your software? (Y/N)"
if ($patchMyPCConfirmation -eq "Y" -or $patchMyPCConfirmation -eq "y") {
Write-Host "PatchMyPC will now be downloaded and run." -ForegroundColor Yellow
Invoke-WebRequest -Uri "https://patchmypc.com/freeupdater/PatchMyPC.exe" -OutFile "$desktopPath\PatchMyPC.exe"
Start-Process "$desktopPath\PatchMyPC.exe" -Wait
Write-Host "PatchMyPC has finished running. Your software should now be up to date!" -ForegroundColor Green
Write-Host ""
}

if ($pingResult.Status -eq "Success") {
Write-Host "Installation has finished, you can now use them. Enjoy!" -ForegroundColor Yellow
} else {
Write-Host "Please check your internet connection and try again." -ForegroundColor Red
}

Write-Host "Thank you for using the driver installer script!" -ForegroundColor Green
Write-Host "This script was created by Anothergame#5027 from PC Help Hub." -ForegroundColor Cyan
$closeConfirmation = Read-Host "Press Enter to close the script."
