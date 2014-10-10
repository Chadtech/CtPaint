###
  These are the functions relevant to flipping images, whether that
  image be the canvas itself, or a selection of the canvas. 
###
flipAction = () ->
  menuUp = true
  normalCircumstance = false
  $('#menuDiv').css('top', (window.innerHeight - toolbarHeight - 45).toString())
  $('#menuDiv').css('left', (toolbarWidth + 10).toString())

  tH.push ctPaintTools[toolsToNumbers['flip']]

  menuContext.canvas.width = tH[tH.length - 1].menuImage.width
  menuContext.canvas.height = tH[tH.length - 1].menuImage.height

  menuContext.drawImage(tH[tH.length - 1].menuImage, 0, 0)
  drawToolbars()

  whatSortOfDataSorting = flipDataSorting

###
  flipDataSorting does all the heavy lifting of the flip 
  tool. 

  After listening to the key that was pressed and working with it.
  It goes into one of four distinct sectionf of code: (A) flip
  a selected area horizontally, (B) flip the canvas horizontally
  (C) flip a selected area vertically; and (D) flip the canvas
  vertically

  All the sections basically flow the same way:
    (a) Get the data of the image being manipulated
    (b) Convert it into an array of pixels (instead 
    of an array of color values)
    (c) Rearrange it accordingly
    (d) Turn it back into image data 
    (e) Paste it back onto the canvas, and wrap up the
    whole operation
