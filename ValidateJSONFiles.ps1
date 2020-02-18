param(
	$jsonFolderPath
)
[bool] $invalidJson = $false;

if($jsonFolderPath -eq $null){
	$jsonFolderPath = $pwd;
}

Get-ChildItem ${jsonFolderPath} -r -Include *.json | % { 
	$text = Get-Content $_;  
	$json = $text | ConvertFrom-Json
	if(-not $json)
	{
		"123"
		$invalidJson = $true;
	}
	"$_ processed"
}
if($invalidJson){
	"JSON processed with the above errors."
	Exit 123
}

"All JSON files processed without errors."