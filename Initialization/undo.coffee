undoAction = ->
  cF.push cH.pop()
  cH.unshift(cH[0])
  canvasDataAsImage = new Image()
  canvasDataAsImage.onload = ->
    ctContext.drawImage(canvasDataAsImage,0,0)
  canvasDataAsImage.src = cH[cH.length - 1]