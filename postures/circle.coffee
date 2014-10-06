circlePosture = [
  () ->
    if mousePressed
      calculatedRadius = Math.pow(Math.pow(xSpot - oldX, 2) + Math.pow(ySpot - oldY, 2), 0.5)
      calculatedRadius = Math.round(calculatedRadius)
      circleInformation = ', r=' + (calculatedRadius + 2).toString()
      drawInformation( circleInformation )
      getMousePositionOnCanvas(event)
      canvasDataAsImage = new Image()
      canvasDataAsImage.onload = ->
        ctContext.drawImage(canvasDataAsImage,0,0)
        circleAction(ctContext, colorSwatches[0], calculatedRadius)
      canvasDataAsImage.src = cH[cH.length - 1]
    else
      drawInformation()
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