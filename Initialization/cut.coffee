###
  If there is a region selects, saves the data into the clip board,
  then draws a square filled with the secondary color (colorSwatches[1])
  and terminates the selection. 

  Cut does exactly what a normal computer user would expect.
###
cutAction = ->
  tH.push ctPaintTools[toolsToNumbers['cut']]
  drawToolbars()

  coverUpOldCursor()
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
      cH.push ctCanvas.toDataURL()
      cH.shift()
      cF = []
    canvasDataAsImage.src = cH[cH.length - 1]
  else
    tCanvasWidth = ctContext.canvas.width
    tCanvasHeight = ctContext.canvas.height
    copyMemory = ctContext.getImageData(0, 0, tCanvasWidth, tCanvasHeight)
    squareAction(ctContext, colorSwatches[1], 0, 0, tCanvasWidth, tCanvasHeight, true)
    cH.push ctCanvas.toDataURL()
    cH.shift()
    cF = []
  copyExists = true

  setTimeout( ()->
    tH.pop()
    drawToolbars()
  ,20)

  