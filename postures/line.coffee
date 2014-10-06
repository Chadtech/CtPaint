linePosture = [
  () ->
    drawInformation()
    if mousePressed
      getMousePositionOnCanvas(event)
      canvasDataAsImage = new Image()
      canvasDataAsImage.onload = ->
        ctContext.drawImage(canvasDataAsImage,0,0)
        lineAction(ctContext, colorSwatches[0], oldX, oldY, xSpot, ySpot)
      canvasDataAsImage.src = cH[cH.length - 1]
  () ->
    mousePressed = true
    getMousePositionOnCanvas(event)
    oldX = xSpot
    oldY = ySpot
  () ->
    mousePressed = false
    cH.push ctCanvas.toDataURL()
    cH.shift()
    cF = []
  () ->
]
