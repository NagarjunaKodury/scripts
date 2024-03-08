$resourceGroupName = "AHELGROUP_NETWORK"
$olderSnapshots = Get-AzSnapshot | Where-Object { $_.TimeCreated -lt (Get-Date).AddDays(-30) }

foreach ($snapshot in $olderSnapshots) {
    Remove-AzSnapshot -ResourceGroupName $resourceGroupName -SnapshotName $snapshot.Name -Force
}
