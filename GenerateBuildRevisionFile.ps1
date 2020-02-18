param ($buildNumber, $svnRevision, $outFilePath = ".\StaticContent")

$buildRev = "${svnRevision}${buildNumber}"
[io.file]::WriteAllText("${outFilePath}\buildnum.txt",$buildNumber)
[io.file]::WriteAllText("${outFilePath}\svnrevision.txt",$svnRevision)
[io.file]::WriteAllText("${outFilePath}\buildrevision.txt",$buildRev)
