###
  This function selects the whole canvas, much like what would
  happen if you pressed cmd + a in any image software
###
allAction = (event) ->
  if not zoomActivate
    tH.push ctPaintTools[toolsToNumbers['all']]
    drawToolbars()
    if areaSelected
      areaSelected = false

      canvasDataAsImage = new Image()
      canvasDataAsImage.onload = ->
        ctContext.drawImage(canvasDataAsImage, 0, 0)

        ctContext.drawImage(selectionImage, selectionX, selectionY)

        cH.push ctCanvas.toDataURL()
        cH.shift()
        cF = []

        selectAll()
        selectionImage.src = imageDataToURL(selection)

      canvasDataAsImage.src = cH[cH.length - 1]

    else
      selectAll()

selectAll = ->
  coverUpOldCursor()
  tCanvasWidth = ctContext.canvas.width
  tCanvasHeight = ctContext.canvas.height
  selection = ctContext.getImageData(0, 0, tCanvasWidth - 1, tCanvasHeight - 1)
  selectionImage = new Image()
  selectionImage.onload = ->
    squareAction(ctContext, colorSwatches[1], 0, 0, tCanvasWidth - 1, tCanvasHeight - 1, true)
    canvasHoldover = ctCanvas.toDataURL()

    ctContext.drawImage(selectionImage, 0, 0)
    selectionsWidth = tCanvasWidth
    selectionsHeight = tCanvasHeight
    selectionX = 0
    selectionY = 0
    drawSelectBox( ctContext, 0, 0, tCanvasWidth - 1, tCanvasHeight - 1)
    areaSelected = true

  selectionImage.src = imageDataToURL(selection)

  setTimeout( ()->
    tH.pop()
    tH.push ctPaintTools[toolsToNumbers['select']]
    tH.shift()
    drawToolbars()
  ,20)

