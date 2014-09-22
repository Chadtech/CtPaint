flipAction = () ->
  menuUp = true
  normalCircumstance = false
  $('#menuDiv').css('top', (window.innerHeight - toolbarHeight - 45).toString())
  $('#menuDiv').css('left', (toolbarWidth + 10).toString())

  menuContext.canvas.width = 119
  menuContext.canvas.height = 35

  tH.push ctPaintTools[10]
  tH.shift()
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

            #flippedCanvas = document.createElement('canvas')
            #flippedCanvas = flippedCanvas.getContext('2d')
            #flippedCanvas = flippedCanvas.createImageData(tWidth, tHeight)

            canvasInPixels = []
 
            xIndex = 0
            while xIndex < tWidth
              yIndex = 0
              while yIndex  < tHeight 
                colorIndex = 0
                colorAtXY = []
                while colorIndex < 4
                  currentCanvasIndex = yIndex 
                  currentCanvasIndex *= tWidth
                  currentCanvasIndex += xIndex
                  currentCanvasIndex *= 4
                  currentCanvasIndex += colorIndex
                  colorAtXY.push canvasData[currentCanvasIndex]
                  colorIndex++
                canvasInPixels.push colorAtXY
                yIndex++
              xIndex++

            flippedCanvas = []
            flipIndex = 0
            while flipIndex < canvasInPixels.length
              flippedCanvas.push canvasInPixels[canvasInPixels.length - flipIndex - 1]
              flipIndex++

            pixelIndex = 0
            while pixelIndex< flippedCanvas.length
              colorIndex = 0
              while colorIndex < 4
                datumIndex = pixelIndex * 4
                canvasData[datumIndex + colorIndex] = flippedCanvas[pixelIndex][colorIndex]
                colorIndex++
              pixelIndex++

            ctContext.putImageData(canvasAsWeFoundIt, 0, 0)

            ###
            canvasDataAsImage = new Image()
            canvasDataAsImage.onload = ->
              ctContext.drawImage(canvasDataAsImage,0,0)
              canvasAsData = ctCanvas.toDataURL()
              canvasDataAsImage = new Image()
              canvasDataAsImage.src = canvasAsData
            canvasDataAsImage.src = canvasAsData
            console.log canvasDataAsImage
            ###
        when 'y'
          if areaSelected
            console.log selection.data 
          else
            console.log 'NOPE'

