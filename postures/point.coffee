pointPosture = [
  () ->
    # Mouse Move
    drawInformation()
    if mousePressed
      oldX = xSpot
      oldY = ySpot
      getMousePositionOnCanvas(event)
      pointAction(ctContext, colorSwatches[0], xSpot, ySpot, oldX, oldY)
    updateCursor()

  # Mouse down
  () ->
    if not mousePressed
      getMousePositionOnCanvas(event)
      pointAction(ctContext, colorSwatches[0], xSpot, ySpot, xSpot, ySpot)
      updateOldCursor()
      refreshCursor()
    mousePressed = true

  # Mouse up
  () ->
    if mousePressed
      coverUpOldCursor()
      historyUpdate()
      refreshCursor()
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

