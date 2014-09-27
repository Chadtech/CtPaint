rotateAction = ->
  menuUp = true
  normalCircumstance = false
  $('#menuDiv').css('top', (window.innerHeight - toolbarHeight - 45).toString())
  $('#menuDiv').css('left', (toolbarWidth + 10).toString())

  menuContext.canvas.width = 228
  menuContext.canvas.height = 35

  tH.push ctPaintTools[11]

  menuContext.drawImage(tH[tH.length - 1].menuImage, 0, 0)
  drawToolbars()

  whatSortOfDataSorting = rotateDataSorting

rotateDataSorting = ( inputMaterial) ->
  if inputMaterial isnt undefined
    acceptableKeys = ['9', '1', '2']
    if inputMaterial in acceptableKeys
      if not areaSelected
        howManyRotates = 0
        sWidth = ctContext.canvas.width
        sHeight = ctContext.canvas.height
        canvasCurrently = ctContext.getImageData(0, 0, sWidth, sHeight)
              
        canvasAsPixels = dataToPixels(canvasCurrently.data)
        switch inputMaterial
          when '9'
            canvasAsPixels = axisFlip(canvasAsPixels, sWidth, sHeight)
            canvasAsPixels = horizontalFlip(canvasAsPixels[0], canvasAsPixels[1], canvasAsPixels[2])
          when '1'
            canvasAsPixels = horizontalFlip(canvasAsPixels, sWidth, sHeight)
            canvasAsPixels = verticalFlip(canvasAsPixels[0], canvasAsPixels[1], canvasAsPixels[2])
          when '2'
            canvasAsPixels = horizontalFlip(canvasAsPixels, sWidth, sHeight)
            canvasAsPixels = axisFlip(canvasAsPixels[0], canvasAsPixels[1], canvasAsPixels[2])

        rotatedData = []
        thisPixelIndex = 0
        while thisPixelIndex < canvasAsPixels[0].length
          colorIndex = 0
          while colorIndex < 4
            rotatedData.push canvasAsPixels[0][thisPixelIndex][colorIndex]
            colorIndex++
          thisPixelIndex++

        rotatedCanvas = document.createElement('canvas')
        rotatedCanvas = rotatedCanvas.getContext('2d')
        rotatedCanvas = rotatedCanvas.createImageData(canvasAsPixels[1], canvasAsPixels[2])

        datumIndex = 0
        while datumIndex < rotatedData.length
          rotatedCanvas.data[datumIndex] = rotatedData[datumIndex]
          datumIndex++

        ctContext.canvas.width = canvasAsPixels[1]
        ctContext.canvas.height = canvasAsPixels[2]
        canvasWidth = ctContext.canvas.width
        canvasHeight = ctContext.canvas.height
        ctCanvas.style.width = (canvasWidth).toString()+'px'
        ctCanvas.style.height = (canvasHeight).toString()+'px'
        ctContext.putImageData(rotatedCanvas, 0, 0)

        cH.push ctCanvas.toDataURL()
        cH.shift()
        cF = []
        tH.pop()
        drawToolbars()
        $('#menuDiv').css('top',(window.innerHeight).toString())
        normalCircumstance = true
        menuUp = false
        positionCorners()

dataToPixels = (imageData) ->
  convertedData = []
  datumIndex = 0
  singlePixel = []
  while datumIndex < imageData.length
    singlePixel.push imageData[datumIndex]
    if datumIndex % 4 is 3
      convertedData.push singlePixel
      singlePixel = []
    datumIndex++
  return convertedData

horizontalFlip = (imageInPixels, itsWidth, itsHeight) ->
  flippedCanvas = []
  pixelIndex = 0
  while pixelIndex < imageInPixels.length
    rowStart = pixelIndex // itsWidth
    inRow = pixelIndex %% itsWidth
    pixelToFlip = rowStart * itsWidth
    pixelToFlip += (itsWidth - inRow - 1)
    flippedCanvas.push imageInPixels[pixelToFlip]
    pixelIndex++
  return [flippedCanvas, itsWidth, itsHeight]

verticalFlip = (imageInPixels, itsWidth, itsHeight) ->
  flippedCanvas = []
  rowIndex = 0
  while rowIndex < (imageInPixels.length // itsWidth)
    thisRow = (imageInPixels.length // itsWidth) - rowIndex - 1
    rowAt = thisRow * itsWidth
    columnIndex = 0
    while columnIndex < itsWidth
      flippedCanvas.push imageInPixels[rowAt + columnIndex]
      columnIndex++
    rowIndex++
  return [flippedCanvas, itsWidth, itsHeight]

axisFlip = (imageInPixels, itsWidth, itsHeight) ->
  flippedCanvas = []
  pixelIndex = 0
  while pixelIndex < imageInPixels.length
    atRow = pixelIndex % itsHeight
    atRow *= itsWidth
    atColumn = pixelIndex // itsHeight
    flippedCanvas.push imageInPixels[atRow + atColumn]
    pixelIndex++
  return [flippedCanvas, itsHeight, itsWidth]

