# MifMaker
# This is a wrapper for PrintNum.exe (a program by Terasic converting bmp to mif +
# index mif). The index mif includes the indices of colors in the second (color table)
# array.
#
# PrintNum.exe Copyright (C) Terasic, Inc., all rights reserved
# MifMaker Copyright (C) Thomas Makin 2023 under the MIT License
#

Param(
    [string]$inputFile,
    [string]$exeLocation
)

$imgDataLogo = "$inputFile/../img_data_logo.mif"
$indexLogo = "$inputFile/../index_logo.mif"

if (-Not $PSBoundParameters.ContainsKey('inputFile')) {
    Write-Output "You missed the input file!"
}

if (-Not $PSBoundParameters.ContainsKey('exeLocation')) {
    $exeLocation="./PrintNum.exe"
}

Copy-Item -Force $inputFile $exeLocation/../test.bmp

Invoke-Expression $exeLocation

New-Item -ItemType File -Force -Path $indexLogo | Out-Null
"WIDTH = 24;"                        | Out-File -FilePath $indexLogo -Append
"DEPTH = 256;"                       | Out-File -FilePath $indexLogo -Append
"ADDRESS_RADIX = HEX;"               | Out-File -FilePath $indexLogo -Append
"DATA_RADIX = HEX;"                  | Out-File -FilePath $indexLogo -Append
"CONTENT BEGIN"                      | Out-File -FilePath $indexLogo -Append
Get-Content $exeLocation\..\test.txt | Out-File -FilePath $indexLogo -Append
"END;"                               | Out-File -FilePath $indexLogo -Append

New-Item -ItemType File -Force -Path $imgDataLogo | Out-Null
"WIDTH = 8;"                          | Out-File -FilePath $imgDataLogo -Append
"DEPTH = 307200;"                     | Out-File -FilePath $imgDataLogo -Append
"ADDRESS_RADIX = HEX;"                | Out-File -FilePath $imgDataLogo -Append
"DATA_RADIX = HEX;"                   | Out-File -FilePath $imgDataLogo -Append
"CONTENT BEGIN"                       | Out-File -FilePath $imgDataLogo -Append
Get-Content $exeLocation\..\test2.txt | Out-File -FilePath $imgDataLogo -Append
"END;"                                | Out-File -FilePath $imgDataLogo -Append

Remove-Item -Force $exeLocation\..\test*txt
