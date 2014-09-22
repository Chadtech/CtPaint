circleAction = ( canvas, color, xPos, yPos ) ->
  #if not selectedTool.mode
  if not tH[tH.length - 1].mode
    whetherCornerBlocks = false
    #if selectedTool.magnitude > 1
    if tH[tH.length - 1].magnitude > 1
      whetherCornerBlocks = true
    calculatedRadius = Math.pow(Math.pow(xPos - oldX, 2) + Math.pow(yPos - oldY, 2), 0.5)
    calculatedRadius = Math.round(calculatedRadius)
    magnitudeIncrement = 0
    #while magnitudeIncrement < selectedTool.magnitude
    while magnitudeIncrement < tH[tH.length - 1].magnitude
      thisIncrementsRadius = calculatedRadius - magnitudeIncrement
      drawCircle( canvas, color, oldX, oldY, thisIncrementsRadius, whetherCornerBlocks )
      magnitudeIncrement++
  else
    calculatedRadius = Math.pow(Math.pow(xPos - oldX, 2) + Math.pow(yPos - oldY, 2), 0.5)
    calculatedRadius = Math.round(calculatedRadius)
    magnitudeIncrement = 0
    while magnitudeIncrement < calculatedRadius
      drawCircle( canvas, color, oldX, oldY, calculatedRadius - magnitudeIncrement, true )
      magnitudeIncrement++
      
drawCircle = ( canvas, color, centerX, centerY, radius, cornerBlock) ->
  radiusError = 1 - radius
  xOffset = 0
  yOffset = radius
  xDelta = 0
  yDelta = -2 * radius

  putPixel(canvas, color, centerX, centerY + radius)
  putPixel(canvas, color, centerX, centerY - radius)
  putPixel(canvas, color, centerX + radius, centerY)
  putPixel(canvas, color, centerX - radius, centerY)

  if not cornerBlock
    while xOffset < yOffset
      if radiusError >= 0
        yOffset--
        yDelta += 2
        radiusError += yDelta
      xOffset++
      xDelta += 2
      radiusError += (xDelta + 1)

      putPixel( canvas, color, centerX + xOffset, centerY + yOffset)
      putPixel( canvas, color, centerX - xOffset, centerY + yOffset)
      putPixel( canvas, color, centerX + xOffset, centerY - yOffset)
      putPixel( canvas, color, centerX - xOffset, centerY - yOffset)

      putPixel( canvas, color, centerX + yOffset, centerY + xOffset)
      putPixel( canvas, color, centerX - yOffset, centerY + xOffset)
      putPixel( canvas, color, centerX + yOffset, centerY - xOffset)
      putPixel( canvas, color, centerX - yOffset, centerY - xOffset)
  else
    doACornerBlock = false
    while xOffset < yOffset
      if radiusError >= 0
        yOffset--
        yDelta += 2
        radiusError += yDelta
        doACornerBlock = true
      xOffset++
      xDelta += 2
      radiusError += (xDelta + 1)

      putPixel( canvas, color, centerX + xOffset, centerY + yOffset)
      putPixel( canvas, color, centerX - xOffset, centerY + yOffset)
      putPixel( canvas, color, centerX + xOffset, centerY - yOffset)
      putPixel( canvas, color, centerX - xOffset, centerY - yOffset)

      putPixel( canvas, color, centerX + yOffset, centerY + xOffset)
      putPixel( canvas, color, centerX - yOffset, centerY + xOffset)
      putPixel( canvas, color, centerX + yOffset, centerY - xOffset)
      putPixel( canvas, color, centerX - yOffset, centerY - xOffset)
      
      if doACornerBlock
        putPixel( canvas, color, centerX + xOffset - 1, centerY + yOffset)
        putPixel( canvas, color, centerX - xOffset + 1, centerY + yOffset)
        putPixel( canvas, color, centerX + xOffset - 1, centerY - yOffset)
        putPixel( canvas, color, centerX - xOffset + 1, centerY - yOffset)

        putPixel( canvas, color, centerX + yOffset, centerY + xOffset - 1)
        putPixel( canvas, color, centerX - yOffset, centerY + xOffset - 1)
        putPixel( canvas, color, centerX + yOffset, centerY - xOffset + 1)
        putPixel( canvas, color, centerX - yOffset, centerY - xOffset + 1)
        doACornerBlock = false
