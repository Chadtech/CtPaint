pointPosture = [
  () ->
    toolbar1Context.drawImage(toolbar1sImage1,188,3)   
    drawInformationToolbar0()
    drawInformationToolbar1()
    if mousePressed
      oldX = xSpot
      oldY = ySpot
      getMousePositionOnCanvas(event)
      pointAction(ctContext, colorSwatches[0], xSpot, ySpot, oldX, oldY)
  () ->
    mousePressed = true
    getMousePositionOnCanvas(event)
    pointAction(ctContext, colorSwatches[0], xSpot, ySpot, xSpot, ySpot)
  () ->
    mousePressed = false
    canvasAsData = ctCanvas.toDataURL()
]