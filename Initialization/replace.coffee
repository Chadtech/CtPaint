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

replaceDataSortingInitialize = () ->
  menuDatum = rgbToHex(colorSwatches[0]).substr(1,6) + rgbToHex(colorSwatches[1]).substr(1,6)
  spotInMenuDatum = 0
  drawReplaceMenu()

replaceDataSorting = ( inputMaterial ) ->
  if inputMaterial isnt undefined
    keysThatDontAddData = ['backspace', 'left', 'right', 'enter']
    keyAddsData = not (inputMaterial in keysThatDontAddData)
    keyIsAcceptableDataFormat = inputMaterial in hexadecimalProper
    if keyAddsData and keyIsAcceptableDataFormat
      menuDatum = replaceAt(menuDatum, inputMaterial, spotInMenuDatum )
      if spotInMenuDatum < 11
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
          if spotInMenuDatum < 11
            spotInMenuDatum++
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
              cH.push ctCanvas.toDataURL()
              cH.shift()
              cF = []
              ctContext.putImageData(selection, selectionX, selectionY)
              rightEdge = selectionX + selectionsWidth
              bottomEdge = selectionY + selectionsHeight
              drawSelectBox(ctContext, selectionX - 1, selectionY - 1, rightEdge, bottomEdge)
            canvasDataAsImage.src = cH[cH.length - 1]

            $('#menuDiv').css('top',(window.innerHeight).toString())
            normalCircumstance = true
            menuUp = false
            tH.pop()
            drawToolbars()
    drawReplaceMenu()

drawReplaceMenu = () ->
  drawStringAsCommandPrompt( menuContext, menuDatum.substr(0,6).toUpperCase(), 1, 116, 10 )
  drawStringAsCommandPrompt( menuContext, menuDatum.substr(6,6).toUpperCase(), 1, 276, 10 )
  xPos = 116 + ((spotInMenuDatum // 6) * 160) + ( 12 * ( spotInMenuDatum %% 6 ) )
  drawStringAsCommandPrompt( menuContext, menuDatum[spotInMenuDatum].toUpperCase(), 2, xPos, 10 )

