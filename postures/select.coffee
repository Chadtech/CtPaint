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
          borderSideX = 1
          borderSideY = 1
          if xSpot < oldX
            borderSizeX = -1
          if ySpot < oldY
            borderSizeY = -1
          originX = oldX - borderSideX
          originY = oldY - borderSideY
          otherSideX = xSpot + borderSideX
          otherSideY = ySpot + borderSideY
          drawSelectBox(ctContext, originX, originY, otherSideX, otherSideY)
        canvasDataAsImage.src = canvasAsData
    else
      if mousePressed
        getMousePositionOnCanvas(event)
        xOffset = xSpot - oldX
        yOffset = ySpot - oldY
        gripX = selectionX + xOffset
        gripY = selectionY + yOffset
        rightEdge = gripX + selectionsWidth
        bottomEdge = gripY + selectionsHeight
        canvasDataAsImage = new Image()
        canvasDataAsImage.onload = ->
          ctContext.drawImage(canvasDataAsImage,0,0)
          canvasAsData = ctCanvas.toDataURL()
          ctContext.putImageData(selection, gripX, gripY)
          drawSelectBox(ctContext, gripX - 1, gripY - 1, rightEdge, bottomEdge)
        canvasDataAsImage.src = canvasAsData
  () ->
    mousePressed = true
    if not areaSelected
      getMousePositionOnCanvas(event)
      oldX = xSpot
      oldY = ySpot
    else
      getMousePositionOnCanvas(event)
      oldX = xSpot
      oldY = ySpot
      withinXBoundaries = selectionX < xSpot and xSpot < (selectionX + selectionsWidth)
      withinYBoundaries = selectionY < ySpot and ySpot < (selectionY + selectionsHeight)
      if not (withinXBoundaries and withinYBoundaries)
        areaSelected = false
        canvasDataAsImage = new Image()
        canvasDataAsImage.onload = ->
          ctContext.drawImage(canvasDataAsImage,0,0)
          ctContext.putImageData(selection, selectionX, selectionY)
          canvasAsData = ctCanvas.toDataURL()
        canvasDataAsImage.src = canvasAsData
  () ->
    mousePressed = false
    if not areaSelected
      sortedXs = [ Math.min(xSpot, oldX), Math.max(xSpot, oldX) ]
      sortedYs = [ Math.min(ySpot, oldY), Math.max(ySpot, oldY) ]
      selectionsWidth = Math.abs(xSpot - oldX)
      selectionsHeight = Math.abs(ySpot - oldY)
      selectionX = sortedXs[0]
      selectionY = sortedYs[0]
      if 0 < selectionsWidth and 0 < selectionsHeight
        selection = 
          ctContext.getImageData( sortedXs[0], sortedYs[0], selectionsWidth, selectionsHeight)
        canvasDataAsImage = new Image()
        canvasDataAsImage.onload = ->
          ctContext.drawImage(canvasDataAsImage,0,0)
          squareAction(ctContext, colorSwatches[1], oldX, oldY, xSpot - 1, ySpot - 1, true)
          canvasAsData = ctCanvas.toDataURL()
          ctContext.putImageData(selection, selectionX, selectionY)
          borderSideX = 1
          borderSideY = 1
          if xSpot < oldX
            borderSizeX = -1
          if ySpot < oldY
            borderSizeY = -1
          originX = oldX - borderSideX
          originY = oldY - borderSideY
          otherSideX = xSpot + borderSideX
          otherSideY = ySpot + borderSideY
          drawSelectBox(ctContext, originX, originY, otherSideX, otherSideY)
        canvasDataAsImage.src = canvasAsData
        areaSelected = true
    else
      selectionX = gripX
      selectionY = gripY
]

