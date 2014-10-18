linePosture = [
  (event) ->
    # Mouse move
    if mousePressed
      getMousePositionOnCanvas(event)
      widthToShow = (Math.abs(oldX - xSpot) + 1).toString()
      heightToShow = (Math.abs(oldY - ySpot) + 1).toString()
      lineInformation = widthToShow + 'px x ' + heightToShow + 'px'
      drawInformation( event, lineInformation )
      canvasDataAsImage = new Image()
      canvasDataAsImage.onload = ->
        ctContext.drawImage(canvasDataAsImage,0,0)
        lineAction(ctContext, colorSwatches[0], oldX, oldY, xSpot, ySpot)
        putPixel( ctContext, colorOfCursorPixel, xSpot, ySpot )
      canvasDataAsImage.src = cH[cH.length - 1]
    else
      drawInformation(event)
    setCasualPosition(event)
    updateCursor(event)

  # Mouse down
  (event) ->
    mousePressed = true
    getMousePositionOnCanvas(event)
    oldX = xSpot
    oldY = ySpot

  # Mouse up
  (event) ->
    mousePressed = false
    lineAction(ctContext, colorSwatches[0], oldX, oldY, xSpot, ySpot)
    updateOldCursor()
    historyUpdate()

  # Mouse Exit
  (event) ->
]

