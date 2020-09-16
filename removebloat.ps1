# This will remove alot of windows default installed apps 
# Run as administrator
# TODO: some of these have changed names or is no longer being installed

$Apps = @("Cortana", "OfficeHub", "Messaging", "Solitaire", "3DBuilder", "Bing", "ConnectivityStore", "Getstarted", "Messaging",  "Skype", "Xbox", "Zune", "BioEnrollment", "ContactSupport", "windowsmaps", "Twitter", "NetworkSpeedTest", "Duolingo", "Pandora", "Print3D", "AdobePhotoshopExpress", "WindowsCamera", "Microsoft3DViewer", "windowsphone", "Microsoft.YourPhone", "windowsalarms", "windowscommunicationsapps", "windowscamera", "onenote", "people")

ForEach($App in $Apps) {
    $AppPattern = "*$App*"
    Get-AppxPackage | Where-Object {$_.Name -like $AppPattern} | % { Remove-AppxPackage -package $_.PackageFullName -ErrorAction Ignore }
    Get-AppxProvisionedPackage -online | Where-Object {$_.displayName -like $AppPattern} | ForEach-Object { Remove-AppxProvisionedPackage -online -packagename $_.PackageName -ErrorAction Ignore }
}
