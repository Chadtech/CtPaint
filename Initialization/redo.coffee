redoAction = ->
  # Update the tool history and draw the toolbars to reflect
  # What tool is in use.
  tH.push ctPaintTools[toolsToNumbers['redo']]
  drawToolbars()

  # If there is actually a canvas in the 'future canvas'
  # queue, replace our current canvas with it.
  if cF.length > 0
    cH.push cF.pop()
    canvasDataAsImage = new Image()
    canvasDataAsImage.onload = ->
      # Figure out what to do if the replacing canvas
      # Isnt the same size as our current canvas
      undoAndRedoSizeComparison(canvasDataAsImage)
      ctContext.drawImage(canvasDataAsImage,0,0)
      updateOldCursor()
      refreshCursor()
    canvasDataAsImage.src = cH[cH.length - 1]

  # Go back to the previous tool, but put a little delay on it
  # So the user gets the visual impresssion that the redo
  # Actually occured.
  setTimeout( ()->
    tH.pop()
    drawToolbars()
  ,20)

  