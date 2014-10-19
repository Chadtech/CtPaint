###
  These are the functions relevant to flipping images, whether that
  image be the canvas itself, or a selection of the canvas. 
###
scaleAction = () ->
  menuUp = true
  normalCircumstance = false
  $('#menuDiv').css('top', (window.innerHeight - toolbarHeight - 45).toString())
  $('#menuDiv').css('left', (toolbarWidth + 10).toString())

  tH.push ctPaintTools[ toolsToNumbers['scale'] ]

  menuContext.canvas.width = tH[tH.length - 1].menuImage.width
  menuContext.canvas.height = tH[tH.length - 1].menuImage.height

  menuContext.drawImage(tH[tH.length - 1].menuImage, 0, 0)
  drawToolbars()

  scaleDataSortingInitialize()
  whatSortOfDataSorting = scaleDataSorting
  whatSortOfMouseListening = scaleMouseListening

scaleDataSortingInitialize = () ->
  menuDatum = zeroPadder(100, 3) + zeroPadder(100, 3)
  spotInMenuDatum = 0
  drawScaleMenu()

scaleDataSorting = ( inputMaterial, eventIsKeyDown ) ->
  coverUpOldCursor()
  if inputMaterial isnt undefined
    keysThatDontAddData = ['backspace', 'left', 'right', 'enter', 'n']
    if not eventIsKeyDown
      if not (inputMaterial in keysThatDontAddData)
        if not isNaN(inputMaterial)
          menuDatum = replaceAt(menuDatum, inputMaterial, spotInMenuDatum )
          if spotInMenuDatum < 5
            spotInMenuDatum++
      else
        switch inputMaterial
          when 'backspace'
            menuDatum = replaceAt(menuDatum, '0', spotInMenuDatum)
            if 0 < spotInMenuDatum
              spotInMenuDatum--
          when 'left'
            if 0 < spotInMenuDatum
              spotInMenuDatum--
          when 'right'
            if spotInMenuDatum < 5
              spotInMenuDatum++
          when 'enter'
            scale()
          when 'n'
            scaleFinishUp()

      drawScaleMenu()
    else
      switch inputMaterial
        when 'enter' then menuContext.drawImage(enterLitUp, tH[tH.length - 1].menuImage.width - 162, 5)
        when 'n' then menuContext.drawImage(cancelLitUp, tH[tH.length - 1].menuImage.width - 89, 5)
  updateOldCursor()

