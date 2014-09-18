sampleAction = ->
  console.log '2'

getColorValue = (canvas, whereAtX, whereAtY) ->
  return rgbToHex(canvas.getImageData(whereAtX, whereAtY, 1, 1).data)
