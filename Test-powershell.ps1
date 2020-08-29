#Time to Move

#With all of our pre-migration work complete, we shut down the SQL Server 2008R2 instance. Then we turned things over to the folks in the datacenter to detach the storage LUN, take the #snapshot, and attach the LUN to the new instance. When their work was complete, they passed the baton back to me to move the files around and attach the databases.
$CurrentFiles = Get-ChildItem -Path U:\Very\Long\Path\;
$CurrentFiles | Where-Object {$_.extension -eq ".mdf"} | ForEach-Object {Move-Item -Path $PSItem.Fullname -Destination U:\DataDir};
$CurrentFiles | Where-Object {$_.extension -eq ".ldf"} | ForEach-Object {Move-Item -Path $PSItem.Fullname -Destination U:\LogDir};
#This is the Test  for powershell commit