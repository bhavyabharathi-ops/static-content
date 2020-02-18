dir -r gen -filter *.tsv | %{
  $filename = $_.fullname
  $map = @{}
  import-csv -encoding UTF8 -delimiter "`t" $filename | % {$map[$_.key] = $_.value}
  $sourceFile = Resolve-Path $filename.Substring("$pwd\gen\StaticContent\".Length).replace(".tsv","") 
  $source = gc  -Encoding UTF8 $sourcefile
  $source | %{
    if ($_ -cmatch '^\W*var (?<key>[A-Z_]*) = "(?<value>.*)";$' -and $map[$Matches["key"]] -ne $null){
	  $oldVal = $Matches["value"]
	  $newVal = $map[$Matches["key"]]
	  Write-Warning $oldVal
	  $_.Replace($oldVal, [string]$newVal)
	}  else {
	  $_
	}
  } | sc -Encoding UTF8 $sourcefile
}