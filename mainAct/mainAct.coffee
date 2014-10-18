$(document).ready (event)->
  setTimeout( (event)->
    setCanvasSizes()
    prepareCanvas()
    placeToolbars()
    tH.push ctPaintTools[toolsToNumbers['point']]
    tH.shift()
    tH.push ctPaintTools[toolsToNumbers['point']]
    tH.shift()
    drawToolbars()
    positionMenu()
    clearOutCanvasHistoryIndex = 0
    while clearOutCanvasHistoryIndex < 10
      cH.push ctCanvas.toDataURL()
      cH.shift()
      clearOutCanvasHistoryIndex++
  , 2000)

  $('body').keydown (event) ->
    event.preventDefault()
    if normalCircumstance
      keyListeningUnderNormalCircumstance[0](event)
    else
      whatSortOfDataSorting( keyListeningUnderAbnormalCircumstance[0](event), true )

    if event.keyCode is keysToKeyCodes['alt']
      toolViewMode++
      toolViewMode = toolViewMode%2
      drawToolbars()

    if event.keyCode is keysToKeyCodes['single quote']
      #makeTransparent()
      modeChangeAction()

    if event.keyCode is keysToKeyCodes['equals'] or event.keyCode is 61
      if zoomActivate
        currentMagnitude = ctPaintTools[toolsToNumbers['zoom']].magnitude
        maximumMagnitudeForZoom = ctPaintTools[toolsToNumbers['zoom']].maxMagnitude
        if currentMagnitude < maximumMagnitudeForZoom

          # Unzoom
          zoomAction()

          # set zoom for a little bit more
          ctPaintTools[toolsToNumbers['zoom']].magnitude++

          # Zoom back in
          if casualX isnt undefined and casualY isnt undefined
            zoomAction(casualX, casualY)
      else
        zoomAction(canvasXOffset, canvasYOffset)

    if event.keyCode is keysToKeyCodes['minus'] or event.keyCode is 173
      if zoomActivate
        if ctPaintTools[toolsToNumbers['zoom']].magnitude is 1

          # Unzoom
          zoomAction()

        else
          # Invent a hypothetical click location that is right in the middle
          # of the currently presented canvas region
          pseudoXSpot = undefined
          if (window.innerWidth - toolbarWidth) < (canvasWidth * zoomFactor)
            pseudoXSpot = window.innerWidth - toolbarWidth
            pseudoXSpot /= 2
            pseudoXSpot //= zoomFactor
            pseudoXSpot += zoomRootX
          else
            pseudoXSpot = canvasWidth // 2

          pseudoYSpot = undefined
          if window.innerHeight < ( canvasHeight * zoomFactor)
            pseudoYSpot = window.innerHeight
            pseudoYSpot /= 2
            pseudoYSpot //= zoomFactor
            pseudoYSpot += zoomRootY
          else
            pseudoYSpot = canvasHeight // 2

          # Unzoom
          zoomAction()

          # set zoom a little less
          ctPaintTools[toolsToNumbers['zoom']].magnitude--

          # Zoom back in
          zoomAction(pseudoXSpot, pseudoYSpot)


    if event.keyCode is keysToKeyCodes['left bracket']
      magnitudeDownAction()

    if event.keyCode is keysToKeyCodes['right bracket']
      magnitudeUpAction()

    if event.keyCode is keysToKeyCodes['shift']
      colorModify = true

    if event.keyCode is keysToKeyCodes['tab']
      swatchColorPicked = true

  $('body').keyup (event) ->
    event.preventDefault()
    if normalCircumstance
      keyListeningUnderNormalCircumstance[1](event)
    else
      whatSortOfDataSorting( keyListeningUnderAbnormalCircumstance[1](event), false)

    if event.keyCode is keysToKeyCodes['shift']
      colorModify = false

    if event.keyCode is keysToKeyCodes['tab']
      swatchColorPicked = false

  $('#menuDiv').mousedown (event) ->
    whatSortOfMouseListening( mouseListeningUnderAbnormalCircumstance[0]( event ), true)

  $('#menuDiv').mouseup (event) ->
    whatSortOfMouseListening( mouseListeningUnderAbnormalCircumstance[1]( event ), false)

  $(window).resize (event)->
    if canvasWidth < (window.innerWidth - toolbarWidth - 5)
      canvasXOffset = 0
    if canvasHeight < (window.innerHeight - toolbarHeight - 5)
      canvasYOffset = 0
    if menuUp
      $('#menuDiv').css('top', (window.innerHeight - toolbarHeight - 45).toString())
      $('#menuDiv').css('left', (toolbarWidth + 10).toString())
    else
      $('#menuDiv').css('top', (window.innerHeight).toString())
    #$('#wayWideDiv').css('left', (window.innerWidth + 100).toString())
    positionCanvas()
    setCanvasSizes()
    placeToolbars()
    drawToolbars()

  $(window).scroll (event)->
    window.scroll(0,0)

  window.onmousemove = () ->
    rightBoundary = (canvasWidth + 5 + toolbarWidth + 20)
    leftBoundary = (canvasWidth + 5 + toolbarWidth)
    if (event.clientX < rightBoundary) and (leftBoundary < event.clientX)
      if (event.clientY < (canvasHeight + 5 + 20)) and ((canvasHeight + 5) < event.clientY)
        $('#wholeWindow').css 'cursor', 'se-resize'
    else
      $('#wholeWindow').css 'cursor', 'default'

  window.onmousedown = (event)->
    rightBoundary = (canvasWidth + 5 + toolbarWidth + 20)
    leftBoundary = (canvasWidth + 5 + toolbarWidth)
    if (event.clientX < rightBoundary) and (leftBoundary < event.clientX)
      if (event.clientY < (canvasHeight + 5 + 20)) and ((canvasHeight + 5) < event.clientY)
        copeWithSelection()
        cH.push ctCanvas.toDataURL()
        cH.shift()
        cF = []
        oldX = event.clientX
        oldY = event.clientY
        draggingBorder = true

  window.onmouseup = (event) ->
    if draggingBorder
      draggingBorder = false
      ctContext.canvas.width = event.clientX - oldX + canvasWidth
      ctContext.canvas.height = event.clientY - oldY + canvasHeight
      canvasDataAsImage = new Image()
      canvasDataAsImage.onload = ->
        ctContext.drawImage(canvasDataAsImage,0,0)
        cH.push ctCanvas.toDataURL()
        cH.shift()
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
      $('#wholeWindow').css 'cursor', 'default'   

  $('#CtPaint').mousemove (event)->
    tH[tH.length - 1].posture[0](event)

  $('#CtPaint').mousedown (event)->
    tH[tH.length - 1].posture[1](event)

  $('#CtPaint').mouseup (event)->
    tH[tH.length - 1].posture[2](event)

  $('#CtPaint').mouseleave (event)->
    coverUpOldCursor() 
    tH[tH.length - 1].posture[3](event) 
    toolbar1Context.drawImage(toolbar1sImage1, toolbar1sImage0.width + 5, 3)

  $('#toolbar0').mousedown (event)->
    toolIndex = 0
    while toolIndex < toolNames.length
      leftBoundary = ctPaintTools[toolIndex].clickRegion[0] < event.clientX
      rightBoundary = event.clientX < (ctPaintTools[toolIndex].clickRegion[0] + buttonWidth)
      if leftBoundary and rightBoundary
        topBoundary = ctPaintTools[toolIndex].clickRegion[1] < event.clientY 
        bottomBoundary = event.clientY < (ctPaintTools[toolIndex].clickRegion[1] + buttonHeight)
        if topBoundary and bottomBoundary
          if toolIndex < 8
            copeWithSelection()
            tH.push ctPaintTools[toolIndex]
            tH.shift()
          else
            ctPaintTools[toolIndex].toolsAction()
      toolIndex++
    drawToolbars()

  $('#toolbar1').mousemove (event)->
    tXSpot = event.clientX
    tYSpot = event.clientY - window.innerHeight + toolbarHeight
    information = getColorValue(toolbar1Context, tXSpot, tYSpot).toUpperCase() + ', (#,#) '
    drawStringAsCommandPrompt(toolbar1Context, information, 0, toolbar1sImage0.width + 7, 12)

  $('#toolbar1').mouseleave (event)->  
    toolbar1Context.drawImage(toolbar1sImage1, toolbar1sImage0.width + 5, 3)

  $('#toolbar1').mousedown (event) ->
    toolbar1X = event.clientX
    toolbar1Y = event.clientY - (window.innerHeight - toolbarHeight)
    notTooFarLeft =  7 < toolbar1X 
    notTooFarRight = toolbar1X < 21
    withinXBoundaries = notTooFarLeft and notTooFarRight
    notTooHigh = 4 < toolbar1Y
    notTooLow = toolbar1Y < 25
    withinYBoundaries = notTooHigh and notTooLow
    if withinXBoundaries and withinYBoundaries
      swatchColorPicked = true

  $('#toolbar1').mouseup (event)->
    toolbar1X = event.clientX
    toolbar1Y = event.clientY - (window.innerHeight - toolbarHeight)
    if not swatchColorPicked
      if 52 < toolbar1X and toolbar1X < toolbar1sImage0.width
        if 4 < toolbar1Y and toolbar1Y < 35
          if colorModify
            spotInColorPalette = (((toolbar1X - 52 ) // 17) * 2) + ((toolbar1Y - 4) // 16)
            colorMenu()
          else
            colorSwatches[0] = colorPalette[(((toolbar1X - 52 ) // 17) * 2) + ((toolbar1Y - 4) // 16)]
          drawToolbars()
    else
      if 52 < toolbar1X and toolbar1X < toolbar1sImage0.width
        if 4 < toolbar1Y and toolbar1Y < 35
          spotInColorPalette = (((toolbar1X - 52 ) // 17) * 2) + ((toolbar1Y - 4) // 16)
          colorPalette[spotInColorPalette] = colorSwatches[0]
          swatchColorPicked = false
          drawToolbars()

  $('#dragAndDrop').on('dragenter', (event)->
    event.stopPropagation()
    event.preventDefault()
    return false
  )

  $('#dragAndDrop').on('dragover', (event)->
    event.stopPropagation()
    return false
  )

  $('#dragAndDrop').on('drop', (event)->
    event.stopPropagation()
    event.preventDefault()
    filesType = event.originalEvent.dataTransfer.files[0].type.substr(0,5)
    if filesType is 'image'
      imageLoaded = new FileReader()
      theFile = event.originalEvent.dataTransfer.files[0]
      imageLoaded.onload = ->
        imageToOpen = new Image()
        imageToOpen.onload = ->
          widthExceedsCanvas = canvasWidth < imageToOpen.width
          heightExceedsCanvas = canvasHeight < imageToOpen.height
          if not widthExceedsCanvas and not heightExceedsCanvas
            ctContext.drawImage(imageToOpen, 0, 0)
            copyMemory = ctContext.getImageData(0, 0, imageToOpen.width, imageToOpen.height)
            canvasDataAsImage = new Image()
            canvasDataAsImage.onload = ->
              ctContext.drawImage(canvasDataAsImage, 0, 0)
              canvasHoldover = ctCanvas.toDataURL()
              copyExists = true
              pasteAction()
            canvasDataAsImage.src = cH[cH.length - 1]
          else
            newWidth = imageToOpen.width
            newHeight = imageToOpen.height
            ctContext.canvas.width = parseInt(newWidth)
            ctContext.canvas.height = parseInt(newHeight)
            canvasWidth = ctContext.canvas.width
            canvasHeight = ctContext.canvas.height
            ctCanvas.style.width = (canvasWidth).toString()+'px'
            ctCanvas.style.height = (canvasHeight).toString()+'px'
            ctContext.drawImage(imageToOpen, 0, 0)
            cH.push ctCanvas.toDataURL()
            cH.shift()
        imageToOpen.src = imageLoaded.result
      imageLoaded.readAsDataURL(theFile)
    return false
  )

        