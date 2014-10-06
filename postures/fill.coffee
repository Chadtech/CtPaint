fillPosture = [
  () ->
    drawInformation()
  () ->
    mousePressed = true
    getMousePositionOnCanvas(event)
    floodFill(ctCanvas, ctContext, colorSwatches[0], xSpot, ySpot)
  () ->
    mousePressed = false
    cH.push ctCanvas.toDataURL()
    cH.shift()
    cF = []
  () ->
]

