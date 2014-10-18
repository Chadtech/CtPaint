###
  These are the functions relevant to flipping images, whether that
  image be the canvas itself, or a selection of the canvas. 
###
flipAction = () ->
  menuUp = true
  normalCircumstance = false
  $('#menuDiv').css('top', (window.innerHeight - toolbarHeight - 45).toString())
  $('#menuDiv').css('left', (toolbarWidth + 10).toString())

  tH.push ctPaintTools[toolsToNumbers['flip']]

  menuContext.canvas.width = tH[tH.length - 1].menuImage.width
  menuContext.canvas.height = tH[tH.length - 1].menuImage.height

  menuContext.drawImage(tH[tH.length - 1].menuImage, 0, 0)
  drawToolbars()

  whatSortOfDataSorting = flipDataSorting
  whatSortOfMouseListening = flipMouseListening

###
  flipDataSorting does all the heavy lifting of the flip 
  tool. 

  After listening to the key that was pressed and working with it.
  It goes into one of four distinct sectionf of code: (A) flip
  a selected area horizontally, (B) flip the canvas horizontally
  (C) flip a selected area vertically; and (D) flip the canvas
  vertically

  All the sections basically flow the same way:
    (a) Get the data of the image being manipulated
    (b) Convert it into an array of pixels (instead 
    of an array of color values)
    (c) Rearrange it accordingly
    (d) Turn it back into image data 
    (e) Paste it back onto the canvas, and wrap up the
    whole operation
###
xFlip = ->
  coverUpOldCursor()
  if areaSelected
    #   ( a )
    selectionsData = selection.data
    selectionInPixels = []

    #   ( b )
    selectionIndex = 0
    colorOfDatum = []
    while selectionIndex < selectionsData.length
      colorOfDatum.push selectionsData[selectionIndex]
      if selectionIndex % 4 is 3
        selectionInPixels.push colorOfDatum
        colorOfDatum = []
      selectionIndex++

    #   ( c )
    flippedSelection = []
    pixelIndex = 0
    while pixelIndex < selectionInPixels.length
      rowStart = pixelIndex // selectionsWidth
      inRow = pixelIndex %% selectionsWidth
      pixelToFlip = rowStart * selectionsWidth
      pixelToFlip += (selectionsWidth - inRow - 1)
      flippedSelection.push selectionInPixels[pixelToFlip]
      pixelIndex++

    #   ( d )
    pixelIndex = 0
    while pixelIndex < flippedSelection.length
      colorIndex = 0
      while colorIndex < 4
        datumIndex = pixelIndex * 4
        selection.data[datumIndex + colorIndex] = 
          flippedSelection[pixelIndex][colorIndex]
        colorIndex++
      pixelIndex++

    #   ( e )
    canvasDataAsImage = new Image()
    canvasDataAsImage.onload = ->
      ctContext.drawImage(canvasDataAsImage,0,0)
      ctContext.putImageData(selection, selectionX, selectionY)
      rightEdge = selectionX + selectionsWidth - 1
      bottomEdge = selectionY + selectionsHeight - 1
      drawSelectBox(ctContext, selectionX, selectionY, rightEdge, bottomEdge)
    canvasDataAsImage.src = canvasHoldover

    tH.pop()
    drawToolbars()
    $('#menuDiv').css('top',(window.innerHeight).toString())
    normalCircumstance = true
    menuUp = false

  #   ( B )
  else
    #   ( a )
    tWidth = ctContext.canvas.width
    tHeight = ctContext.canvas.height
    canvasAsWeFoundIt = ctContext.getImageData(0, 0, tWidth, tHeight)
    canvasData = canvasAsWeFoundIt.data
    canvasInPixels = []

    #   ( b )
    canvasIndex = 0
    colorAtDatum = []
    while canvasIndex < canvasData.length
      colorAtDatum.push canvasData[canvasIndex]
      if canvasIndex % 4 is 3
        canvasInPixels.push colorAtDatum
        colorAtDatum = []
      canvasIndex++

    #   ( c )
    flippedCanvas = []
    pixelIndex = 0
    while pixelIndex < canvasInPixels.length
      rowStart = pixelIndex // tWidth
      inRow = pixelIndex %% tWidth
      pixelToFlip = rowStart * tWidth
      pixelToFlip += (tWidth - inRow - 1)
      flippedCanvas.push canvasInPixels[pixelToFlip]
      pixelIndex++

    #  ( d )
    pixelIndex = 0
    while pixelIndex < canvasInPixels.length
      colorIndex = 0
      while colorIndex < 4
        datumIndex = pixelIndex * 4
        canvasAsWeFoundIt.data[datumIndex + colorIndex] = 
          flippedCanvas[pixelIndex][colorIndex]
        colorIndex++
      pixelIndex++

    #   ( e )
    ctContext.putImageData(canvasAsWeFoundIt, 0, 0)
    flipFinishUp()

