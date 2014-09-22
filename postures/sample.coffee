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
    #selectedTool = previouslySelectedTool
    tH.pop()
    drawToolbars()
]

###
  Currently, when the sample is taken it often returns to the previously
  selected tool. However, if one adjusts the color with the vertical
  or horizontal color swaps, the previouslySelectedTool various is also
  used, removing the memory of the tool previous to the sample.

  Rather than making a previouslypreviouslyselectedtool variable, I believe
  the solution will be an array. And selectedTool will be the first element
  of that array. To return to previous tools, the tool at index 0 will be 
  'shifted'.
###