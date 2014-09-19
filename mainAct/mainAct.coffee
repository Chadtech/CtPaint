$(document).ready ()->
  setTimeout( ()->
    #ctContext.imageSmoothingEnabled = false
    setCanvasSizes()
    prepareCanvas()
    placeToolbars()
    selectedTool = ctPaintTools[7]
    previouslySelectedTool = ctPaintTools[7]
    drawToolbars()
    positionMenu()
    canvasAsData = ctCanvas.toDataURL()
  , 2000)

  $('body').keydown (event) ->
    if normalCircumstance
      keyListeningUnderNormalCircumstance(event)
    else
      whatSortOfDataSorting( keyListeningUnderAbnormalCircumstance(event) )
    if event.keyCode == keysToKeyCodes['up']
      if canvasHeight > (window.innerHeight - toolbarHeight - 5)
        if canvasYOffset < 0 
          canvasYOffset+=3
          positionCanvas()
          positionCorners()
    if event.keyCode == keysToKeyCodes['down']
      if canvasHeight > (window.innerHeight - toolbarHeight - 5)
        if (-1 * canvasYOffset) < ((canvasHeight + 10) - (window.innerHeight - toolbarHeight))
          canvasYOffset-=3
          positionCanvas()
          positionCorners()
    if event.keyCode == keysToKeyCodes['alt']
      toolViewMode++
      toolViewMode = toolViewMode%2
      drawToolbars()
    if event.keyCode == keysToKeyCodes['space']
      if selectedTool.mode
        selectedTool.mode = false
      else
        selectedTool.mode = true
    if event.keyCode == keysToKeyCodes['equals']
      if selectedTool.magnitude < selectedTool.maxMagnitude
        selectedTool.magnitude++
        drawInformationToolbar0()
    if event.keyCode == keysToKeyCodes['minus']
      if selectedTool.magnitude > 1
        selectedTool.magnitude--
        drawInformationToolbar0()
    if event.keyCode == keysToKeyCodes['shift']
      colorModify = true

  $('body').keyup (event) ->
    if event.keyCode == keysToKeyCodes['shift']
      colorModify = false

  $(window).resize ()->
    if canvasWidth < (window.innerWidth - toolbarWidth - 5)
      canvasXOffset = 0
    if canvasHeight < (window.innerHeight - toolbarHeight - 5)
      canvasYOffset = 0
    if menuUp
      $('#menuDiv').css('top', (window.innerHeight - toolbarHeight - 45).toString())
      $('#menuDiv').css('left', (toolbarWidth + 10).toString())
    else
      $('#menuDiv').css('top', (window.innerHeight).toString())
    positionCanvas()
    positionCorners()
    setCanvasSizes()
    placeToolbars()
    drawToolbars()

  $(window).scroll ()->
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
        canvasAsData = ctCanvas.toDataURL()
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
        canvasAsData = ctCanvas.toDataURL()
        canvasDataAsImage = new Image()
        canvasDataAsImage.src = canvasAsData
      canvasDataAsImage.src = canvasAsData
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
      $('#wholeWindow').css 'cursor', 'default'   

  $('#CtPaint').mouseleave ()->  
    toolbar1Context.drawImage(toolbar1sImage1,188,3)   

  $('#CtPaint').mousemove (event)->
    selectedTool.posture[0]()

  $('#CtPaint').mousedown (event)->
    selectedTool.posture[1]()

  $('#CtPaint').mouseup (event)->
    selectedTool.posture[2]()
  
  $('#toolbar0').mousedown (event)->
    toolIndex = 0
    while toolIndex < numberOfTools
      if ctPaintTools[toolIndex].clickRegion[0]<event.clientX and event.clientX<(ctPaintTools[toolIndex].clickRegion[0]+buttonWidth)
        if ctPaintTools[toolIndex].clickRegion[1]<event.clientY and event.clientY<(ctPaintTools[toolIndex].clickRegion[1]+buttonHeight)
          if toolIndex < 8 
            previouslySelectedTool = selectedTool
            selectedTool = ctPaintTools[toolIndex]
          else
            ctPaintTools[toolIndex].toolsAction()
      toolIndex++
    drawToolbars()

  $('#toolbar1').mousemove (event)->
    drawStringAsCommandPrompt(toolbar1Context, getColorValue(toolbar1Context, event.clientX, event.clientY - window.innerHeight + toolbarHeight).toUpperCase() + ', (#,#) ', 0, 191, 12)

  $('#toolbar1').mouseleave ()->  
    toolbar1Context.drawImage(toolbar1sImage1,188,3)  

  $('#toolbar1').mousedown (event)->
    toolbar1X = event.clientX
    toolbar1Y = event.clientY - (window.innerHeight - toolbarHeight)
    if 52 < toolbar1X and toolbar1X < 188
      if 4 < toolbar1Y and toolbar1Y < 35
        if colorModify
          spotInColorPallete = (((toolbar1X - 52 ) // 17) * 2) + ((toolbar1Y - 4) // 16)
          colorMenu()
        else
          colorSwatches[0] = colorPallete[(((toolbar1X - 52 ) // 17) * 2) + ((toolbar1Y - 4) // 16)]
        drawToolbars()