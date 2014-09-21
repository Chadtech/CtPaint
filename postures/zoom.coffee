zoomPosture = [
  () ->
    toolbar1Context.drawImage(toolbar1sImage1,188,3)   
    drawInformationToolbar0()
    drawInformationToolbar1()
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
      scaleCanvasBigger( 2 ** toolHistory[toolHistory.length - 1].magnitude )
    positionCorners()
    drawToolbars()
  () ->
    mousePressed = false
]