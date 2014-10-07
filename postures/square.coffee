squarePosture = [
  () ->
    if mousePressed
      getMousePositionOnCanvas(event)

      boxInformation = (Math.abs(xSpot - oldX) + 1).toString() 
      boxInformation += 'px x '
      boxInformation += (Math.abs(ySpot - oldY) + 1).toString()
      boxInformation += 'px'
      drawInformation( boxInformation )

      canvasDataAsImage = new Image()
      canvasDataAsImage.onload = ->
        ctContext.drawImage(canvasDataAsImage,0,0)
        squareAction(ctContext, colorSwatches[0], oldX, oldY, xSpot, ySpot)
      canvasDataAsImage.src = cH[cH.length - 1]
    else
      drawInformation()
      updateCursor()
  () ->
    mousePressed = true
    getMousePositionOnCanvas(event)
    oldX = xSpot
    oldY = ySpot
  () ->
    mousePressed = false
    updateOldCursor()
    historyUpdate()
  () ->
]

