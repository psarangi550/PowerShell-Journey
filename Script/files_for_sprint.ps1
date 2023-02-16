# choosing the Source File Location 

Add-Type -AssemblyName System.Windows.Forms
$FolderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog -Property @{
    RootFolder ="MyComputer"
    ShowNewFolderButton = $false
}
[void]$FolderBrowser.ShowDialog()
$src_path=$FolderBrowser.SelectedPath
Write-Output "You choose Source as $src_path"

# choosing the Destination Path Over here

Add-Type -AssemblyName System.Windows.Forms
$FolderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog -Property @{
    RootFolder ="MyComputer"
    ShowNewFolderButton = $false
}
[void]$FolderBrowser.ShowDialog()
$dest_path=$FolderBrowser.SelectedPath
Write-Output "You choose Destination as $dest_path"

# creating the JSON File Out of It 

$json=@() #initializing JSOn with empty String 
$item=""|Select-Object src_path,dest_path
$item.src_path=$src_path
$item.dest_path=$dest_path
$json+=$item
Write-Output $json | ConvertTo-Json | Out-File -FilePath "dynamic_path.json"
