circlePosture = [
  () ->
    toolbar1Context.drawImage(toolbar1sImage1,188,3)   
    drawInformationToolbar0()
    drawInformationToolbar1()
    if mousePressed
      getMousePositionOnCanvas(event)
      canvasDataAsImage = new Image()
      canvasDataAsImage.onload = ->
        ctContext.drawImage(canvasDataAsImage,0,0)
        circleAction(ctContext, colorSwatches[0], xSpot, ySpot)
      canvasDataAsImage.src = canvasAsData
  () ->
    mousePressed = true
    getMousePositionOnCanvas(event)
    oldX = xSpot
    oldY = ySpot
  () ->
    mousePressed = false
    canvasAsData = ctCanvas.toDataURL()
]