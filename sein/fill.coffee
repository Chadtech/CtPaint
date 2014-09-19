$('#CtPaint').mousemove (event)->
  toolbar1Context.drawImage(toolbar1sImage1,188,3)   
  drawInformationToolbar0()
  drawInformationToolbar1()

$('#CtPaint').mousedown (event)->
  mousePressed = true
  getMousePositionOnCanvas(event)
  floodFill(ctCanvas, ctContext, colorSwatches[0], xSpot, ySpot)

$('#CtPaint').mouseup (event)->
  mousePressed = false
  canvasAsData = ctCanvas.toDataURL()