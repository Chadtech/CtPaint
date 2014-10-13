###
  copy either saves the selections data, or if there is no selection the whole canvas,
  into what people normally understand as the clipboard.

  The time out at the end, is to ensure that for at least some duration the copy icon
  is lit up.
###
copyAction = ->
  tH.push ctPaintTools[toolsToNumbers['copy']]
  drawToolbars()

  coverUpOldCursor()
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

