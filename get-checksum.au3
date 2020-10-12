; Use to get new checksum value
Sleep(2000)
Local $newRegion = [75, 34, 92, 66]
ConsoleWrite(PixelChecksum($newRegion[0], $newRegion[1], $newRegion[2], $newRegion[3]) & @CRLF)
Exit