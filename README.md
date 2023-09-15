# MifMaker

## Intro

Altera `.mif` files are used to initialize ROM megafunctions with data. While there is
documentation available on this format itself and many examples online, the Terasic DE
series of FPGA kits ship with a default definition that includes a picture stored as not
one but *two* `.mif` files, one that acts as a color index mapping higher bit depths
from the image to an 8-bit number, and another that represents each pixel in terms of
the closest mapping index.

Terasic ships these boards with a program `PrintNum.exe` that converts a BMP file to
this format, but for some unknowable reason it creates them with the wrong extension,
no metadata/header (required for the `.mif` spec), hardcodes the input image name as
`test.bmp`, and hardcodes the output file names to `test.txt` and `test2.txt`.

MifMaker is a PowerShell wrapper for `PrintNum.exe` that makes it actually useful. It is
currently hardcoded to only properly work with a 256-color BMP input. We'll see if I end
up making it better soon.

## Usage

```ps1
.\MifMaker.ps1 <input file> [<path to PrintNum>]
```

## License

PrintNum.exe is the exclusive copyright of Terasic, Inc., all rights reserved

MifMaker.ps1 is licensed under the MIT License:

Copyright 2023 Thomas Makin

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
