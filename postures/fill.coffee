fillPosture = [
  (event) ->
    setCasualPosition(event)
    coverUpOldCursor()
    drawInformation(event)
    updateCursor(event)
  (event) ->
    mousePressed = true
    getMousePositionOnCanvas(event)
    coverUpOldCursor()
    floodFill(ctCanvas, ctContext, colorSwatches[0], xSpot, ySpot)
    updateOldCursor()
  (event) ->
    mousePressed = false
    historyUpdate()
  (event) ->
]

