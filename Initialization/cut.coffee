cutAction = ->
  tH.push ctPaintTools[18]
  drawToolbars()

  # Copy the are to the 'clipboard'
  if areaSelected
    copyMemory = selection
    copeWithSelection()
    tRightEdge = selectionX + selectionsWidth
    tBottomEdge = selectionY + selectionsHeight
    areaSelected = false

    canvasDataAsImage = new Image()
    canvasDataAsImage.onload = ->
      ctContext.drawImage(canvasDataAsImage, 0, 0)
      squareAction(ctContext, colorSwatches[1], selectionX, selectionY, tRightEdge, tBottomEdge, true)
      canvasAsData = ctCanvas.toDataURL()
    canvasDataAsImage.src = canvasAsData
  else
    copyMemory = ctContext.getImageData(0, 0, ctContext.canvas.width, ctContext.canvas.height)
    squareAction(ctContext, colorSwatches[1], 0, 0, ctContext.canvas.width, ctContext.canvas.height, true)
    canvasAsData = ctCanvas.toDataURL()
  copyExists = true



  setTimeout( ()->
    tH.pop()
    drawToolbars()
  ,20)