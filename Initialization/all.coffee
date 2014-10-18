allAction = (event) ->
  tH.push ctPaintTools[toolsToNumbers['all']]
  drawToolbars()

  if not zoomActivate
    if areaSelected
      areaSelected = false

      canvasDataAsImage = new Image()
      canvasDataAsImage.onload = ->
        ctContext.drawImage(canvasDataAsImage, 0, 0)
        ctContext.putImageData(selection, selectionX, selectionY)

        cH.push ctCanvas.toDataURL()
        cH.shift()
        cF = []

        selectAll()

      canvasDataAsImage.src = cH[cH.length - 1]

    else
      selectAll()

selectAll = ->
  coverUpOldCursor()
  tCanvasWidth = ctContext.canvas.width
  tCanvasHeight = ctContext.canvas.height
  selection = ctContext.getImageData(0, 0, tCanvasWidth - 1, tCanvasHeight - 1)
  squareAction(ctContext, colorSwatches[1], 0, 0, tCanvasWidth - 1, tCanvasHeight - 1, true)
  canvasHoldover = ctCanvas.toDataURL()
  ctContext.putImageData(selection, 0, 0)
  selectionsWidth = tCanvasWidth
  selectionsHeight = tCanvasHeight
  selectionX = 0
  selectionY = 0
  drawSelectBox( ctContext, 0, 0, tCanvasWidth - 1, tCanvasHeight - 1)
  areaSelected = true

  setTimeout( ()->
    tH.pop()
    tH.push ctPaintTools[toolsToNumbers['select']]
    tH.shift()
    drawToolbars()
  ,20)

