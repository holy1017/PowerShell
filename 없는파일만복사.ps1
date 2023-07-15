# .\"없는파일만복사.ps1"

Param (
	[Parameter(HelpMessage="in folder")]
	[string]$in="D:/checkpoints",
	[Parameter(HelpMessage="out folder")]
	[string]$out="F:/checkpoints"
)

$args
$in
$out
if( -not( Test-Path -LiteralPath "$in" ) ){
	"$in not Path"
	Exit
}
if( -not( Test-Path -LiteralPath "$out" ) ){
	"$out not Path"
	Exit
}
#Get-Item -LiteralPath $in | Select-Object -Property *
#$fin=Get-Item -LiteralPath $in | Select Fullname  | out-string
$fin=Get-Item -LiteralPath $in | % { $_.ToString() }
$fin
$fout=Get-Item -LiteralPath $out | % { $_.ToString() }
$fout

Get-ChildItem -Recurse -LiteralPath $fin |
	ForEach-Object { '--- BEGIN ---' } { 
		$_.FullName
		$cp=$_.FullName.replace($fin,$fout)
		$cp
		if( -not( Test-Path -LiteralPath $cp ) ){
			'--- NO ---'
			Copy-Item $_.FullName -Destination $cp
		}else{
			'--- YES ---'
		}
	} { '--- END ---' }
#Read-Host "End"
