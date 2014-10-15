getColorValue = (canvasObject, whereAtX, whereAtY) ->
  return rgbToHex(canvasObject.getImageData(whereAtX, whereAtY, 1, 1).data)

