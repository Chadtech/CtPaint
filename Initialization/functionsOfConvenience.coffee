###
  Given a number, zero padder returns a string of that number
  padded with zeros in front of it.
###
zeroPadder = (number,numberOfZerosToFill) ->
  numberAsString = number+''
  while numberAsString.length < numberOfZerosToFill
    numberAsString = '0'+numberAsString
  return numberAsString
  
###
  replaceAt replaces the element at stringsIndex in a string
  with one given as an argument (replacement)
###
replaceAt = (string, replacement, stringsIndex) ->
  return string.substr(0,stringsIndex) + replacement + string.substr(stringsIndex + 1)

###
  rgbToHex and hexToRGB convert between the two standards
  of color expression.
###
rgbToHex = (rgb, hashtag) ->
  if hashtag == undefined or hashtag
    return '#' + 
      zeroPadder(rgb[0].toString(16),2) + 
      zeroPadder(rgb[1].toString(16),2) + 
      zeroPadder(rgb[2].toString(16),2)
  else
    return zeroPadder(rgb[0].toString(16),2) + 
      zeroPadder(rgb[1].toString(16),2) + 
      zeroPadder(rgb[2].toString(16),2)

hexToRGB = (hex) ->
  red = parseInt(hex[0] + hex[1], 16)
  green = parseInt(hex[2] + hex[3], 16)
  blue = parseInt(hex[4] + hex[5], 16)
  return [red, green, blue]

###
  sameColorCheck returns a boolean given two colors.
  It returns true if the two colors share the same
  values for red, green, and blue (alpha is ignored).
###
sameColorCheck = (colorA, colorB) ->
    redAreSame = colorA[0] == colorB[0]
    greenAreSame = colorA[1] == colorB[1]
    blueAreSame = colorA[2] == colorB[2]
    return  redAreSame and greenAreSame and blueAreSame

###
  There are two functions that can be used to draw something onto a canvas,
  putImageData, and drawImage. putImageData replaces data, and drawImage
  Merges data, accounting for transparency.

  I use this function to convert image data, which naturally has no
  function toDataURL(), into a data URL. The data URL is then used
  as a source for a new image object, which can be the subject of 
  the drawImage function.
###
imageDataToURL = ( imageAsImageData ) ->
  temporaryCanvas = document.createElement('canvas')
  temporaryCanvas.width = imageAsImageData.width
  temporaryCanvas.height = imageAsImageData.height

  temporaryContext = temporaryCanvas.getContext('2d')
  temporaryContext.putImageData(imageAsImageData, 0, 0)

  return temporaryCanvas.toDataURL()

    