###
flipDataSorting = ( inputMaterial ) ->
  if inputMaterial isnt undefined
    acceptableKeys = ['x','y']
    if inputMaterial in acceptableKeys
      switch inputMaterial
        when 'x'
          #   ( A )
          if areaSelected
            #   ( a )
            selectionsData = selection.data
            selectionInPixels = []

            #   ( b )
            selectionIndex = 0
            colorOfDatum = []
            while selectionIndex < selectionsData.length
              colorOfDatum.push selectionsData[selectionIndex]
              if selectionIndex % 4 is 3
                selectionInPixels.push colorOfDatum
                colorOfDatum = []
              selectionIndex++

            #   ( c )
            flippedSelection = []
            pixelIndex = 0
            while pixelIndex < selectionInPixels.length
              rowStart = pixelIndex // selectionsWidth
              inRow = pixelIndex %% selectionsWidth
              pixelToFlip = rowStart * selectionsWidth
              pixelToFlip += (selectionsWidth - inRow - 1)
              flippedSelection.push selectionInPixels[pixelToFlip]
              pixelIndex++

            #   ( d )
            pixelIndex = 0
            while pixelIndex < flippedSelection.length
              colorIndex = 0
              while colorIndex < 4
                datumIndex = pixelIndex * 4
                selection.data[datumIndex + colorIndex] = 
                  flippedSelection[pixelIndex][colorIndex]
                colorIndex++
              pixelIndex++

            #   ( e )
            ctContext.putImageData(selection, selectionX, selectionY)
            tH.pop()
            drawToolbars()
            $('#menuDiv').css('top',(window.innerHeight).toString())
            normalCircumstance = true
            menuUp = false

          #   ( B )
          else
            #   ( a )
            tWidth = ctContext.canvas.width
            tHeight = ctContext.canvas.height
            canvasAsWeFoundIt = ctContext.getImageData(0, 0, tWidth, tHeight)
            canvasData = canvasAsWeFoundIt.data
            canvasInPixels = []

            #   ( b )
            canvasIndex = 0
            colorAtDatum = []
            while canvasIndex < canvasData.length
              colorAtDatum.push canvasData[canvasIndex]
              if canvasIndex % 4 is 3
                canvasInPixels.push colorAtDatum
                colorAtDatum = []
              canvasIndex++

            #   ( c )
            flippedCanvas = []
            pixelIndex = 0
            while pixelIndex < canvasInPixels.length
              rowStart = pixelIndex // tWidth
              inRow = pixelIndex %% tWidth
              pixelToFlip = rowStart * tWidth
              pixelToFlip += (tWidth - inRow - 1)
              flippedCanvas.push canvasInPixels[pixelToFlip]
              pixelIndex++

            #  ( d )
            pixelIndex = 0
            while pixelIndex < canvasInPixels.length
              colorIndex = 0
              while colorIndex < 4
                datumIndex = pixelIndex * 4
                canvasAsWeFoundIt.data[datumIndex + colorIndex] = 
                  flippedCanvas[pixelIndex][colorIndex]
                colorIndex++
              pixelIndex++

            #   ( e )
            ctContext.putImageData(canvasAsWeFoundIt, 0, 0)
            cH.push ctCanvas.toDataURL()
            cH.shift()
            cF = []
            tH.pop()
            drawToolbars()
            $('#menuDiv').css('top',(window.innerHeight).toString())
            normalCircumstance = true
            menuUp = false

        when 'y'
          #   ( C )
          if areaSelected
            #   ( a )
            selectionsData = selection.data
            selectionInPixels = []

            #   ( b )
            selectionIndex = 0
            colorOfDatum = []
            while selectionIndex < selectionsData.length
              colorOfDatum.push selectionsData[selectionIndex]
              if selectionIndex % 4 is 3
                selectionInPixels.push colorOfDatum
                colorOfDatum = []
              selectionIndex++

            #   ( c )
            flippedSelection = []
            rowIndex = 0
            while rowIndex < (selectionInPixels.length // selectionsWidth)
              thisRow = (selectionInPixels.length // selectionsWidth) - rowIndex - 1
              rowAt = thisRow * selectionsWidth
              columnIndex = 0
              while columnIndex < selectionsWidth
                flippedSelection.push selectionInPixels[rowAt + columnIndex]
                columnIndex++
              rowIndex++

            #   ( d )
            pixelIndex = 0
            while pixelIndex < flippedSelection.length
              colorIndex = 0
              while colorIndex < 4
                datumIndex = pixelIndex * 4
                selection.data[datumIndex + colorIndex] = 
                  flippedSelection[pixelIndex][colorIndex]
                colorIndex++
              pixelIndex++

            #   ( e )
            ctContext.putImageData(selection, selectionX, selectionY)
            tH.pop()
            drawToolbars()
            $('#menuDiv').css('top',(window.innerHeight).toString())
            normalCircumstance = true
            menuUp = false
          #   ( D )
          else
            #   ( a )
            tWidth = ctContext.canvas.width
            tHeight = ctContext.canvas.height
            canvasAsWeFoundIt = ctContext.getImageData(0, 0, tWidth, tHeight)
            canvasData = canvasAsWeFoundIt.data
            canvasInPixels = []

            #   ( b )
            canvasIndex = 0
            colorAtDatum = []
            while canvasIndex < canvasData.length
              colorAtDatum.push canvasData[canvasIndex]
              if canvasIndex % 4 is 3
                canvasInPixels.push colorAtDatum
                colorAtDatum = []
              canvasIndex++

            #   ( c )
            flippedCanvas = []
            rowIndex = 0
            while rowIndex < (canvasInPixels.length // tWidth)
              thisRow = (canvasInPixels.length // tWidth) - rowIndex - 1
              rowAt = thisRow * tWidth
              columnIndex = 0
              while columnIndex < tWidth
                flippedCanvas.push canvasInPixels[rowAt + columnIndex]
                columnIndex++
              rowIndex++

            #   ( d )
            pixelIndex = 0
            while pixelIndex < canvasInPixels.length
              colorIndex = 0
              while colorIndex < 4
                datumIndex = pixelIndex * 4
                canvasAsWeFoundIt.data[datumIndex + colorIndex] = 
                  flippedCanvas[pixelIndex][colorIndex]
                colorIndex++
              pixelIndex++

            #   ( e )
            ctContext.putImageData(canvasAsWeFoundIt, 0, 0)
            cH.push ctCanvas.toDataURL()
            cH.shift()
            cF = []
            tH.pop()
            drawToolbars()
            $('#menuDiv').css('top',(window.innerHeight).toString())
            normalCircumstance = true
            menuUp = false

