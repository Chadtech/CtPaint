pointPosture = [
  (event) ->
    # Mouse Move
    coverUpOldCursor()
    drawInformation(event)
    setCasualPosition(event)
    if mousePressed
      oldX = xSpot
      oldY = ySpot
      getMousePositionOnCanvas(event)
      pointAction(ctContext, colorSwatches[0], xSpot, ySpot, oldX, oldY)
    updateCursor(event)

  # Mouse down
  (event) ->
    if not mousePressed
      getMousePositionOnCanvas(event)
      pointAction(ctContext, colorSwatches[0], xSpot, ySpot, xSpot, ySpot)
      updateOldCursor()
      refreshCursor()
    mousePressed = true

  # Mouse up
  (event) ->
    if mousePressed
      coverUpOldCursor()
      historyUpdate()
      refreshCursor()
    mousePressed = false

  # Mouse Exit
  (event) ->
    if mousePressed
      oldX = xSpot
      oldY = ySpot
      getMousePositionOnCanvas(event)
      pointAction(ctContext, colorSwatches[0], xSpot, ySpot, oldX, oldY)
      historyUpdate()
      mousePressed = false
]

