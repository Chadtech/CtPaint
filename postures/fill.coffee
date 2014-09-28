fillPosture = [
  () ->
    toolbar1Context.drawImage(toolbar1sImage1,188,3)   
    drawInformationToolbar0()
    drawInformationToolbar1()
  () ->
    mousePressed = true
    getMousePositionOnCanvas(event)
    floodFill(ctCanvas, ctContext, colorSwatches[0], xSpot, ySpot)
  () ->
    mousePressed = false
    cH.push ctCanvas.toDataURL()
    cH.shift()
    cF = []
]

