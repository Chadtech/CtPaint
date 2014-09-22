flipAction = () ->
  menuUp = true
  normalCircumstance = false
  $('#menuDiv').css('top', (window.innerHeight - toolbarHeight - 45).toString())
  $('#menuDiv').css('left', (toolbarWidth + 10).toString())

  menuContext.canvas.width = 119
  menuContext.canvas.height = 35

  tH.push ctPaintTools[10]

  menuContext.drawImage(tH[tH.length - 1].menuImage, 0, 0)
  drawToolbars()

  whatSortOfDataSorting = flipDataSorting

flipDataSorting = ( inputMaterial ) ->
  if inputMaterial isnt undefined
    acceptableKeys = ['x','y']
    if inputMaterial in acceptableKeys
      switch inputMaterial
        when 'x'
          if areaSelected
            console.log selection.data 
          else
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
                canvasInPixels.push colorAtDatum
                colorAtDatum = []
              canvasIndex++

            flippedCanvas = []
            pixelIndex = 0
            while pixelIndex < canvasInPixels.length
              rowStart = pixelIndex // tWidth
              inRow = pixelIndex %% tWidth
              pixelToFlip = rowStart * tWidth
              pixelToFlip += (tWidth - inRow - 1)
              flippedCanvas.push canvasInPixels[pixelToFlip]
              pixelIndex++

            pixelIndex = 0
            while pixelIndex < canvasInPixels.length
              colorIndex = 0
              while colorIndex < 4
                datumIndex = pixelIndex * 4
                canvasAsWeFoundIt.data[datumIndex + colorIndex] = 
                  flippedCanvas[pixelIndex][colorIndex]
                colorIndex++
              pixelIndex++

            ctContext.putImageData(canvasAsWeFoundIt, 0, 0)
            canvasAsData = ctCanvas.toDataURL()
            tH.pop()
            drawToolbars()
            $('#menuDiv').css('top',(window.innerHeight).toString())
            normalCircumstance = true
            menuUp = false
        when 'y'
          if areaSelected
            console.log selection.data 
          else
            console.log 'NOPE'

