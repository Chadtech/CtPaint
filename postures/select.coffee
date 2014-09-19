selectPosture = ->
  $('#CtPaint').mousemove (event)->
    toolbar1Context.drawImage(toolbar1sImage1,188,3)   
    drawInformationToolbar0()
    drawInformationToolbar1()
    if mousePressed
      getMousePositionOnCanvas(event)
      canvasDataAsImage = new Image()
      canvasDataAsImage.onload = ->
        ctContext.drawImage(canvasDataAsImage,0,0)
        drawSelectBox(ctContext, oldX, oldY, xSpot, ySpot)
        canvasDataAsImage.src = canvasAsData
        
  $('#CtPaint').mousedown (event)->
    mousePressed = true
    getMousePositionOnCanvas(event)
    oldX = xSpot
    oldY = ySpot

  $('#CtPaint').mouseup (event)->
    mousePressed = false
    getMousePositionOnCanvas(event)
    areaSelected = true
    areasXSpot = oldX
    areasYSpot = oldY
    areaSelectedsHeight = Math.abs(oldY - ySpot)
    areaSelectedsWidth = Math.abs(oldX - xSpot)
    selection = ctContext.getImageData(oldX + 1, oldY + 1, Math.abs((oldX + 1) - xSpot), Math.abs((oldY + 1) - ySpot))
    selectionToPaste = document.createElement('canvas').getContext('2d').createImageData(selection.width, selection.height)
    datumIndex = 0
    while datumIndex < selection.data.length
      selectionToPaste.data[datumIndex] = selection.data[datumIndex]
      datumIndex++
    #squareAction = (canvas, color, beginX, beginY, endX, endY)
    canvasDataAsImage = new Image()
    canvasDataAsImage.onload = ->
      ctContext.drawImage(canvasDataAsImage,0,0)
      squareAction(ctContext, colorSwatches[1], oldX + 1, oldY + 1, xSpot - 1, ySpot - 1, true)
      canvasAsData = ctCanvas.toDataURL()
      ctContext.putImageData(selectionToPaste, oldX + 1, oldY + 1)
      selectedTool.toolsAction(ctContext, oldX, oldY, xSpot, ySpot)
    canvasDataAsImage.src = canvasAsData