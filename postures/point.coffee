pointPosture = [
  () ->
    drawInformation()
    if mousePressed
      oldX = xSpot
      oldY = ySpot
      getMousePositionOnCanvas(event)
      pointAction(ctContext, colorSwatches[0], xSpot, ySpot, oldX, oldY)
    else
      updateCursor()
  () ->
    if not mousePressed
      getMousePositionOnCanvas(event)
      pointAction(ctContext, colorSwatches[0], xSpot, ySpot, xSpot, ySpot)
    mousePressed = true
  () ->
    if mousePressed
      updateOldCursor()
      historyUpdate()
    mousePressed = false
  () ->
    if mousePressed
      oldX = xSpot
      oldY = ySpot
      getMousePositionOnCanvas(event)
      pointAction(ctContext, colorSwatches[0], xSpot, ySpot, oldX, oldY)
      historyUpdate()
      mousePressed = false
]

