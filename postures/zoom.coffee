zoomPosture = [
  () ->
    drawInformation()
    updateCursor()
  () ->
    mousePressed = true
    getMousePositionOnCanvas(event)
    if zoomActivate
      zoomActivate = false
      cornersVisible = true
      ctCanvas.style.width = (canvasWidth).toString()+'px'
      ctCanvas.style.height = (canvasHeight).toString()+'px'
    else
      zoomActivate = true
      cornersVisible = false
      scaleCanvasBigger( 2 ** tH[tH.length - 1].magnitude )
    positionCorners()
    drawToolbars()
  () ->
    mousePressed = false
  () ->
]

