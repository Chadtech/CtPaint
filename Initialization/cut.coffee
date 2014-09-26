cutAction = ->
  tH.push ctPaintTools[18]
  drawToolbars()

  if areaSelected
    copyMemory = selection
    copeWithSelection()
    tRightEdge = selectionX + selectionsWidth
    tBottomEdge = selectionY + selectionsHeight
    areaSelected = false
    canvasDataAsImage = new Image()
    canvasDataAsImage.onload = ->
      ctContext.drawImage(canvasDataAsImage, 0, 0)
      sX = selectionX
      sY = selectionY
      squareAction(ctContext, colorSwatches[1], sX, sY, tRightEdge, tBottomEdge, true)
      canvasAsData = ctCanvas.toDataURL()
    canvasDataAsImage.src = canvasAsData
  else
    tCanvasWidth = ctContext.canvas.width
    tCanvasHeight = ctContext.canvas.height
    copyMemory = ctContext.getImageData(0, 0, tCanvasWidth, tCanvasHeight)
    squareAction(ctContext, colorSwatches[1], 0, 0, tCanvasWidth, tCanvasHeight, true)
    canvasAsData = ctCanvas.toDataURL()
  copyExists = true

  setTimeout( ()->
    tH.pop()
    drawToolbars()
  ,20)