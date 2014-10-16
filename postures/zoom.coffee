zoomPosture = [
  (event) ->
    drawInformation(event)
    #updateCursor(event)

  (event) ->
    if not mousePressed
      mousePressed = true
      getMousePositionOnCanvas(event)
      if zoomActivate
        zoomActivate = false

        canvasXPos = toolbarWidth + 5
        canvasYPos = 5
        positionCanvas()

        ctCanvas.style.width = (canvasWidth).toString()+'px'
        ctCanvas.style.height = (canvasHeight).toString()+'px'
        
      else
        zoomActivate = true
        zoomFactor = 2 ** tH[tH.length - 1].magnitude

        # The windows width, minus the width of the vertical toolbar
        screensWidth = window.innerWidth - toolbarWidth
        # The number of 'represented' pixels in the canvas, not the 
        # number of pixels across the resolution of the screen
        screensWidthInCanvasPixels = screensWidth // zoomFactor

        screensHeight = window.innerHeight - toolbarHeight
        screensHeightInCanvasPixels = screensHeight // zoomFactor

        # zoomRootX, being in the upper left corner of where
        # they clicked given the new zoom magnitude
        # This results that they zoom in to where they click
        # instead of setting the origin ( (0,0) ) of their
        # new view mode to where they clicked.
        zoomRootX = xSpot - (screensWidthInCanvasPixels // 2)
        zoomRootY = ySpot - (screensHeightInCanvasPixels // 2)

        if zoomRootX < 0
          zoomRootX = 0
          canvasXPos += 5
        if zoomRootY < 0
          zoomRootY = 0
          canvasYPos += 5

        canvasXPos -= 5 
        canvasYPos -= 5

        canvasXPos -= (zoomRootX * zoomFactor)
        canvasYPos -= (zoomRootY * zoomFactor)

        positionCanvas()

        ctCanvas.style.width = (zoomFactor * ctCanvas.width).toString()+'px'
        ctCanvas.style.height = (zoomFactor * ctCanvas.height).toString()+'px'
      drawToolbars()

  (event) ->
    if mousePressed
      mousePressed = false

  (event) ->
]

