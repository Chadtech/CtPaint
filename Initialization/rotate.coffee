rotateAction = ->
  menuUp = true
  normalCircumstance = false
  $('#menuDiv').css('top', (window.innerHeight - toolbarHeight - 45).toString())
  $('#menuDiv').css('left', (toolbarWidth + 10).toString())

  tH.push ctPaintTools[toolsToNumbers['rotate']]

  menuContext.canvas.width = tH[tH.length - 1].menuImage.width
  menuContext.canvas.height = tH[tH.length - 1].menuImage.height

  menuContext.drawImage(tH[tH.length - 1].menuImage, 0, 0)
  drawToolbars()

  whatSortOfDataSorting = rotateDataSorting
  whatSortOfMouseListening = rotateMouseListening

rotateDataSorting = ( inputMaterial, eventIsKeyDown) ->
  if not eventIsKeyDown
    if inputMaterial isnt undefined
      acceptableKeys = ['9', '1', '2']
      if inputMaterial in acceptableKeys
        rotation( inputMaterial )
      else
        if inputMaterial is 'n'
          tH.pop()
          rotateFinishUp()
  else
    switch inputMaterial
      when '9' 
        menuContext.drawImage(ninetyDegreesLitUp, tH[tH.length - 1].menuImage.width - 223, 5)
      when '1'
        xPositionOfButton = tH[tH.length - 1].menuImage.width - 187
        menuContext.drawImage(oneHundredAndEightyDegreesLitUp, xPositionOfButton, 5)
      when '2' 
        xPositionOfButton = tH[tH.length - 1].menuImage.width - 138
        menuContext.drawImage(twoHundredAndSeventyDegreesLitUp, xPositionOfButton, 5)
      when 'n' 
        menuContext.drawImage(cancelLitUp, tH[tH.length - 1].menuImage.width - 89, 5)

rotation = ( howManyDegrees ) ->
  # Cover up the cursor pixel so that it doesnt become an artifact on the canvas
  coverUpOldCursor()
  if not areaSelected

    sWidth = ctContext.canvas.width
    sHeight = ctContext.canvas.height
    canvasCurrently = ctContext.getImageData(0, 0, sWidth, sHeight)
                
    canvasAsPixels = dataToPixels(canvasCurrently.data)
    switch howManyDegrees
      when '9'
        # Rotate ninety degrees
        canvasAsPixels = axisFlip(canvasAsPixels, sWidth, sHeight)
        canvasAsPixels = horizontalFlip(canvasAsPixels[0], canvasAsPixels[1], canvasAsPixels[2])
      when '1'
        # rotate 180 degrees
        canvasAsPixels = horizontalFlip(canvasAsPixels, sWidth, sHeight)
        canvasAsPixels = verticalFlip(canvasAsPixels[0], canvasAsPixels[1], canvasAsPixels[2])
      when '2'
        # Rotate 270 degrees
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
    rotateFinishUp()

  else
    selectionAsPixels = dataToPixels(selection.data)
    switch howManyDegrees
      when '9'
        selectionAsPixels = 
          axisFlip(selectionAsPixels, selectionsWidth, selectionsHeight)
        selectionAsPixels =
          horizontalFlip(selectionAsPixels[0], selectionAsPixels[1], selectionAsPixels[2])
      when '1'
        selectionAsPixels = 
          horizontalFlip(selectionAsPixels, selectionsWidth, selectionsHeight)
        selectionAsPixels = 
          verticalFlip(selectionAsPixels[0], selectionAsPixels[1], selectionAsPixels[2])
      when '2'
        selectionAsPixels = 
          horizontalFlip(selectionAsPixels, selectionsWidth, selectionsHeight)
        selectionAsPixels = 
          axisFlip(selectionAsPixels[0], selectionAsPixels[1], selectionAsPixels[2])

    rotatedData = []
    thisPixelIndex = 0
    while thisPixelIndex < selectionAsPixels[0].length
      colorIndex = 0
      while colorIndex < 4
        rotatedData.push selectionAsPixels[0][thisPixelIndex][colorIndex]
        colorIndex++
      thisPixelIndex++

    rotatedSelection = document.createElement('canvas')
    rotatedSelection = rotatedSelection.getContext('2d')
    rotatedSelection = 
      rotatedSelection.createImageData(selectionAsPixels[1], selectionAsPixels[2])

    datumIndex = 0
    while datumIndex < rotatedData.length
      rotatedSelection.data[datumIndex] = rotatedData[datumIndex]
      datumIndex++

    selection = rotatedSelection
    selectionImage = new Image()
    selectionImage.src = imageDataToURL(selection)

    selectionsWidth = rotatedSelection.width
    selectionsHeight = rotatedSelection.height

    canvasDataAsImage = new Image()
    canvasDataAsImage.onload = ->
      ctContext.drawImage(canvasDataAsImage,0,0)
      ctContext.drawImage(selectionImage, selectionX, selectionY)
      rightEdge = selectionX + selectionsWidth
      bottomEdge = selectionY + selectionsHeight
      drawSelectBox(ctContext, selectionX - 1, selectionY - 1, rightEdge, bottomEdge)
    canvasDataAsImage.src = canvasHoldover

    tH.pop()
    rotateFinishUp()

