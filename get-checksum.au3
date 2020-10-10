; Use to get new checksum value
Local $newRegion = [1779, 1054, 1799, 1059]
ConsoleWrite(PixelChecksum($newRegion[0], $newRegion[1], $newRegion[2], $newRegion[3]) & @CRLF)
Exit