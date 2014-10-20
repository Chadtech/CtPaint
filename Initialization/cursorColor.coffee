###
  This function changes the color of the pixel
  that the cursor hovers over.
###
cursorColorAction = ->
  tH.push ctPaintTools[toolsToNumbers['cursorColor']]
  drawToolbars()

  indexOfCursorColors++
  indexOfCursorColors = indexOfCursorColors % cursorColors.length
  colorOfCursorPixel = cursorColors[indexOfCursorColors]
  refreshCursor()

  setTimeout( ()->
    tH.pop()
    drawToolbars()
  ,20)

  