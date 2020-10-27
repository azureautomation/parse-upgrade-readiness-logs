<#
.SYNOPSIS

Parses the log files generated from the UA deployment script and generates a report with the errors only.


.DESCRIPTION

The script takes the log's folder path as a parameter and reads each log file searching for an error then exports to csv the file name ,
error description and computer name


.PARAMETER logsfolder 

The path to the logs folder.


.PARAMETER outputfile

The path to the output csv file.


.EXAMPLE

.\walogs.ps1 -logsfolder c:\logfolder -outputfile c:\logfolder\output.csv


#>

Param(
  [parameter(Mandatory=$true)][string]$logsfolder,
  [parameter(Mandatory=$true)][string]$outputfile
)
  if (Test-Path $outputfile) {
    Remove-Item $outputfile -Force
    } 
Get-ChildItem $logsfolder -Recurse -Filter *.txt  | ForEach-Object{

  $obj = new-object psobject
  $date = (Get-Content $_.FullName | Select-String -SimpleMatch "UTC DateTime:").ToString()
  Add-Member -InputObject  $obj -MemberType NoteProperty -Name Date -Value $date.Substring('42')
  Add-Member -InputObject $obj -MemberType NoteProperty -Name File -Value $_.BaseName
  $name = (Get-Content $_.FullName | Select-String -SimpleMatch "machine name:").ToString()
  Add-Member -InputObject  $obj -MemberType NoteProperty -Name computerName -Value $name.Substring('42')
   (Get-Content $_.FullName | Select-String -pattern "errorcode" ) | ForEach-Object{
       Add-Member -InputObject $obj -MemberType NoteProperty -Name Error -Value $_.Line.Substring('45').ToString()
       $obj | Export-Csv $outputfile -NoTypeInformation -Append
    }

    
}