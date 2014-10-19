resizeAction = () ->
  menuUp = true
  normalCircumstance = false
  $('#menuDiv').css('top', (window.innerHeight - toolbarHeight - 45).toString())
  $('#menuDiv').css('left', (toolbarWidth + 10).toString())

  tH.push ctPaintTools[toolsToNumbers['resize']]
  
  menuContext.canvas.width = tH[tH.length - 1].menuImage.width
  menuContext.canvas.height = tH[tH.length - 1].menuImage.height

  menuContext.drawImage(tH[tH.length - 1].menuImage, 0, 0)
  drawToolbars()

  resizeDataSortingInitialize(canvasWidth, canvasHeight)
  whatSortOfDataSorting = resizeDataSorting
  whatSortOfMouseListening = resizeMouseListening

resizeDataSortingInitialize = (width, height) ->
  if areaSelected
    areaSelected = false
    boxInformation = undefined
    canvasDataAsImage = new Image()
    canvasDataAsImage.onload = ->
      ctContext.drawImage(canvasDataAsImage,0,0)
      #ctContext.putImageData(selection, selectionX, selectionY)
      historyUpdate()
    canvasDataAsImage.src = cH[cH.length - 1]
  menuDatum = zeroPadder(width, 4) + zeroPadder(height, 4)
  spotInMenuDatum = 0
  drawResizeMenu()

resizeDataSorting = ( inputMaterial, eventIsKeyDown ) ->
  if inputMaterial isnt undefined
    keysThatDontAddData = [ 'backspace', 'left', 'right', 'enter', 'n' ]
    if not eventIsKeyDown
      if not (inputMaterial in keysThatDontAddData)
        if not isNaN(inputMaterial)
          menuDatum = replaceAt(menuDatum, inputMaterial, spotInMenuDatum )
          if spotInMenuDatum < 7
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
            if spotInMenuDatum < 7
              spotInMenuDatum++
          when 'n'
            resizeFinishUp()
          when 'enter'
            resize()
      drawResizeMenu()
    else
      switch inputMaterial
        when 'enter' then menuContext.drawImage(enterLitUp, tH[tH.length - 1].menuImage.width - 162, 5)
        when 'n' then menuContext.drawImage(cancelLitUp, tH[tH.length - 1].menuImage.width - 89, 5)

resize = ->
  $('#menuDiv').css('top',(window.innerHeight).toString())
  normalCircumstance = true
  menuUp = false
  newWidth = menuDatum.substr(0,4)
  newHeight = menuDatum.substr(4,4)
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
  tH.pop()
  drawToolbars()

resizeFinishUp = ->
  $('#menuDiv').css('top', (window.innerHeight).toString())
  normalCircumstance = true
  menuUp = false
  tH.pop()
  drawToolbars()

resizeMouseListening = ( coordinates, eventIsMouseDown ) ->
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
    else
      resizeFinishUp()

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
      resizeFinishUp()

drawResizeMenu = () ->
  drawStringAsCommandPrompt( menuContext, menuDatum.substr(0,4), 1, 116, 10 )
  drawStringAsCommandPrompt( menuContext, menuDatum.substr(4,4), 1, 228, 10 )
  xPos = 116 + ((spotInMenuDatum // 4) * 112) + ( 12 * ( spotInMenuDatum %% 4 ) )
  drawStringAsCommandPrompt( menuContext, menuDatum[spotInMenuDatum], 2, xPos, 10 )

