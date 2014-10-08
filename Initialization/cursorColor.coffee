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

  