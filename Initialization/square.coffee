###
  This function draws a square onto the canvas.
###
squareAction = (canvas, color, beginX, beginY, endX, endY, fillOrNot) ->
  # First, let us check if the square is to be drawn filled in or not
  if not tH[tH.length - 1].mode and not fillOrNot
    ###
      If it isnt getting filled in, let the function draw a square
      for every pixel of width the square is to have
      The width of course, being defined by the square tool's
      magnitude property. (A)

      Before drawing the square though, the function must realize
      the relative positions of where the mouse was clicked down,
      and where the mouse now is. These two positions are typically
      the arguments beginX/beginY, and endX/endY.

      For both the x and y dimensions, the starting point could be
      farther than the end point from the origin, or closer. This
      means ther are four possible states of relative position: 0)
      the starting X is closer to the origin, and the starting Y is 
      closer to the origin; 1) the ending X is closer to the origin
      ( than the ending X ), and the starting Y is closer to the origin 
      (than the ending Y); 2) the starting X is closer to the origin 
      and the ending Y is closer to the origin; and 3) the ending X 
      is closer to the origin and the ending Y is closer to the origin.
      To Minimize the number of if statements, the function first
      judges if the starting and ending points for each dimension
      are the same ( B ), and then judges the relative position
      of one dimension, with the other dimensions relative
      position infered ( C )

      When the square drawn has a border, the function simply
      drawns many squares with a one pixel border. When the square 
      drawn has a border, the relative positions of the points in 
      each dimension must be recognized, least the function will not 
      know if the next bordering square to be drawn is to be drawn
      one pixel left, or one pixel right (or up or down), 
      of the prior square.
    ###
    magnitudeIncrement = 0
    # ( B )
    if (beginX < endX) is (beginY < endY)
      # ( C )
      if (beginX < endX)
        while magnitudeIncrement < tH[tH.length - 1].magnitude
          # ( A )
          mi = magnitudeIncrement
          drawLine(canvas, color, beginX + mi, beginY + mi, endX - mi, beginY + mi)
          drawLine(canvas, color, beginX + mi, beginY + mi, beginX + mi, endY - mi )
          drawLine(canvas, color, endX - mi, beginY + mi, endX - mi, endY - mi)
          drawLine(canvas, color, beginX + mi, endY - mi, endX - mi, endY - mi)
          magnitudeIncrement++
      else
        while magnitudeIncrement < tH[tH.length - 1].magnitude
          # ( A )
          mi = magnitudeIncrement
          drawLine(canvas, color, beginX - mi, beginY - mi, endX + mi, beginY - mi)
          drawLine(canvas, color, beginX - mi, beginY - mi, beginX - mi, endY + mi )
          drawLine(canvas, color, endX + mi, beginY - mi, endX + mi, endY + mi)
          drawLine(canvas, color, beginX - mi, endY + mi, endX + mi, endY + mi)
          magnitudeIncrement++
    else
      # ( C )
      if (endY < beginY)
        while magnitudeIncrement < tH[tH.length - 1].magnitude
          # ( A )
          mi = magnitudeIncrement
          drawLine(canvas, color, beginX + mi, beginY - mi, endX - mi, beginY - mi)
          drawLine(canvas, color, beginX + mi, beginY - mi, beginX + mi, endY + mi )
          drawLine(canvas, color, endX - mi, beginY - mi, endX - mi, endY + mi)
          drawLine(canvas, color, beginX + mi, endY + mi, endX - mi, endY + mi)
          magnitudeIncrement++
      else
        while magnitudeIncrement < tH[tH.length - 1].magnitude
          # ( A )
          mi = magnitudeIncrement
          drawLine(canvas, color, beginX - mi, beginY + mi, endX + mi, beginY + mi)
          drawLine(canvas, color, beginX - mi, beginY + mi, beginX - mi, endY - mi )
          drawLine(canvas, color, endX + mi, beginY + mi, endX + mi, endY - mi)
          drawLine(canvas, color, beginX - mi, endY - mi, endX + mi, endY - mi)
          magnitudeIncrement++
  else
    numberOfIterationsNecessary = 0
    if Math.abs(beginX - endX) > Math.abs(beginY - endY)
      numberOfIterationsNecessary = Math.abs(beginY - endY)
    else
      numberOfIterationsNecessary = Math.abs(beginX - endX)
    magnitudeIncrement = 0
    if (beginX < endX) is (beginY < endY)
      if (beginX < endX)
        while magnitudeIncrement < numberOfIterationsNecessary
          mi = magnitudeIncrement
          drawLine(canvas, color, beginX + mi, beginY + mi, endX - mi, beginY + mi)
          drawLine(canvas, color, beginX + mi, beginY + mi, beginX + mi, endY - mi )
          drawLine(canvas, color, endX - mi, beginY + mi, endX - mi, endY - mi)
          drawLine(canvas, color, beginX + mi, endY - mi, endX - mi, endY - mi)
          magnitudeIncrement++
      else
        while magnitudeIncrement < numberOfIterationsNecessary
          mi = magnitudeIncrement
          drawLine(canvas, color, beginX - mi, beginY - mi, endX + mi, beginY - mi)
          drawLine(canvas, color, beginX - mi, beginY - mi, beginX - mi, endY + mi )
          drawLine(canvas, color, endX + mi, beginY - mi, endX + mi, endY + mi)
          drawLine(canvas, color, beginX - mi, endY + mi, endX + mi, endY + mi)
          magnitudeIncrement++
    else
      if (endY < beginY)
        while magnitudeIncrement < numberOfIterationsNecessary
          mi = magnitudeIncrement
          drawLine(canvas, color, beginX + mi, beginY - mi, endX - mi, beginY - mi)
          drawLine(canvas, color, beginX + mi, beginY - mi, beginX + mi, endY + mi )
          drawLine(canvas, color, endX - mi, beginY - mi, endX - mi, endY + mi)
          drawLine(canvas, color, beginX + mi, endY + mi, endX - mi, endY + mi)
          magnitudeIncrement++
      else
        while magnitudeIncrement < numberOfIterationsNecessary
          mi = magnitudeIncrement
          drawLine(canvas, color, beginX - mi, beginY + mi, endX + mi, beginY + mi)
          drawLine(canvas, color, beginX - mi, beginY + mi, beginX - mi, endY - mi )
          drawLine(canvas, color, endX + mi, beginY + mi, endX + mi, endY - mi)
          drawLine(canvas, color, beginX - mi, endY - mi, endX + mi, endY - mi)
          magnitudeIncrement++

