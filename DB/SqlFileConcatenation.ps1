$location = Get-Location

$outfile = -join($location,"\ConcatenatedScript.sql")

$database = $location

Get-Content -Path $database\*.sql | Out-File -FilePath $outfile -encoding ASCII

Add-Content $outfile "`n"


$users = -join($location,"\Setup")

Get-Content -Path $users\*.sql | Out-File -FilePath $outfile -Append -encoding ASCII

Add-Content $outfile "`n"


$patches = -join($location,"\Patches")

Get-Content -Path $patches\*.sql | Out-File -FilePath $outfile -Append -encoding ASCII

Add-Content $outfile "`n"


$data = -join($location,"\Data")

Get-Content -Path $data\*.sql | Out-File -FilePath $outfile -Append -encoding ASCII

Add-Content $outfile "`n"