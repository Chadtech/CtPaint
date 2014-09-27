redoAction = ->
  tH.push ctPaintTools[23]
  drawToolbars()

  if cF.length > 0
    cH.push cF.pop()
    canvasDataAsImage = new Image()
    canvasDataAsImage.onload = ->
      ctContext.drawImage(canvasDataAsImage,0,0)
    canvasDataAsImage.src = cH[cH.length - 1]

  setTimeout( ()->
    tH.pop()
    drawToolbars()
  ,20)