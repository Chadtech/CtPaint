magnitudeDownAction = ->
  tH.push ctPaintTools[toolsToNumbers['magnitudeDown']]
  drawToolbars()

  setTimeout( ()->
    tH.pop()
    if isNaN(tH[tH.length - 1].maxMagnitude) is false
      if 1 < tH[tH.length - 1].magnitude
        tH[tH.length - 1].magnitude--
    drawToolbars()
  ,20)

  