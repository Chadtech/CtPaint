$('#CtPaint').mousemove (event)->
  toolbar1Context.drawImage(toolbar1sImage1,188,3)   
  drawInformationToolbar0()
  drawInformationToolbar1()
  if mousePressed
    oldX = xSpot
    oldY = ySpot
    getMousePositionOnCanvas(event)
    selectedTool.toolsAction(ctContext, colorSwatches[0], xSpot, ySpot, oldX, oldY)

$('#CtPaint').mousedown (event)->
  mousePressed = true
  getMousePositionOnCanvas(event)
  selectedTool.toolsAction(ctContext, colorSwatches[0], xSpot, ySpot, xSpot, ySpot)

$('#CtPaint').mouseup (event)->
  mousePressed = false
  canvasAsData = ctCanvas.toDataURL()