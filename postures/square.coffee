squarePosture = [
  # Mouse Move
  (event) ->
    if mousePressed
      getMousePositionOnCanvas(event)

      boxInformation = (Math.abs(xSpot - oldX) + 1).toString() 
      boxInformation += 'px x '
      boxInformation += (Math.abs(ySpot - oldY) + 1).toString()
      boxInformation += 'px'
      coverUpOldCursor()
      drawInformation( event, boxInformation )

      canvasDataAsImage = new Image()
      canvasDataAsImage.onload = ->
        ctContext.drawImage(canvasDataAsImage,0,0)
        squareAction(ctContext, colorSwatches[0], oldX, oldY, xSpot, ySpot)
        putPixel( ctContext, colorOfCursorPixel, xSpot, ySpot )
      canvasDataAsImage.src = cH[cH.length - 1]
    coverUpOldCursor()
    drawInformation(event)
    setCasualPosition(event)
    updateCursor(event)

  # Mouse Down
  (event) ->
    if not mousePressed
      mousePressed = true
      getMousePositionOnCanvas(event)
      oldX = xSpot
      oldY = ySpot

  # Mouse Up
  (event) ->
    if mousePressed
      mousePressed = false
      squareAction(ctContext, colorSwatches[0], oldX, oldY, xSpot, ySpot)
      updateOldCursor()
      historyUpdate()

  # Mouse Exit
  (event) ->
]

