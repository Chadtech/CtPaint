samplePosture = [
  # Mouse Move
  () ->
    updateCursor()
    drawInformation()

  # Mouse Down
  () ->
    mousePressed = true

  # Mouse Up
  () ->
    mousePressed = false
    getMousePositionOnCanvas(event)
    coverUpOldCursor()
    colorSwatches[0] = hexToRGB(getColorValue(ctContext, xSpot, ySpot).substr(1))
    refreshCursor()
    tH.pop()
    tH.push tH[tH.length - 1]
    drawToolbars()

  # Mouse Exit
  () ->
]

