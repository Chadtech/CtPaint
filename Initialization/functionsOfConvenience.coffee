zeroPadder = (number,zerosToFill) ->
  numberAsString = number+''
  while numberAsString.length < zerosToFill
    numberAsString = '0'+numberAsString
  return numberAsString

replaceAt = (string, replacement, stringsIndex) ->
  return string.substr(0,stringsIndex) + replacement + string.substr(stringsIndex + 1)

rgbToHex = (rgb) ->
  return '#' + zeroPadder(rgb[0].toString(16),2) + zeroPadder(rgb[1].toString(16),2) + zeroPadder(rgb[2].toString(16),2)

hexToRGB = (hex) ->
  return [parseInt(hex[0] + hex[1], 16), parseInt(hex[2] + hex[3], 16), parseInt(hex[4] + hex[5], 16)]
