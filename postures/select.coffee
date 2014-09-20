selectPosture = [
  () ->
    if not areaSelected
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
    else
      console.log 'Mouse Move, area selected'
  () ->
    mousePressed = true
    if not areaSelected
      getMousePositionOnCanvas(event)
      oldX = xSpot
      oldY = ySpot
    else
      console.log 'Mouse Down, area selected'
  () ->
    mousePressed = false
    if not areaSelected
      sortedXs = [xSpot, oldX].sort()
      sortedYs = [ySpot, oldY].sort()
      selectionsWidth = Math.abs(xSpot - oldX)
      selectionsHeight = Math.abs(ySpot - oldY)
      selection = 
        ctContext.getImageData( sortedXs[0], sortedYs[0], selectionsWidth, selectionsHeight)
      selection = selection.data
      canvasDataAsImage = new Image()
      canvasDataAsImage.onload = ->
        ctContext.drawImage(canvasDataAsImage,0,0)
        squareAction(ctContext, colorSwatches[1], oldX, oldY, xSpot, ySpot, true)
        canvasAsData = ctCanvas.toDataURL()
      canvasDataAsImage.src = canvasAsData
    else
      console.log 'Mouse Up, area selected'
]