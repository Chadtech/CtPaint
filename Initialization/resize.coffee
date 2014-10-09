resizeAction = () ->
  menuUp = true
  normalCircumstance = false
  $('#menuDiv').css('top', (window.innerHeight - toolbarHeight - 45).toString())
  $('#menuDiv').css('left', (toolbarWidth + 10).toString())

  menuContext.canvas.width = 475
  menuContext.canvas.height = 35

  tH.push ctPaintTools[toolsToNumbers['resize']]
  menuContext.drawImage(tH[tH.length - 1].menuImage, 0, 0)
  drawToolbars()

  resizeDataSortingInitialize(canvasWidth, canvasHeight)
  whatSortOfDataSorting = resizeDataSorting

resizeDataSortingInitialize = (width, height) ->
  menuDatum = zeroPadder(width, 4) + zeroPadder(height, 4)
  spotInMenuDatum = 0
  drawResizeMenu()

resizeDataSorting = ( inputMaterial ) ->
  if inputMaterial isnt undefined
    keysThatDontAddData = ['backspace', 'left', 'right', 'enter']
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
        when 'enter'
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
          positionCorners()
          tH.pop()
          drawToolbars()
    drawResizeMenu()

drawResizeMenu = () ->
  drawStringAsCommandPrompt( menuContext, menuDatum.substr(0,4), 1, 116, 10 )
  drawStringAsCommandPrompt( menuContext, menuDatum.substr(4,4), 1, 228, 10 )
  xPos = 116 + ((spotInMenuDatum // 4) * 112) + ( 12 * ( spotInMenuDatum %% 4 ) )
  drawStringAsCommandPrompt( menuContext, menuDatum[spotInMenuDatum], 2, xPos, 10 )

