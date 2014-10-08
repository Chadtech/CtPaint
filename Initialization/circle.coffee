###
  drawCircle is the basic circle drawing function. The arguments are as
  you would expect with the exception of cornerBlock. When the circle
  tool has fill turned on, smaller circles are drawn inside of a largest
  circle. When ctPaint draws successive circles some of the successors
  dont put pixels one pixel deeper. There are empty speckles. To avoid
  that, the corner block argument switches on a mode to bulk out the 
  'corners' of the circle, meaning, when the next pixel is being drawn
  diagonally (+1, +1) from the current pixel, draw a pixel vertically 
  and horizontally (+1, 0) and (0, +1)

  The draw circle function is a bresenham algorithm, which can only
  draw one eight of a complete circle. If the algorithm is done
  eight times inverted vertically, horizontally, and across the 
  axis(?) You can get each section of the circle (2 ^ 3 = 8)
###

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

circleAction = ( canvas, color, radiusToPass ) ->
  if not tH[tH.length - 1].mode
    whetherCornerBlocks = false
    if tH[tH.length - 1].magnitude > 1
      whetherCornerBlocks = true
    magnitudeIncrement = 0
    while magnitudeIncrement < tH[tH.length - 1].magnitude
      thisIncrementsRadius = radiusToPass - magnitudeIncrement
      drawCircle( canvas, color, oldX, oldY, thisIncrementsRadius, whetherCornerBlocks )
      magnitudeIncrement++
  else
    magnitudeIncrement = 0
    while magnitudeIncrement < radiusToPass
      drawCircle( canvas, color, oldX, oldY, radiusToPass - magnitudeIncrement, true )
      magnitudeIncrement++

