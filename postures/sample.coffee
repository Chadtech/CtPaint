samplePosture = [
  # Mouse Move
  (event) ->
    coverUpOldCursor()
    drawInformation(event)
    setCasualPosition(event)
    updateCursor(event)

  # Mouse Down
  (event) ->
    mousePressed = true

  # Mouse Up
  (event) ->
    mousePressed = false
    getMousePositionOnCanvas(event)
    coverUpOldCursor()
    colorSwatches[0] = hexToRGB(getColorValue(ctContext, xSpot, ySpot).substr(1))
    refreshCursor()
    tH.pop()
    tH.push ctPaintTools[toolsToNumbers['point']]
    drawToolbars()

  # Mouse Exit
  (event) ->
]

