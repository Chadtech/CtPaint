###
  Change the mode from true to false, or from false to true.
###
modeChangeAction = ->
  tH.push ctPaintTools[toolsToNumbers['modeChange']]
  drawToolbars()

  setTimeout( ()->
    tH.pop()
    if tH[tH.length - 1].mode is true
      tH[tH.length - 1].mode = false
    else
      tH[tH.length - 1].mode = true
    drawToolbars()
  ,20)

  