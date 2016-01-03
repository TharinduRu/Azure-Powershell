$disk = Get-AzureDisk | Where-Object { $_.AttachedTo.RoleName -eq "kellyapp02" }
$mediaLink = $disk.MediaLink
$storageAccountName = $mediaLink.Host.Split('.')[0]