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
      zoomFactor = 2 ** tH[tH.length - 1].magnitude
      ctCanvas.style.width = (zoomFactor * ctCanvas.width).toString()+'px'
      ctCanvas.style.height = (zoomFactor * ctCanvas.height).toString()+'px'
    drawToolbars()

  (event) ->
    mousePressed = false

  (event) ->
]

