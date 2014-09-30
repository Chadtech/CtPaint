zoomPosture = [
  () ->
    toolbar1Context.drawImage(toolbar1sImage1,188,3)   
    drawInformationToolbar0()
    drawInformationToolbar1()
  () ->
    mousePressed = true
    getMousePositionOnCanvas(event)
    if zoomActivate
      zoomActivate = false
      cornersVisible = true
      ctCanvas.style.width = (canvasWidth).toString()+'px'
      ctCanvas.style.height = (canvasHeight).toString()+'px'
    else
      zoomActivate = true
      cornersVisible = false
      zoomedCanvas = new Image()
      #zoomedCanvas.onload = ->
      #  ctContext.drawImage(zoomedCanvas,0,0,zoomedCanvas.width*4,zoomedCanvas.height*4)
      #zoomedCanvas.src = cH[cH.length - 1]
      scaleCanvasBigger( 2 ** tH[tH.length - 1].magnitude )
    positionCorners()
    drawToolbars()
  () ->
    mousePressed = false
  () ->
]