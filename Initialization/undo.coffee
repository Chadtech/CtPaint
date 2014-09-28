undoAction = ->
  tH.push ctPaintTools[22]
  drawToolbars()

  cF.push cH.pop()
  cH.unshift(cH[0])
  canvasDataAsImage = new Image()
  canvasDataAsImage.onload = ->
    undoAndRedoSizeComparison(canvasDataAsImage)
    ctContext.drawImage(canvasDataAsImage,0,0)
  canvasDataAsImage.src = cH[cH.length - 1]

  setTimeout( ()->
    tH.pop()
    drawToolbars()
  ,20)

undoAndRedoSizeComparison = (pastCanvas) ->
  widthCondition = pastCanvas.width isnt canvasWidth
  heightCondition = pastCanvas.height isnt canvasHeight
  if widthCondition or heightCondition
    newWidth = pastCanvas.width
    newHeight = pastCanvas.height
    ctContext.canvas.width = parseInt(newWidth)
    ctContext.canvas.height = parseInt(newHeight)
    canvasDataAsImage = new Image()
    canvasDataAsImage.onload = ->
      ctContext.drawImage(canvasDataAsImage,0,0)
      cH.push ctCanvas.toDataURL()
      cH.shift()
      cF = []
    canvasDataAsImage.src = cH[cH.length - 1]
    ctContext.fillStyle = rgbToHex(colorSwatches[1])
    if (ctContext.canvas.width > canvasWidth) and (ctContext.canvas.height > canvasHeight)
      ctContext.fillRect(canvasWidth, 0, ctContext.canvas.width, ctContext.canvas.height)
      ctContext.fillRect(0, canvasHeight, canvasWidth, ctContext.canvas.height)
    else if (ctContext.canvas.width > canvasWidth)
      ctContext.fillRect(canvasWidth, 0, ctContext.canvas.width, ctContext.canvas.height)
    else if (ctContext.canvas.height > canvasHeight)
      ctContext.fillRect(0, canvasHeight, ctContext.canvas.width, ctContext.canvas.height)
    canvasWidth = ctContext.canvas.width
    canvasHeight = ctContext.canvas.height
    ctCanvas.style.width = (canvasWidth).toString()+'px'
    ctCanvas.style.height = (canvasHeight).toString()+'px'
    positionCorners()