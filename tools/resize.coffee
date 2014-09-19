resizeAction = () ->
  menuUp = true
  normalCircumstance = false
  $('#menuDiv').css('top', (window.innerHeight - toolbarHeight - 45).toString())
  $('#menuDiv').css('left', (toolbarWidth + 10).toString())

  menuContext.canvas.width = 390
  menuContext.canvas.height = 35

  previouslySelectedTool = selectedTool
  selectedTool = ctPaintTools[15]
  menuContext.drawImage(selectedTool.menuImage, 0, 0)
  drawToolbars()

  resizeDataSortingInitialize(canvasWidth, canvasHeight)
  whatSortOfDataSorting = resizeDataSorting

resizeDataSortingInitialize = (width, height) ->
  menuDatumZero = zeroPadder(width, 4) + zeroPadder(height, 4)
  spotInMenuZeroDatum = 0
  drawResizeMenu()


resizeDataSorting = ( inputMaterial ) ->
  if inputMaterial isnt undefined
    keysThatDontAddData = ['backspace', 'left', 'right', 'enter']
    if not inputMaterial in keysThatDontAddData
      if not isNaN(inputMaterial)
        menuDatumZero = replaceAt(menuDatumZero, inputMaterial, spotInMenuZeroDatum )
        if spotInMenuZeroDatum < 7
          spotInMenuZeroDatum++
    else
      switch inputMaterial
        when 'backspace'
          menuDatumZero = replaceAt(menuDatumZero, '0', spotInMenuZeroDatum)
          if 0 < spotInMenuZeroDatum
            spotInMenuZeroDatum--
        when 'left'
          if 0 < spotInMenuZeroDatum
            spotInMenuZeroDatum--
        when 'right'
          if spotInMenuZeroDatum < 7
            spotInMenuZeroDatum++
        when 'enter'
          $('#menuDiv').css('top',(window.innerHeight).toString())
          normalCircumstance = true
          menuUp = false
          newWidth = menuDatumZero.substr(0,4)
          newHeight = menuDatumZero.substr(4,4)
          ctContext.canvas.width = parseInt(newWidth)
          ctContext.canvas.height = parseInt(newHeight)
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
          selectedTool = previouslySelectedTool
          drawToolbars()
    drawResizeMenu()

drawResizeMenu = () ->
  drawStringAsCommandPrompt( menuContext, menuDatumZero.substr(0,4), 1, 116, 10 )
  drawStringAsCommandPrompt( menuContext, menuDatumZero.substr(4,4), 1, 228, 10 )
  xPos = 116 + ((spotInMenuZeroDatum // 4) * 112) + ( 12 * ( spotInMenuZeroDatum %% 4 ) )
  drawStringAsCommandPrompt( menuContext, menuDatumZero[spotInMenuZeroDatum], 2, xPos, 10 )