rotateFinishUp = ->
  drawToolbars()
  $('#menuDiv').css('top', (window.innerHeight).toString())
  normalCircumstance = true
  menuUp = false

# Converts image data into an array of pixels
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

###
  The following three functions manipulate a canvas, 
  given as an array of pixels, and its dimensions as arguments.

  The following three functions, when done in sequence, can bring
  the canvas to various states of rotation. Meaning, that though
  a horizontal flip ( a mirroring ) nor an 'axis flip' count as a rotation,
  horiontally flipping, and 'axis flipping' when done in a sequence
  bring the canvas to a state the user would expect if they wanted
  the canvas rotated 270 degrees.

  'axis flip' is just a term I made up, I refer to switching the
  x and y axes with each other.
###
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

rotateMouseListening = ( coordinates, eventIsMouseDown ) ->
  #Check if mouse event was in 90 button region
  notTooFarLeft = (tH[tH.length - 1].menuImage.width - 223) < coordinates[0]
  tooFarRight = ((tH[tH.length - 1].menuImage.width - 223) + ninetyDegreesLitUp.width)
  notTooFarRight = coordinates[0] < tooFarRight
  withinXBoundaries = notTooFarLeft and notTooFarRight
  notTooHigh = 5 < coordinates[1]
  notTooLow = coordinates[1] < (5 + ninetyDegreesLitUp.height)
  withinYBoundaries = notTooHigh and notTooLow
  if withinXBoundaries and withinYBoundaries
    if eventIsMouseDown
      menuContext.drawImage(ninetyDegreesLitUp, tH[tH.length - 1].menuImage.width - 223, 5)
    else
      rotation('9')

  #Check if mouse event was in 180 button region
  notTooFarLeft = (tH[tH.length - 1].menuImage.width - 187) < coordinates[0]
  tooFarRight = ((tH[tH.length - 1].menuImage.width - 187) + oneHundredAndEightyDegreesLitUp.width)
  notTooFarRight = coordinates[0] < tooFarRight
  withinXBoundaries = notTooFarLeft and notTooFarRight
  notTooHigh = 5 < coordinates[1]
  notTooLow = coordinates[1] < (5 + oneHundredAndEightyDegreesLitUp.height)
  withinYBoundaries = notTooHigh and notTooLow
  if withinXBoundaries and withinYBoundaries
    if eventIsMouseDown
      leftSide = tH[tH.length - 1].menuImage.width - 187
      menuContext.drawImage(oneHundredAndEightyDegreesLitUp, leftSide, 5)
    else
      rotation('1')

  #Check if mouse event was in 270 button region
  notTooFarLeft = (tH[tH.length - 1].menuImage.width - 138) < coordinates[0]
  tooFarRight = ((tH[tH.length - 1].menuImage.width - 138) + twoHundredAndSeventyDegreesLitUp.width)
  notTooFarRight = coordinates[0] < tooFarRight
  withinXBoundaries = notTooFarLeft and notTooFarRight
  notTooHigh = 5 < coordinates[1]
  notTooLow = coordinates[1] < (5 + twoHundredAndSeventyDegreesLitUp.height)
  withinYBoundaries = notTooHigh and notTooLow
  if withinXBoundaries and withinYBoundaries
    if eventIsMouseDown
      leftSide = tH[tH.length - 1].menuImage.width - 138
      menuContext.drawImage(twoHundredAndSeventyDegreesLitUp, leftSide, 5)
    else
      rotation('2')

  #Check if mouse event was in cancel button region
  notTooFarLeft = (tH[tH.length - 1].menuImage.width - 89) < coordinates[0]
  notTooFarRight = coordinates[0] < ((tH[tH.length - 1].menuImage.width - 89) + cancelLitUp.width)
  withinXBoundaries = notTooFarLeft and notTooFarRight
  notTooHigh = 5 < coordinates[1]
  notTooLow = coordinates[1] < (5 + cancelLitUp.height)
  withinYBoundaries = notTooHigh and notTooLow
  if withinXBoundaries and withinYBoundaries
    if eventIsMouseDown
      menuContext.drawImage(cancelLitUp, tH[tH.length - 1].menuImage.width - 89, 5)
    else
      tH.pop()
      rotateFinishUp()
