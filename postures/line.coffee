linePosture = [
  () ->
    if mousePressed
      getMousePositionOnCanvas(event)
      widthToShow = (Math.abs(oldX - xSpot) + 1).toString()
      heightToShow = (Math.abs(oldY - ySpot) + 1).toString()
      lineInformation = widthToShow + 'px x ' + heightToShow + 'px'
      drawInformation( lineInformation )
      canvasDataAsImage = new Image()
      canvasDataAsImage.onload = ->
        ctContext.drawImage(canvasDataAsImage,0,0)
        lineAction(ctContext, colorSwatches[0], oldX, oldY, xSpot, ySpot)
      canvasDataAsImage.src = cH[cH.length - 1]
    else
      updateCursor()
      drawInformation()
  () ->
    mousePressed = true
    getMousePositionOnCanvas(event)
    oldX = xSpot
    oldY = ySpot
  () ->
    mousePressed = false
    updateOldCursor()
    historyUpdate()
  () ->
]

