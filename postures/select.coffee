selectPosture = [
  # Mouse Move
  (event) ->
    setCasualPosition(event)
    if not areaSelected
      if mousePressed

        getMousePositionOnCanvas(event)
        sortedXs = [ Math.min(xSpot, oldX), Math.max(xSpot, oldX) ]
        sortedYs = [ Math.min(ySpot, oldY), Math.max(ySpot, oldY) ]

        boxInformation = (Math.abs(xSpot - oldX) + 1).toString() 
        boxInformation += 'px x '
        boxInformation += (Math.abs(ySpot - oldY) + 1).toString()
        boxInformation += 'px'
        drawInformation( event, boxInformation )

        canvasDataAsImage = new Image()
        canvasDataAsImage.onload = ->
          originX = sortedXs[0]
          originY = sortedYs[0]
          otherSideX = sortedXs[1]
          otherSideY = sortedYs[1]
          ctContext.drawImage(canvasDataAsImage, 0, 0)
          drawSelectBox(ctContext, originX, originY, otherSideX, otherSideY)
        canvasDataAsImage.src = cH[cH.length - 1]
      else
        drawInformation( event, boxInformation )

    else
      if mousePressed
        getMousePositionOnCanvas(event)
        xOffset = xSpot - oldX
        yOffset = ySpot - oldY
        gripX = selectionX + xOffset
        gripY = selectionY + yOffset
        rightEdge = gripX + selectionsWidth - 1
        bottomEdge = gripY + selectionsHeight - 1

        if (gripX isnt undefined) and (gripY isnt undefined)
          selectionOrigin = '(' + (gripX + '') + ', ' + (gripY + '') + ')'
          drawInformation( event, selectionOrigin )

        canvasDataAsImage = new Image()
        canvasDataAsImage.onload = ->
          ctContext.drawImage(canvasDataAsImage, 0, 0)
          ctContext.drawImage(selectionImage, gripX, gripY)
          drawSelectBox(ctContext, gripX, gripY, rightEdge, bottomEdge)
        canvasDataAsImage.src = canvasHoldover
      else
        drawInformation( event, boxInformation )

  # Mouse down
  (event) ->
    mousePressed = true
    if not areaSelected
      getMousePositionOnCanvas(event)
      oldX = xSpot
      oldY = ySpot
    else
      getMousePositionOnCanvas(event)
      oldX = xSpot
      oldY = ySpot

      notTooFarLeft = selectionX < xSpot
      notTooFarRight = xSpot < (selectionX + selectionsWidth)
      withinXBoundaries = notTooFarLeft and notTooFarRight
      notTooLow = selectionY < ySpot
      notTooHigh = ySpot < (selectionY + selectionsHeight)
      withinYBoundaries = notTooLow and notTooHigh

      if not (withinXBoundaries and withinYBoundaries)
        ctPaintTools[toolsToNumbers['select']].mode = false
        drawToolbars()
        areaSelected = false
        boxInformation = undefined
        canvasDataAsImage = new Image()
        canvasDataAsImage.onload = ->
          ctContext.drawImage(canvasDataAsImage, 0, 0)
          ctContext.drawImage(selectionImage, selectionX, selectionY)
          historyUpdate()
        canvasDataAsImage.src = canvasHoldover

  # Mouse up
  (event) ->
    mousePressed = false
    if not areaSelected
      sortedXs = [ Math.min(xSpot, oldX), Math.max(xSpot, oldX) ]
      sortedYs = [ Math.min(ySpot, oldY), Math.max(ySpot, oldY) ]
      selectionsWidth = Math.abs(xSpot - oldX) + 1
      selectionsHeight = Math.abs(ySpot - oldY) + 1
      selectionX = sortedXs[0]
      selectionY = sortedYs[0]
      originX = selectionX
      originY = selectionY
      otherSideX = selectionX + selectionsWidth - 1
      otherSideY = selectionY + selectionsHeight - 1
      if 0 < selectionsWidth and 0 < selectionsHeight
        canvasDataAsImage = new Image()
        canvasDataAsImage.onload = ->
          ctContext.drawImage(canvasDataAsImage,0,0)
          selection = 
            ctContext.getImageData( sortedXs[0], sortedYs[0], selectionsWidth, selectionsHeight)
          
          squareAction(ctContext, 
            colorSwatches[1], 
            oldX, 
            oldY, 
            xSpot, 
            ySpot, 
            true)

          canvasHoldover = ctCanvas.toDataURL()

          selectionImage = new Image()
          selectionImage.onload = ->
            ctContext.drawImage(selectionImage, selectionX, selectionY)
            drawSelectBox(ctContext, originX, originY, otherSideX, otherSideY)
          selectionImage.src = imageDataToURL(selection)

        canvasDataAsImage.src = cH[cH.length - 1]
        areaSelected = true
    else
      selectionX = gripX
      selectionY = gripY

  # Mouse Exit
  (event) ->
]

