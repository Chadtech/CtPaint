pasteAction = ->
  tH.push ctPaintTools[toolsToNumbers['paste']]
  drawToolbars()
  
  # Only paste if there is something in the clipboard
  if copyExists
    # If area is selected, we need to ditch the selection
    # Before pasting (A)
    if areaSelected
      areaSelected = false
      canvasDataAsImage = new Image()
      canvasDataAsImage.onload = ->
        ctContext.drawImage(canvasDataAsImage, 0, 0)
        ctContext.putImageData(selection, selectionX, selectionY)
        cH.push ctCanvas.toDataURL()
        cH.shift()
        cF = []
        # (A)
        pasteTheSelection()
      canvasDataAsImage.src = cH[cH.length - 1]
    else
      # (A)
      pasteTheSelection()

  # Put a little delay so the user has a visual impression
  # that the tool was used
  setTimeout( ()->
    tH.pop()
    drawToolbars()
    tH.push ctPaintTools[toolsToNumbers['select']]
    tH.shift()
  ,20)

pasteTheSelection = ->
  # Set the selection to what was in the clipboard
  selection = copyMemory
  if not zoomActivate
    selectionX = 0
    selectionY = 0
  else
    selectionX = zoomRootX
    selectionY = zoomRootY
  selectionsWidth = selection.width
  selectionsHeight = selection.height
  canvasDataAsImage = new Image()
  canvasDataAsImage.onload = ->
    # Draw the canvas as we know it to be
    ctContext.drawImage(canvasDataAsImage,0,0)
    # Then draw the selection
    ctContext.putImageData(selection, selectionX, selectionY)
    # Then draw that little box around the selection
    originX = selectionX
    originY = selectionY
    edgeX = originX + selectionsWidth - 1
    edgeY = originY + selectionsHeight - 1
    drawSelectBox(ctContext, originX, originY, edgeX, edgeY)
    # Note that none of this is saved, its merely drawn.
    # These drawings are not incorporated into the data
    # of the canvas.
    # It gets incorporated upon 'exit' from selection.
  canvasDataAsImage.src = cH[cH.length - 1]
  areaSelected = true

  