scale = ->
  # Convert the string datum into the width and height factor components
  widthFactor = parseInt(menuDatum[0])
  widthFactor += ( parseInt( menuDatum[1] + menuDatum[2] ) / 100 )

  heightFactor = parseInt( menuDatum[3] )
  heightFactor += ( parseInt( menuDatum[4] + menuDatum[5] ) / 100 )

  if not areaSelected

    # Get the canvass data
    cWidth = ctContext.canvas.width
    cHeight = ctContext.canvas.height
    canvasToScale = ctContext.getImageData(0, 0, cWidth, cHeight)
    canvassData = canvasToScale.data

    # Turn the data into pixels
    datumIndex = 0
    singlePixel = []
    canvasAsPixels = []
    while datumIndex < canvassData.length
      singlePixel.push canvassData[datumIndex]
      if singlePixel.length is 4
        canvasAsPixels.push singlePixel
        singlePixel = []
      datumIndex++

    # Create a new array of data that is the size of the scaledCanvas
    scaledWidth = Math.floor( widthFactor * canvasToScale.width )
    scaledHeight = Math.floor( heightFactor * canvasToScale.height )
    scaledCanvas = []
    zeroToAdd = 0
    while zeroToAdd < (scaledWidth * scaledHeight)
      scaledCanvas.push 0
      zeroToAdd++

    # Fill the scaled-canvas with the canvas's pixels
    inverseWidthFactor = 1 / widthFactor
    inverseHeightFactor = 1 / heightFactor
    rowIndex = 0
    while rowIndex < scaledHeight
      columnIndex = 0
      while columnIndex < scaledWidth
        pointX = Math.floor(columnIndex * inverseWidthFactor)
        pointY = Math.floor(rowIndex * inverseHeightFactor)
        pixelInScaledCanvas = (rowIndex * scaledWidth) + columnIndex
        pixelInCanvas = (pointY * cWidth) + pointX
        scaledCanvas[pixelInScaledCanvas] = canvasAsPixels[pixelInCanvas]
        columnIndex++
      rowIndex++

    # Resize the canvas to reflect its scaled size
    newWidth = scaledWidth
    newHeight = scaledHeight
    ctContext.canvas.width = parseInt(newWidth)
    ctContext.canvas.height = parseInt(newHeight)
    canvasWidth = ctContext.canvas.width
    canvasHeight = ctContext.canvas.height
    ctCanvas.style.width = (canvasWidth).toString()+'px'
    ctCanvas.style.height = (canvasHeight).toString()+'px'

    # Turn the scaled canvass pixels into data
    scaledCanvasAsData = ctContext.getImageData( 0, 0, scaledWidth, scaledHeight)
    pixelIndex = 0
    while pixelIndex < scaledCanvas.length
      colorIndex = 0
      while colorIndex < 4
        datumIndex = ( pixelIndex * 4 ) + colorIndex
        scaledCanvasAsData.data[datumIndex] = scaledCanvas[pixelIndex][colorIndex]
        colorIndex++
      pixelIndex++

    ctContext.putImageData(scaledCanvasAsData, 0, 0)
    scaleFinishUp()
    historyUpdate()

  else
    # Get selections data
    cWidth = selectionsWidth
    cHeight = selectionsHeight
    selectionsData = selection.data

    # Turn the data into pixels
    datumIndex = 0
    singlePixel = []
    selectionAsPixels = []
    while datumIndex < selectionsData.length
      singlePixel.push selectionsData[datumIndex]
      if singlePixel.length is 4
        selectionAsPixels.push singlePixel
        singlePixel = []
      datumIndex++

    # Create a new array of data that is the size of scaledSelection
    scaledWidth = Math.floor( widthFactor * selectionsWidth )
    scaledHeight = Math.floor( heightFactor * selectionsHeight )
    scaledSelection = []
    zeroToAdd = 0
    while zeroToAdd < (scaledWidth * scaledHeight)
      scaledSelection.push 0
      zeroToAdd++

    # Fill scaledSelection with the selections's pixels
    inverseWidthFactor = 1 / widthFactor
    inverseHeightFactor = 1 / heightFactor
    rowIndex = 0
    while rowIndex < scaledHeight
      columnIndex = 0
      while columnIndex < scaledWidth
        pointX = Math.floor(columnIndex * inverseWidthFactor)
        pointY = Math.floor(rowIndex * inverseHeightFactor)
        pixelInScaledCanvas = (rowIndex * scaledWidth) + columnIndex
        pixelInCanvas = (pointY * cWidth) + pointX
        scaledSelection[pixelInScaledCanvas] = selectionAsPixels[pixelInCanvas]
        columnIndex++
      rowIndex++

    newSelection = document.createElement('canvas')
    newSelection = newSelection.getContext('2d')
    newSelection = newSelection.createImageData(scaledWidth, scaledHeight)

    pixelIndex = 0
    while pixelIndex < scaledSelection.length
      colorIndex = 0
      while colorIndex < 4
        datumIndex = ( pixelIndex * 4 ) + colorIndex
        newSelection.data[datumIndex] = scaledSelection[pixelIndex][colorIndex]
        colorIndex++
      pixelIndex++

    selection = newSelection
    selectionImage = new Image()
    selectionImage.src = imageDataToURL(selection)
    selectionsWidth = scaledWidth
    selectionsHeight = scaledHeight

    canvasDataAsImage = new Image()
    canvasDataAsImage.onload = ->
      ctContext.drawImage(canvasDataAsImage,0,0)
      #ctContext.putImageData(selection, selectionX, selectionY)
      ctContext.drawImage(selectionImage, selectionX, selectionY)
      rightEdge = selectionX + selectionsWidth
      bottomEdge = selectionY + selectionsHeight
      drawSelectBox(ctContext, selectionX - 1, selectionY - 1, rightEdge, bottomEdge)
    canvasDataAsImage.src = canvasHoldover

    scaleFinishUp()

scaleFinishUp = ->
  $('#menuDiv').css('top',(window.innerHeight).toString())
  normalCircumstance = true
  menuUp = false
  tH.pop()
  drawToolbars()

scaleMouseListening = ( coordinates, eventIsMouseDown ) ->
  #Check if mouse event was in enter button region
  notTooFarLeft = (tH[tH.length - 1].menuImage.width - 162) < coordinates[0]
  notTooFarRight = coordinates[0] < ((tH[tH.length - 1].menuImage.width - 162) + enterLitUp.width)
  withinXBoundaries = notTooFarLeft and notTooFarRight
  notTooHigh = 5 < coordinates[1]
  notTooLow = coordinates[1] < (5 + enterLitUp.height)
  withinYBoundaries = notTooHigh and notTooLow
  if withinXBoundaries and withinYBoundaries
    if eventIsMouseDown
      menuContext.drawImage(enterLitUp, tH[tH.length - 1].menuImage.width - 162, 5)
      scale()
    else
      scaleFinishUp()

  #Check if mouse event was in cancel button region
  notTooFarLeft = (tH[tH.length - 1].menuImage.width - 89) < coordinates[0]
  notTooFarRight = coordinates[0] < ((tH[tH.length - 1].menuImage.width- 89) + cancelLitUp.width)
  withinXBoundaries = notTooFarLeft and notTooFarRight
  notTooHigh = 5 < coordinates[1]
  notTooLow = coordinates[1] < (5 + cancelLitUp.height)
  withinYBoundaries = notTooHigh and notTooLow
  if withinXBoundaries and withinYBoundaries
    if eventIsMouseDown
      menuContext.drawImage(cancelLitUp, tH[tH.length - 1].menuImage.width - 89, 5)
    else
      scaleFinishUp()

drawScaleMenu = () ->
  drawStringAsCommandPrompt( menuContext, menuDatum.substr(0, 3), 1, 103, 10 )
  drawStringAsCommandPrompt( menuContext, menuDatum.substr(3, 3), 1, 191, 10 )
  xPos = 103 + ((spotInMenuDatum // 3) * 88) + ( 12 * ( spotInMenuDatum %% 3 ) )
  drawStringAsCommandPrompt( menuContext, menuDatum[spotInMenuDatum], 2, xPos, 10 )
