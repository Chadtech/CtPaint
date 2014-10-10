###
  These are the functions relevant to flipping images, whether that
  image be the canvas itself, or a selection of the canvas. 
###
scaleAction = () ->
  menuUp = true
  normalCircumstance = false
  console.log 'B'
  $('#menuDiv').css('top', (window.innerHeight - toolbarHeight - 45).toString())
  $('#menuDiv').css('left', (toolbarWidth + 10).toString())

  tH.push ctPaintTools[toolsToNumbers['scale']]

  menuContext.canvas.width = tH[tH.length - 1].menuImage.width
  menuContext.canvas.height = tH[tH.length - 1].menuImage.height

  menuContext.drawImage(tH[tH.length - 1].menuImage, 0, 0)
  drawToolbars()

  scaleDataSortingInitialize()
  whatSortOfDataSorting = scaleDataSorting

scaleDataSortingInitialize = () ->
  menuDatum = zeroPadder(100, 3) + zeroPadder(100, 3)
  spotInMenuDatum = 0
  drawScaleMenu()

scaleDataSorting = ( inputMaterial ) ->
  if inputMaterial isnt undefined
    keysThatDontAddData = ['backspace', 'left', 'right', 'enter']
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
          if not areaSelected
            $('#menuDiv').css('top', (window.innerHeight).toString())
            normalCircumstance = true
            menuUp = false

            widthFactor = parseInt(menuDatum[0])
            widthFactor += ( parseInt( menuDatum[1] + menuDatum[2] ) / 100 )

            heightFactor = parseInt( menuDatum[3] )
            heightFactor += ( parseInt( menuDatum[4] + menuDatum[5] ) / 100 )

            cWidth = ctContext.canvas.width
            cHeight = ctContext.canvas.height
            canvasToScale = ctContext.getImageData(0, 0, cWidth, cHeight)

            canvassData = canvasToScale.data
            canvasAsPixels = []

            datumIndex = 0
            singlePixel = []
            while datumIndex < canvassData.length
              singlePixel.push canvassData[datumIndex]
              if singlePixel.length is 4
                canvasAsPixels.push singlePixel
                singlePixel = []
              datumIndex++

            scaledCanvas = []
            zeroToAdd = 0
            while zeroToAdd < scaledWidth * scaledHeight
              scaledCanvas.push 0
              zeroToAdd++

            scaledWidth = Math.floor( widthFactor * canvasToScale.width )
            scaledHeight = Math.floor( heightFactor * canvasToScale.height )

            rowIndex = 0
            while rowIndex < scaledHeight
              columnIndex = 0
              while columnIndex < scaledWidth
                pointX = Math.floor(columnIndex * widthFactor)
                pointY = Math.floor(rowIndex * heightFactor)
                canvasIndex = ( pointY * canvasToScale.width ) + pointX
                scaledIndex = ( rowIndex * scaledWidth ) + columnIndex 
                scaledCanvas[(rowIndex * scaledWidth) + columnIndex]  = canvasAsPixels[pixelIndex]
                columnIndex++
              rowIndex++

            scaledCanvasAsData = []
            pixelIndex = 0
            while pixelIndex < scaledCanvas.length
              colorIndex = 0
              while colorIndex < 4
                #console.log scaledCanvas[pixelIndex][colorIndex]
                console.log scaledCanvas[pixelIndex]
                scaledCanvasAsData.push scaledCanvas[pixelIndex][colorIndex]
                colorIndex++
              pixelIndex++

            newWidth = scaledWidth
            newHeight = scaledHeight
            ctContext.canvas.width = parseInt(newWidth)
            ctContext.canvas.height = parseInt(newHeight)
            canvasWidth = ctContext.canvas.width
            canvasHeight = ctContext.canvas.height
            ctCanvas.style.width = (canvasWidth).toString()+'px'
            ctCanvas.style.height = (canvasHeight).toString()+'px'
            positionCorners()

            dataToReplace = ctContext.getImageData( 0, 0, scaledWidth, scaledHeight)

            console.log dataToReplace

            tH.pop()
            drawToolbars()
    drawScaleMenu()

drawScaleMenu = () ->
  drawStringAsCommandPrompt( menuContext, menuDatum.substr(0, 3), 1, 103, 10 )
  drawStringAsCommandPrompt( menuContext, menuDatum.substr(3, 3), 1, 191, 10 )
  xPos = 103 + ((spotInMenuDatum // 3) * 88) + ( 12 * ( spotInMenuDatum %% 3 ) )
  drawStringAsCommandPrompt( menuContext, menuDatum[spotInMenuDatum], 2, xPos, 10 )
