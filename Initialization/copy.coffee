copyAction = ->
  tH.push ctPaintTools[18]
  drawToolbars()

  if areaSelected
    copyMemory = selection
  else
    tCanvasWidth = ctContext.canvas.width
    tCanvasHeight = ctContext.canvas.height
    copyMemory = ctContext.getImageData(0, 0, tCanvasWidth, tCanvasHeight)
  copyExists = true

  setTimeout( ()->
    tH.pop()
    drawToolbars()
  ,20)