cutAction = ->
  tH.push ctPaintTools[18]
  drawToolbars()

  if areaSelected
    copyMemory = selection
    tRightEdge = selectionX + selectionsWidth - 1
    tBottomEdge = selectionY + selectionsHeight - 1
    canvasDataAsImage = new Image()
    canvasDataAsImage.onload = ->
      ctContext.drawImage(canvasDataAsImage, 0, 0)
      ctContext.putImageData(selection, selectionX, selectionY)
      squareAction(ctContext, colorSwatches[1], selectionX, selectionY, tRightEdge, tBottomEdge, true)
      canvasAsData = ctCanvas.toDataURL()
    canvasDataAsImage.src = canvasAsData
  else
    copyMemory = ctContext.getImageData(0, 0, ctContext.canvas.width, ctContext.canvas.height)
    tRightEdge = ctContext.canvas.width
    tBottomEdge = ctContext.canvas.height
    squareAction(ctContext, colorSwatches[1], 0, 0, tRightEdge, tBottomEdge, true)
  copyExists = true
  canvasAsData = ctCanvas.toDataURL()

  setTimeout( ()->
    tH.pop()
    drawToolbars()
  ,20)