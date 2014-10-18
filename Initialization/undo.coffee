undoAction = ->
  tH.push ctPaintTools[toolsToNumbers['undo']]
  drawToolbars()

  cF.push cH.pop()
  cH.unshift(cH[0])
  canvasDataAsImage = new Image()
  canvasDataAsImage.onload = ->
    undoAndRedoSizeComparison(canvasDataAsImage)
    ctContext.drawImage(canvasDataAsImage,0,0)
    updateOldCursor()
  canvasDataAsImage.src = cH[cH.length - 1]

  setTimeout( ()->
    tH.pop()
    drawToolbars()
  ,20)

undoAndRedoSizeComparison = (pastCanvas) ->
  widthIsntSame = pastCanvas.width isnt canvasWidth
  heightIsntSame = pastCanvas.height isnt canvasHeight
  if widthIsntSame or heightIsntSame
    newWidth = pastCanvas.width
    newHeight = pastCanvas.height
    ctContext.canvas.width = parseInt(newWidth)
    ctContext.canvas.height = parseInt(newHeight)
    canvasWidth = ctContext.canvas.width
    canvasHeight = ctContext.canvas.height
    ctCanvas.style.width = (canvasWidth).toString()+'px'
    ctCanvas.style.height = (canvasHeight).toString()+'px'

    