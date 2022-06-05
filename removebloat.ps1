# This will remove alot of windows default installed apps 
# Run as administrator
# TODO: some of these have changed names or is no longer being installed
# NOTE: These can be reinstalled from the MS store.

$Apps = @("Cortana", "OfficeHub", "Messaging", "Solitaire", "3DBuilder", "Bing", "ConnectivityStore", "Getstarted", "Messaging",  "Skype", "Xbox", "Zune", "BioEnrollment", "ContactSupport", "windowsmaps", "Twitter", "NetworkSpeedTest", "Duolingo", "Pandora", "AdobePhotoshopExpress", "windowsphone", "Microsoft.YourPhone", "windowscommunicationsapps", "onenote", "people", "XboxGamingOverlay")

ForEach($App in $Apps) {
    $AppPattern = "*$App*"
    Get-AppxPackage | Where-Object {$_.Name -like $AppPattern} | % { Remove-AppxPackage -package $_.PackageFullName -ErrorAction Ignore }
    Get-AppxProvisionedPackage -online | Where-Object {$_.displayName -like $AppPattern} | ForEach-Object { Remove-AppxProvisionedPackage -online -packagename $_.PackageName -ErrorAction Ignore }
}
