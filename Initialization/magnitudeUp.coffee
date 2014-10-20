magnitudeUpAction = ->
  tH.push ctPaintTools[toolsToNumbers['magnitudeUp']]
  drawToolbars()

  setTimeout( ()->
    tH.pop()
    if isNaN(tH[tH.length - 1].maxMagnitude) is false
      if tH[tH.length - 1].magnitude < tH[tH.length - 1].maxMagnitude
        tH[tH.length - 1].magnitude++
    drawToolbars()
  ,20)

  