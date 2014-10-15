zoomPosture = [
  (event) ->
    drawInformation(event)
    updateCursor(event)
  (event) ->
    mousePressed = true
    getMousePositionOnCanvas(event)
    if zoomActivate
      zoomActivate = false
      ctCanvas.style.width = (canvasWidth).toString()+'px'
      ctCanvas.style.height = (canvasHeight).toString()+'px'
    else
      zoomActivate = true
      scaleCanvasBigger( 2 ** tH[tH.length - 1].magnitude )
    drawToolbars()
  (event) ->
    mousePressed = false
  (event) ->
]

