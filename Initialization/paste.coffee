pasteAction = ->
  tH.push ctPaintTools[19]
  drawToolbars()
  if copyExists
    if areaSelected
      areaSelected = false
      canvasDataAsImage = new Image()
      canvasDataAsImage.onload = ->
        ctContext.drawImage(canvasDataAsImage, 0, 0)
        ctContext.putImageData(selection, selectionX, selectionY)
        canvasAsData = ctCanvas.toDataURL()
        pasteTheSelection()
      canvasDataAsImage.src = canvasAsData
    else
      pasteTheSelection()

  setTimeout( ()->
    tH.pop()
    drawToolbars()
    tH.push ctPaintTools[1]
    tH.shift()
  ,20)

pasteTheSelection = ->
  selection = copyMemory
  selectionX = 0
  selectionY = 0
  selectionsWidth = selection.width
  selectionsHeight = selection.height
  canvasDataAsImage = new Image()
  canvasDataAsImage.onload = ->
    ctContext.drawImage(canvasDataAsImage,0,0)
    ctContext.putImageData(selection, selectionX, selectionY)
    drawSelectBox(ctContext, -1, -1, selectionsWidth + 1, selectionsHeight + 1)
  canvasDataAsImage.src = canvasAsData
  areaSelected = true