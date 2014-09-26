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
            selectionsData = selection.data
            selectionInPixels = []

            selectionIndex = 0
            colorOfDatum = []
            while selectionIndex < selectionsData.length
              colorOfDatum.push selectionsData[selectionIndex]
              if selectionIndex % 4 is 3
                selectionInPixels.push colorOfDatum
                colorOfDatum = []
              selectionIndex++

            flippedSelection = []
            pixelIndex = 0
            while pixelIndex < selectionInPixels.length
              rowStart = pixelIndex // selectionsWidth
              inRow = pixelIndex %% selectionsWidth
              pixelToFlip = rowStart * selectionsWidth
              pixelToFlip += (selectionsWidth - inRow - 1)
              flippedSelection.push selectionInPixels[pixelToFlip]
              pixelIndex++

            pixelIndex = 0
            while pixelIndex < flippedSelection.length
              colorIndex = 0
              while colorIndex < 4
                datumIndex = pixelIndex * 4
                selection.data[datumIndex + colorIndex] = 
                  flippedSelection[pixelIndex][colorIndex]
                colorIndex++
              pixelIndex++

            ctContext.putImageData(selection, selectionX, selectionY)
            tH.pop()
            drawToolbars()
            $('#menuDiv').css('top',(window.innerHeight).toString())
            normalCircumstance = true
            menuUp = false

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
            selectionsData = selection.data
            selectionInPixels = []

            selectionIndex = 0
            colorOfDatum = []
            while selectionIndex < selectionsData.length
              colorOfDatum.push selectionsData[selectionIndex]
              if selectionIndex % 4 is 3
                selectionInPixels.push colorOfDatum
                colorOfDatum = []
              selectionIndex++

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

            pixelIndex = 0
            while pixelIndex < flippedSelection.length
              colorIndex = 0
              while colorIndex < 4
                datumIndex = pixelIndex * 4
                selection.data[datumIndex + colorIndex] = 
                  flippedSelection[pixelIndex][colorIndex]
                colorIndex++
              pixelIndex++

            ctContext.putImageData(selection, selectionX, selectionY)
            tH.pop()
            drawToolbars()
            $('#menuDiv').css('top',(window.innerHeight).toString())
            normalCircumstance = true
            menuUp = false
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
            rowIndex = 0
            while rowIndex < (canvasInPixels.length // tWidth)
              thisRow = (canvasInPixels.length // tWidth) - rowIndex - 1
              rowAt = thisRow * tWidth
              columnIndex = 0
              while columnIndex < tWidth
                flippedCanvas.push canvasInPixels[rowAt + columnIndex]
                columnIndex++
              rowIndex++

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

