circlePosture = [
  # Mouse Move
  () ->
    if mousePressed
      getMousePositionOnCanvas(event)
      calculatedRadius = Math.pow(Math.pow(xSpot - oldX, 2) + Math.pow(ySpot - oldY, 2), 0.5)
      calculatedRadius = Math.round(calculatedRadius)
      circleInformation = 'radius = ' + (calculatedRadius + 2).toString()
      drawInformation( circleInformation )
      canvasDataAsImage = new Image()
      canvasDataAsImage.onload = ->
        ctContext.drawImage(canvasDataAsImage, 0, 0)
        circleAction(ctContext, colorSwatches[0], calculatedRadius)
        putPixel( ctContext, colorOfCursorPixel, xSpot, ySpot )
      canvasDataAsImage.src = cH[cH.length - 1]
    else
      drawInformation()
      updateCursor()

  # Mouse Down
  () ->
    mousePressed = true
    getMousePositionOnCanvas(event)
    oldX = xSpot
    oldY = ySpot

  # Mouse Up
  () ->
    if mousePressed
      calculatedRadius = Math.pow(Math.pow(xSpot - oldX, 2) + Math.pow(ySpot - oldY, 2), 0.5)
      calculatedRadius = Math.round(calculatedRadius)
      circleInformation = 'radius = ' + (calculatedRadius + 2).toString()
      circleAction(ctContext, colorSwatches[0], calculatedRadius)

      updateOldCursor()
      mousePressed = false
      historyUpdate()

  # Mouse Exit
  () ->
]

