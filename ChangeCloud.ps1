#Open Azure Powershell
#Import your Azure Subscription
Add-AzureAccount

#Get the list of Azure Subscriptions
Get-AzureSubscription

#Select the azure Subscription of the Virtual Machines
Select-AzureSubscription "[SubscriptionName]"

#Get the list of Virtual machines on the subscription
Get-AzureVM 

#Now you need to select the subscription and the storage account where the disks of th VM are saved
set-AzureSubscription -SubscriptionName "[SubscriptionName]" -CurrentStorageAccountName “[StorageAccountName]” 

#If you need to know where disks are stored:
#Get the information of a specific Virtual machine
$sourceVm =Get-AzureVM -ServiceName “[CloudServiceName]” -Name “[VMName]” 

#Get disk location
$sourceVm.VM.OSVirtualHardDisk.Medialink.Host
$sourceVm.VM. DataVirtualHardDisks.Medialink.Host

#This export the configuration of a VM in an XML file
Export-AzureVM -ServiceName "[CloudServiceName]" -Name "[VMName]" -Path "C:\Users\Gab\Desktop\[VMName].xml" 

#You can also edit the xml file if you need to change something
#Since you are importing this VM in another CS tipically you need to tweak the RDS and Powershell port
#to not collide with existing VMs in the same CS

#This will remove the VM definition from Azure but not the disks
Remove-AzureVM -ServiceName “[CloudServiceName]” -Name “[VMName]” 

#Finally you can import back the VM and set a different Cloud Service
Import-AzureVM -Path "C:\Users\Gab\Desktop\[VMName].xml" | New-AzureVM -ServiceName "[NEWCloudServiceName]"