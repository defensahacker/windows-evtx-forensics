$eid= 51
$file= "output_search_eid_$eid.txt"
echo "*** Searching for events id: $eid ***" | Add-Content $file
Get-ChildItem -R -Filter "*.evtx" -Name | Foreach-Object {
	echo ">>>>>>> $_ <<<<<<<" | Add-Content -Path $file
	python .\filter_eid_evtx.py "$_" $eid | Add-Content -Path $file
}
