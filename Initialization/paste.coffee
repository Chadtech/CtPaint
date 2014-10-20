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

        ctContext.drawImage(selectionImage, selectionX, selectionY)
        canvasHoldover = ctCanvas.toDataURL()
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
    tH.push ctPaintTools[toolsToNumbers['select']]
    tH.shift()
    drawToolbars()
  ,20)

pasteTheSelection = ->
  # Set the selection to what was in the clipboard
  selection = copyMemory
  selectionImage = new Image()
  selectionImage.src = imageDataToURL(selection)
  #If we are zomed in, we want the pastee
  # to be in the visual field
  if not zoomActivate
    selectionX = 0
    selectionY = 0
  # Otherwise just stick it in the corner
  else
    selectionX = zoomRootX
    selectionY = zoomRootY
  selectionsWidth = selection.width
  selectionsHeight = selection.height
  tooWide = selectionsWidth > canvasWidth
  tooTall = selectionsHeight > canvasHeight
  # If its too big in both dimensions, replace the canvas with the
  # selections
  if tooTall and tooWide
    ctContext.canvas.width = selectionsWidth
    ctContext.canvas.height = selectionsHeight
    canvasWidth = ctContext.canvas.width
    canvasHeight = ctContext.canvas.height
    ctCanvas.style.width = (canvasWidth).toString()+'px'
    ctCanvas.style.height = (canvasHeight).toString()+'px'
    ctContext.putImageData(selection, 0, 0)
    cH.push ctCanvas.toDataURL()
    cH.shift()
  else
    canvasDataAsImage = new Image()
    canvasDataAsImage.onload = ->
      # Draw the canvas as we know it to be
      ctContext.drawImage(canvasDataAsImage,0,0)
      # Then draw the selection
      ctContext.drawImage(selectionImage, selectionX, selectionY)
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

  