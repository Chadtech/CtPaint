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
        cH.push ctCanvas.toDataURL()
        cH.shift()
        cF = []
        pasteTheSelection()
      canvasDataAsImage.src = cH[cH.length - 1]
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
  canvasDataAsImage.src = cH[cH.length - 1]
  areaSelected = true

  