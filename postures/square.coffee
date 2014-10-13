squarePosture = [
  # Mouse Move
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
        putPixel( ctContext, colorOfCursorPixel, xSpot, ySpot )
      canvasDataAsImage.src = cH[cH.length - 1]
    else
      drawInformation()
      updateCursor()

  # Mouse Down
  () ->
    if not mousePressed
      mousePressed = true
      getMousePositionOnCanvas(event)
      oldX = xSpot
      oldY = ySpot

  # Mouse Up
  () ->
    if mousePressed
      mousePressed = false
      squareAction(ctContext, colorSwatches[0], oldX, oldY, xSpot, ySpot)
      updateOldCursor()
      historyUpdate()

  # Mouse Exit
  () ->
]

