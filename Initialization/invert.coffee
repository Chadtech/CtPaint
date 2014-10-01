invertAction = () ->
  tH.push ctPaintTools[12]
  if not areaSelected
    tWidth = ctContext.canvas.width
    tHeight = ctContext.canvas.height
    canvasAsWeFoundIt = ctContext.getImageData(0, 0, tWidth, tHeight)
    canvasData = canvasAsWeFoundIt.data
    cH.push canvasAsWeFoundIt.data
    cH.shift()
    cF = []
    canvasInPixels = []

    canvasIndex = 0
    colorAtDatum = []
    while canvasIndex < canvasData.length
      colorAtDatum.push canvasData[canvasIndex]
      if canvasIndex % 4 is 3
        canvasInPixels.push colorAtDatum
        colorAtDatum = []
      canvasIndex++

    pixelIndex = 0
    while pixelIndex < canvasInPixels.length
      red = canvasInPixels[pixelIndex][0]
      green = canvasInPixels[pixelIndex][1]
      blue = canvasInPixels[pixelIndex][2]
      canvasInPixels[pixelIndex] = [ 255 - red, 255 - green, 255 - blue, 255]
      pixelIndex++

    pixelIndex = 0
    while pixelIndex < canvasInPixels.length
      colorIndex = 0
      while colorIndex < 4
        datumIndex = pixelIndex * 4
        canvasAsWeFoundIt.data[datumIndex + colorIndex] = 
        canvasInPixels[pixelIndex][colorIndex]
        colorIndex++
      pixelIndex++

    ctContext.putImageData(canvasAsWeFoundIt, 0, 0)
    cH.push ctCanvas.toDataURL()
    cH.shift()
    cF = []

  else
    selectionData = selection.data
    selectionInPixels = []

    selectionIndex = 0
    colorInDatum = []
    while selectionIndex <  selectionData.length
      colorInDatum.push selectionData[selectionIndex]
      if selectionIndex % 4 is 3
        selectionInPixels.push colorInDatum
        colorInDatum = []
      selectionIndex++

    pixelIndex = 0
    while pixelIndex < selectionInPixels.length
      red = selectionInPixels[pixelIndex][0]
      green = selectionInPixels[pixelIndex][1]
      blue = selectionInPixels[pixelIndex][2]
      selectionInPixels[pixelIndex] = [ 255 - red, 255 - green, 255 - blue, 255]
      pixelIndex++

    pixelIndex = 0
    while pixelIndex < selectionInPixels.length
      colorIndex = 0
      while colorIndex < 4
        datumIndex = pixelIndex * 4
        selection.data[datumIndex + colorIndex] = selectionInPixels[pixelIndex][colorIndex]
        colorIndex++
      pixelIndex++

    ctContext.putImageData(selection, selectionX, selectionY)

  setTimeout( ()->
    tH.pop()
    drawToolbars()
  ,20)

  