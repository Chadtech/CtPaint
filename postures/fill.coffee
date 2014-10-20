fillPosture = [
  # Mouse move
  (event) ->
    setCasualPosition(event)
    coverUpOldCursor()
    drawInformation(event)
    updateCursor(event)

  # Mouse down
  (event) ->
    mousePressed = true
    getMousePositionOnCanvas(event)
    coverUpOldCursor()
    floodFill(ctCanvas, ctContext, colorSwatches[0], xSpot, ySpot)
    updateOldCursor()

  # Mouse Up
  (event) ->
    mousePressed = false
    historyUpdate()

  # Mouse exit
  (event) ->
]

