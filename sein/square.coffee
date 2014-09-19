$('#CtPaint').mousemove (event)->
  toolbar1Context.drawImage(toolbar1sImage1,188,3)   
  drawInformationToolbar0()
  drawInformationToolbar1()
  if mousePressed
    getMousePositionOnCanvas(event)
    canvasDataAsImage = new Image()
    canvasDataAsImage.onload = ->
      ctContext.drawImage(canvasDataAsImage,0,0)
      selectedTool.toolsAction(ctContext, colorSwatches[0], oldX, oldY, xSpot, ySpot)
    canvasDataAsImage.src = canvasAsData
 
$('#CtPaint').mousedown (event)->
  mousePressed = true
  getMousePositionOnCanvas(event)
  oldX = xSpot
  oldY = ySpot

$('#CtPaint').mouseup (event)->
  mousePressed = false
  canvasAsData = ctCanvas.toDataURL()