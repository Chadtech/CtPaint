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
    toolbar1Context.drawImage(toolbar1sImage1,188,3)   
    drawInformationToolbar0()
    drawInformationToolbar1()
    if not areaSelected
      switch selectedTool.name
        when 'select'
          if mousePressed
            if not areaSelected
              getMousePositionOnCanvas(event)
              canvasDataAsImage = new Image()
              canvasDataAsImage.onload = ->
                ctContext.drawImage(canvasDataAsImage,0,0)
                selectedTool.toolsAction(ctContext, oldX, oldY, xSpot, ySpot)
              canvasDataAsImage.src = canvasAsData
            else

        when 'square'
          if mousePressed
            getMousePositionOnCanvas(event)
            canvasDataAsImage = new Image()
            canvasDataAsImage.onload = ->
              ctContext.drawImage(canvasDataAsImage,0,0)
              selectedTool.toolsAction(ctContext, colorSwatches[0], oldX, oldY, xSpot, ySpot)
            canvasDataAsImage.src = canvasAsData
        when 'circle'
          if mousePressed
            getMousePositionOnCanvas(event)
            canvasDataAsImage = new Image()
            canvasDataAsImage.onload = ->
              ctContext.drawImage(canvasDataAsImage,0,0)
              selectedTool.toolsAction(ctContext, colorSwatches[0], xSpot, ySpot)
            canvasDataAsImage.src = canvasAsData
        when 'line'
          if mousePressed
            getMousePositionOnCanvas(event)
            canvasDataAsImage = new Image()
            canvasDataAsImage.onload = ->
              ctContext.drawImage(canvasDataAsImage,0,0)
              selectedTool.toolsAction(ctContext, colorSwatches[0], oldX, oldY, xSpot, ySpot)
            canvasDataAsImage.src = canvasAsData
        when 'point'
          if mousePressed
            oldX = xSpot
            oldY = ySpot
            getMousePositionOnCanvas(event)
            selectedTool.toolsAction(ctContext, colorSwatches[0], xSpot, ySpot, oldX, oldY)
    else
      getMousePositionOnCanvas(event)
      areaXOffset = xSpot - areaOldX
      areaYOffset = ySpot - areaOldY
      canvasDataAsImage = new Image()
      canvasDataAsImage.onload = ->
        ctContext.drawImage(canvasDataAsImage,0,0)
        console.log 'C', selectionToPaste
        ctContext.putImageData(selectionToPaste, oldX + 1 + areaXOffset, oldY + 1 + areaYOffset)
      canvasDataAsImage.src = canvasAsData
      #selectedTool.toolsAction(ctContext, oldX, oldY, xSpot, ySpot)


  $('#CtPaint').mousedown (event)->
    mousePressed = true
    getMousePositionOnCanvas(event)
    if not areaSelected
      switch selectedTool.name
        when 'zoom'
          selectedTool.toolsAction()
        when 'select'
          oldX = xSpot
          oldY = ySpot
        when 'fill'
          selectedTool.toolsAction(ctCanvas, ctContext, colorSwatches[0], xSpot, ySpot)
        when 'circle'
          oldX = xSpot
          oldY = ySpot
        when 'square'
          oldX = xSpot
          oldY = ySpot
        when 'line'
          oldX = xSpot
          oldY = ySpot
        when 'point'
          selectedTool.toolsAction(ctContext, colorSwatches[0], xSpot, ySpot, xSpot, ySpot)
    else
      #console.log 'A', areasXSpot < xSpot, xSpot < (areasXSpot + areaSelectedsWidth)
      #console.log 'A.1', areasXSpot, areaSelectedsWidth, areasXSpot + areaSelectedsWidth
      if areasXSpot < xSpot and xSpot < (areasXSpot + areaSelectedsWidth) and areasYSpot < ySpot and ySpot < (areasYSpot + areaSelectedsHeight)
        areaOldX = xSpot
        areaOldY = xSpot
      else
        canvasDataAsImage = new Image()
        canvasDataAsImage.onload = ->
          ctContext.drawImage(canvasDataAsImage,0,0)
          console.log 'C', selectionToPaste
          ctContext.putImageData(selectionToPaste, oldX + 1, oldY + 1)
          canvasAsData = ctCanvas.toDataURL()
        canvasDataAsImage.src = canvasAsData
        areaSelected = false
        justUp = true


  $('#CtPaint').mouseup (event)->
    mousePressed = false
    switch selectedTool.name
      when 'select'
        if not areaSelected
          if not justUp
            getMousePositionOnCanvas(event)
            areaSelected = true
            areasXSpot = oldX
            areasYSpot = oldY
            areaSelectedsHeight = Math.abs(oldY - ySpot)
            areaSelectedsWidth = Math.abs(oldX - xSpot)
            selection = ctContext.getImageData(oldX + 1, oldY + 1, Math.abs((oldX + 1) - xSpot), Math.abs((oldY + 1) - ySpot))
            selectionToPaste = document.createElement('canvas').getContext('2d').createImageData(selection.width, selection.height)
            datumIndex = 0
            while datumIndex < selection.data.length
              selectionToPaste.data[datumIndex] = selection.data[datumIndex]
              datumIndex++
            #squareAction = (canvas, color, beginX, beginY, endX, endY)
            canvasDataAsImage = new Image()
            canvasDataAsImage.onload = ->
              ctContext.drawImage(canvasDataAsImage,0,0)
              squareAction(ctContext, colorSwatches[1], oldX + 1, oldY + 1, xSpot - 1, ySpot - 1, true)
              canvasAsData = ctCanvas.toDataURL()
              ctContext.putImageData(selectionToPaste, oldX + 1, oldY + 1)
              selectedTool.toolsAction(ctContext, oldX, oldY, xSpot, ySpot)
            canvasDataAsImage.src = canvasAsData
          else
            justUp = false

          #ctContext.putImageData(selectionToPaste, oldX + 1, oldY + 1 )
          #drawSelectBox(ctContext, oldX, oldY, xSpot, ySpot)
        #else
          #squareAction(ctContext, colorSwatches[2], oldX + 1, oldY + 1, xSpot - 1, ySpot - 1, true)
          #ctContext.putImageData(selectionToPaste, oldX + 1 + areaXOffset, oldY + 1 + areaYOffset)


      when 'fill'
        canvasAsData = ctCanvas.toDataURL()
      when 'square'
        canvasAsData = ctCanvas.toDataURL()
      when 'circle'
        canvasAsData = ctCanvas.toDataURL()
      when 'line'
        canvasAsData = ctCanvas.toDataURL()
      when 'point'
        canvasAsData = ctCanvas.toDataURL()

  $('#zoomWindow').mousedown (event)->
    mousePressed = true
    switch selectedTool.name
      when 'zoom'
        selectedTool.toolsAction()

  $('#toolbar0').mousedown (event)->
    toolIndex = 0
    while toolIndex < numberOfTools
      if ctPaintTools[toolIndex].clickRegion[0]<event.clientX and event.clientX<(ctPaintTools[toolIndex].clickRegion[0]+buttonWidth)
        if ctPaintTools[toolIndex].clickRegion[1]<event.clientY and event.clientY<(ctPaintTools[toolIndex].clickRegion[1]+buttonHeight)
          if toolIndex < 8 
            previouslySelectedTool = selectedTool
            selectedTool = ctPaintTools[toolIndex]
          else
            console.log 'C', ctPaintTools[toolIndex]
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
          console.log 'D'
        else
          colorSwatches[0] = colorPallete[(((toolbar1X - 52 ) // 17) * 2) + ((toolbar1Y - 4) // 16)]
        drawToolbars()