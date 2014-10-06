pointPosture = [
  () ->
    drawInformation()
    if mousePressed
      oldX = xSpot
      oldY = ySpot
      getMousePositionOnCanvas(event)
      pointAction(ctContext, colorSwatches[0], xSpot, ySpot, oldX, oldY)
  () ->
    if not mousePressed
      getMousePositionOnCanvas(event)
      pointAction(ctContext, colorSwatches[0], xSpot, ySpot, xSpot, ySpot)
    mousePressed = true
  () ->
    if mousePressed
      cH.push ctCanvas.toDataURL()
      cH.shift()
      cF = []
    mousePressed = false
  () ->
    if mousePressed
      oldX = xSpot
      oldY = ySpot
      getMousePositionOnCanvas(event)
      pointAction(ctContext, colorSwatches[0], xSpot, ySpot, oldX, oldY)
      cH.push ctCanvas.toDataURL()
      cH.shift()
      cF = []
      mousePressed = false
]