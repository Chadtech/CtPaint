samplePosture = [
  () ->
    toolbar1Context.drawImage(toolbar1sImage1,188,3)   
    drawInformationToolbar0()
    drawInformationToolbar1()
  () ->
    mousePressed = true
  () ->
    mousePressed = false
    getMousePositionOnCanvas(event)
    colorSwatches[0] = hexToRGB(getColorValue(ctContext, xSpot, ySpot).substr(1))
    tH.pop()
    tH.push tH[tH.length - 1]
    drawToolbars()
]

