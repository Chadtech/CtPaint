zoomPosture = ->
  $('#CtPaint').mousemove (event)->
    toolbar1Context.drawImage(toolbar1sImage1,188,3)   
    drawInformationToolbar0()
    drawInformationToolbar1()

  $('#CtPaint').mousedown (event)->
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
      scaleCanvasBigger( 2 ** selectedTool.magnitude )
    selectedTool = previouslySelectedTool
    positionCorners()
    drawToolbars()

  $('#CtPaint').mouseup (event)->
    mousePressed = false
   
