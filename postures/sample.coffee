samplePosture = [
  # Mouse Move
  (event) ->
    drawInformation(event)
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
    tH.push tH[tH.length - 1]
    drawToolbars()

  # Mouse Exit
  (event) ->
]

