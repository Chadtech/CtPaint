###
  Replace will replace a given color with another within.
###
replaceAction = () ->
  menuUp = true
  normalCircumstance = false
  $('#menuDiv').css('top', (window.innerHeight - toolbarHeight - 45).toString())
  $('#menuDiv').css('left', (toolbarWidth + 10).toString())

  tH.push ctPaintTools[toolsToNumbers['replace']]

  menuContext.canvas.width = tH[tH.length - 1].menuImage.width
  menuContext.canvas.height = tH[tH.length - 1].menuImage.height

  menuContext.drawImage(tH[tH.length - 1].menuImage, 0, 0)
  drawToolbars()

  replaceDataSortingInitialize()
  whatSortOfDataSorting = replaceDataSorting
  whatSortOfMouseListening = replaceMouseListening

replaceDataSortingInitialize = () ->
  firstColorSwatch = rgbToHex(colorSwatches[0]).substr(1,6)
  secondColorSwatch = rgbToHex(colorSwatches[1]).substr(1,6)
  menuDatum = firstColorSwatch+ secondColorSwatch
  spotInMenuDatum = 6
  drawReplaceMenu()

replaceDataSorting = ( inputMaterial, eventIsKeyDown ) ->
  coverUpOldCursor()
  if inputMaterial isnt undefined
    keysThatDontAddData = ['backspace', 'left', 'right', 'enter', 'n']
    keyAddsData = not (inputMaterial in keysThatDontAddData)
    keyIsAcceptableDataFormat = inputMaterial in hexadecimalProper
    if not eventIsKeyDown
      if keyAddsData and keyIsAcceptableDataFormat
        menuDatum = replaceAt(menuDatum, inputMaterial, spotInMenuDatum )
        if spotInMenuDatum < 11
          spotInMenuDatum++
        drawReplaceMenu()
      else
        switch inputMaterial
          when 'backspace'
            menuDatum = replaceAt(menuDatum, '0', spotInMenuDatum)
            if 0 < spotInMenuDatum
              spotInMenuDatum--
            drawReplaceMenu()
          when 'left'
            if 0 < spotInMenuDatum
              spotInMenuDatum--
            drawReplaceMenu()
          when 'right'
            if spotInMenuDatum < 11
              spotInMenuDatum++
            drawReplaceMenu()
          when 'n' then replaceFinishUp()
          when 'enter'
            if not areaSelected
              colorToReplace = hexToRGB(menuDatum.substr(0,6))
              replacement = hexToRGB(menuDatum.substr(6,6))
              replacement.push 255

              tWidth = ctContext.canvas.width
              tHeight = ctContext.canvas.height
              canvasAsWeFoundIt = ctContext.getImageData(0, 0, tWidth, tHeight)
              canvasData = canvasAsWeFoundIt.data
              canvasInPixels = []

              canvasIndex = 0
              colorAtDatum = []
              while canvasIndex < canvasData.length
                colorAtDatum.push canvasData[canvasIndex]
                if canvasIndex % 4 is 3
                  if sameColorCheck(colorAtDatum, colorToReplace)
                    canvasInPixels.push replacement
                  else
                    canvasInPixels.push colorAtDatum
                  colorAtDatum = []
                canvasIndex++

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

              $('#menuDiv').css('top',(window.innerHeight).toString())
              normalCircumstance = true
              menuUp = false
              tH.pop()
              drawToolbars()
            else
              colorToReplace = hexToRGB(menuDatum.substr(0,6))
              replacement = hexToRGB(menuDatum.substr(6,6))
              replacement.push 255

              selectionData = selection.data
              selectionInPixels = []

              selectionIndex = 0
              colorAtDatum = []
              while selectionIndex < selectionData.length
                colorAtDatum.push selectionData[selectionIndex]
                if selectionIndex % 4 is 3
                  if sameColorCheck(colorAtDatum, colorToReplace)
                    selectionInPixels.push replacement
                  else
                    selectionInPixels.push colorAtDatum
                  colorAtDatum = []
                selectionIndex++

              pixelIndex = 0
              while pixelIndex < selectionInPixels.length
                colorIndex = 0
                while colorIndex < 4
                  datumIndex = pixelIndex * 4
                  selection.data[datumIndex + colorIndex] = 
                    selectionInPixels[pixelIndex][colorIndex]
                  colorIndex++
                pixelIndex++

              canvasDataAsImage = new Image()
              canvasDataAsImage.onload = ->
                ctContext.drawImage(canvasDataAsImage,0,0)
                ctContext.putImageData(selection, selectionX, selectionY)
                rightEdge = selectionX + selectionsWidth - 1
                bottomEdge = selectionY + selectionsHeight - 1
                drawSelectBox(ctContext, selectionX, selectionY, rightEdge, bottomEdge)
              canvasDataAsImage.src = canvasHoldover
              replaceFinishUp()
    else
      switch inputMaterial
        when 'enter' then menuContext.drawImage(enterLitUp, tH[tH.length - 1].menuImage.width - 162, 5)
        when 'n' then menuContext.drawImage(cancelLitUp, tH[tH.length - 1].menuImage.width - 89, 5)
    updateOldCursor()

replaceFinishUp = ->
  $('#menuDiv').css('top',(window.innerHeight).toString())
  normalCircumstance = true
  menuUp = false
  tH.pop()
  drawToolbars()

replaceMouseListening = ( coordinates, eventIsMouseDown ) ->
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
      replaceFinishUp()

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
      replaceFinishUp()

drawReplaceMenu = () ->
  drawStringAsCommandPrompt( menuContext, menuDatum.substr(0,6).toUpperCase(), 1, 116, 10 )
  drawStringAsCommandPrompt( menuContext, menuDatum.substr(6,6).toUpperCase(), 1, 276, 10 )
  xPos = 116 + ((spotInMenuDatum // 6) * 160) + ( 12 * ( spotInMenuDatum %% 6 ) )
  drawStringAsCommandPrompt( menuContext, menuDatum[spotInMenuDatum].toUpperCase(), 2, xPos, 10 )