yFlip = ->
  coverUpOldCursor()
  if areaSelected
    #   ( a )
    selectionsData = selection.data
    selectionInPixels = []

    #   ( b )
    selectionIndex = 0
    colorOfDatum = []
    while selectionIndex < selectionsData.length
      colorOfDatum.push selectionsData[selectionIndex]
      if selectionIndex % 4 is 3
        selectionInPixels.push colorOfDatum
        colorOfDatum = []
      selectionIndex++

    #   ( c )
    flippedSelection = []
    rowIndex = 0
    while rowIndex < (selectionInPixels.length // selectionsWidth)
      thisRow = (selectionInPixels.length // selectionsWidth) - rowIndex - 1
      rowAt = thisRow * selectionsWidth
      columnIndex = 0
      while columnIndex < selectionsWidth
        flippedSelection.push selectionInPixels[rowAt + columnIndex]
        columnIndex++
      rowIndex++

    #   ( d )
    pixelIndex = 0
    while pixelIndex < flippedSelection.length
      colorIndex = 0
      while colorIndex < 4
        datumIndex = pixelIndex * 4
        selection.data[datumIndex + colorIndex] = 
          flippedSelection[pixelIndex][colorIndex]
        colorIndex++
      pixelIndex++

    #   ( e )
    canvasDataAsImage = new Image()
    canvasDataAsImage.onload = ->
      ctContext.drawImage(canvasDataAsImage,0,0)
      ctContext.putImageData(selection, selectionX, selectionY)
      rightEdge = selectionX + selectionsWidth - 1
      bottomEdge = selectionY + selectionsHeight - 1
      drawSelectBox(ctContext, selectionX, selectionY, rightEdge, bottomEdge)
    canvasDataAsImage.src = canvasHoldover

    tH.pop()
    drawToolbars()
    $('#menuDiv').css('top',(window.innerHeight).toString())
    normalCircumstance = true
    menuUp = false
  #   ( D )
  else
    #   ( a )
    tWidth = ctContext.canvas.width
    tHeight = ctContext.canvas.height
    canvasAsWeFoundIt = ctContext.getImageData(0, 0, tWidth, tHeight)
    canvasData = canvasAsWeFoundIt.data
    canvasInPixels = []

    #   ( b )
    canvasIndex = 0
    colorAtDatum = []
    while canvasIndex < canvasData.length
      colorAtDatum.push canvasData[canvasIndex]
      if canvasIndex % 4 is 3
        canvasInPixels.push colorAtDatum
        colorAtDatum = []
      canvasIndex++

    #   ( c )
    flippedCanvas = []
    rowIndex = 0
    while rowIndex < (canvasInPixels.length // tWidth)
      thisRow = (canvasInPixels.length // tWidth) - rowIndex - 1
      rowAt = thisRow * tWidth
      columnIndex = 0
      while columnIndex < tWidth
        flippedCanvas.push canvasInPixels[rowAt + columnIndex]
        columnIndex++
      rowIndex++

    #   ( d )
    pixelIndex = 0
    while pixelIndex < canvasInPixels.length
      colorIndex = 0
      while colorIndex < 4
        datumIndex = pixelIndex * 4
        canvasAsWeFoundIt.data[datumIndex + colorIndex] = 
          flippedCanvas[pixelIndex][colorIndex]
        colorIndex++
      pixelIndex++

    #   ( e )
    ctContext.putImageData(canvasAsWeFoundIt, 0, 0)
    flipFinishUp()

flipFinishUp = () ->
  cH.push ctCanvas.toDataURL()
  cH.shift()
  cF = []
  tH.pop()
  drawToolbars()
  $('#menuDiv').css('top',(window.innerHeight).toString())
  normalCircumstance = true
  menuUp = false

flipDataSorting = ( inputMaterial, eventIsKeyDown ) ->
  if inputMaterial isnt undefined
    acceptableKeys = ['x','y','n']
    if inputMaterial in acceptableKeys
      if not eventIsKeyDown
        switch inputMaterial
          when 'x' then xFlip() #   ( A )
          when 'y' then yFlip() #   ( C )
          when 'n' 
            tH.pop()
            drawToolbars()
            $('#menuDiv').css('top',(window.innerHeight).toString())
            normalCircumstance = true
            menuUp = false
      else
        switch inputMaterial
          when 'x' then menuContext.drawImage(xLitUp, tH[tH.length - 1].menuImage.width - 139, 5)
          when 'y' then menuContext.drawImage(yLitUp, tH[tH.length - 1].menuImage.width - 114, 5)
          when 'n' then menuContext.drawImage(cancelLitUp, tH[tH.length - 1].menuImage.width - 89, 5)

flipMouseListening = ( coordinates, eventIsMouseDown ) ->
  #Check if mouse event was in X button region
  notTooFarLeft = (tH[tH.length - 1].menuImage.width - 139) < coordinates[0]
  notTooFarRight = coordinates[0] < ((tH[tH.length - 1].menuImage.width - 139) + xLitUp.width)
  withinXBoundaries = notTooFarLeft and notTooFarRight
  notTooHigh = 5 < coordinates[1]
  notTooLow = coordinates[1] < (5 + xLitUp.height)
  withinYBoundaries = notTooHigh and notTooLow
  if withinXBoundaries and withinYBoundaries
    if eventIsMouseDown
      menuContext.drawImage(yLitUp, tH[tH.length - 1].menuImage.width - 139, 5)
    else
      xFlip()

  #Check if mouse event was in Y button region
  notTooFarLeft = (tH[tH.length - 1].menuImage.width - 114) < coordinates[0]
  notTooFarRight = coordinates[0] < ((tH[tH.length - 1].menuImage.width - 114) + yLitUp.width)
  withinXBoundaries = notTooFarLeft and notTooFarRight
  notTooHigh = 5 < coordinates[1]
  notTooLow = coordinates[1] < (5 + yLitUp.height)
  withinYBoundaries = notTooHigh and notTooLow
  if withinXBoundaries and withinYBoundaries
    if eventIsMouseDown
      menuContext.drawImage(yLitUp, tH[tH.length - 1].menuImage.width - 114, 5)
    else
      yFlip()

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
      drawToolbars()
      $('#menuDiv').css('top',(window.innerHeight).toString())
      normalCircumstance = true
      menuUp = false

