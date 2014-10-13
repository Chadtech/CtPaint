pointPosture = [
  () ->
    # Mouse Move
    drawInformation()
    if mousePressed
      oldX = xSpot
      oldY = ySpot
      getMousePositionOnCanvas(event)
      pointAction(ctContext, colorSwatches[0], xSpot, ySpot, oldX, oldY)
    else
      updateCursor()

  # Mouse down
  () ->
    if not mousePressed
      getMousePositionOnCanvas(event)
      pointAction(ctContext, colorSwatches[0], xSpot, ySpot, xSpot, ySpot)
    mousePressed = true

  # Mouse up
  () ->
    if mousePressed
      updateOldCursor()
      historyUpdate()
    mousePressed = false

  # Mouse Exit
  () ->
    if mousePressed
      oldX = xSpot
      oldY = ySpot
      getMousePositionOnCanvas(event)
      pointAction(ctContext, colorSwatches[0], xSpot, ySpot, oldX, oldY)
      historyUpdate()
      mousePressed = false
]

