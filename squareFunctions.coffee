squareAction = (canvas, color, beginX, beginY, endX, endY, fillOrNot) ->
  if not selectedTool.mode and not fillOrNot
    magnitudeIncrement = 0
    if (beginX < endX) == (beginY < endY)
      if (beginX < endX)
        while magnitudeIncrement < selectedTool.magnitude
          drawLine(canvas, color, beginX + magnitudeIncrement, beginY + magnitudeIncrement, endX - magnitudeIncrement, beginY + magnitudeIncrement)
          drawLine(canvas, color, beginX + magnitudeIncrement, beginY + magnitudeIncrement, beginX + magnitudeIncrement, endY - magnitudeIncrement )
          drawLine(canvas, color, endX - magnitudeIncrement, beginY + magnitudeIncrement, endX - magnitudeIncrement, endY - magnitudeIncrement)
          drawLine(canvas, color, beginX + magnitudeIncrement, endY - magnitudeIncrement, endX - magnitudeIncrement, endY - magnitudeIncrement)
          magnitudeIncrement++
      else
        while magnitudeIncrement < selectedTool.magnitude
          drawLine(canvas, color, beginX - magnitudeIncrement, beginY - magnitudeIncrement, endX + magnitudeIncrement, beginY - magnitudeIncrement)
          drawLine(canvas, color, beginX - magnitudeIncrement, beginY - magnitudeIncrement, beginX - magnitudeIncrement, endY + magnitudeIncrement )
          drawLine(canvas, color, endX + magnitudeIncrement, beginY - magnitudeIncrement, endX + magnitudeIncrement, endY + magnitudeIncrement)
          drawLine(canvas, color, beginX - magnitudeIncrement, endY + magnitudeIncrement, endX + magnitudeIncrement, endY + magnitudeIncrement)
          magnitudeIncrement++
    else
      if (endY < beginY)
        while magnitudeIncrement < selectedTool.magnitude
          drawLine(canvas, color, beginX + magnitudeIncrement, beginY - magnitudeIncrement, endX - magnitudeIncrement, beginY - magnitudeIncrement)
          drawLine(canvas, color, beginX + magnitudeIncrement, beginY - magnitudeIncrement, beginX + magnitudeIncrement, endY + magnitudeIncrement )
          drawLine(canvas, color, endX - magnitudeIncrement, beginY - magnitudeIncrement, endX - magnitudeIncrement, endY + magnitudeIncrement)
          drawLine(canvas, color, beginX + magnitudeIncrement, endY + magnitudeIncrement, endX - magnitudeIncrement, endY + magnitudeIncrement)
          magnitudeIncrement++
      else
        while magnitudeIncrement < selectedTool.magnitude
          drawLine(canvas, color, beginX - magnitudeIncrement, beginY + magnitudeIncrement, endX + magnitudeIncrement, beginY + magnitudeIncrement)
          drawLine(canvas, color, beginX - magnitudeIncrement, beginY + magnitudeIncrement, beginX - magnitudeIncrement, endY - magnitudeIncrement )
          drawLine(canvas, color, endX + magnitudeIncrement, beginY + magnitudeIncrement, endX + magnitudeIncrement, endY - magnitudeIncrement)
          drawLine(canvas, color, beginX - magnitudeIncrement, endY - magnitudeIncrement, endX + magnitudeIncrement, endY - magnitudeIncrement)
          magnitudeIncrement++
  else
    numberOfIterationsNecessary = 0
    if Math.abs(beginX - endX) > Math.abs(beginY - endY)
      numberOfIterationsNecessary = Math.abs(beginY - endY)
    else
      numberOfIterationsNecessary = Math.abs(beginX - endX)
    magnitudeIncrement = 0
    if (beginX < endX) == (beginY < endY)
      if (beginX < endX)
        while magnitudeIncrement < numberOfIterationsNecessary
          drawLine(canvas, color, beginX + magnitudeIncrement, beginY + magnitudeIncrement, endX - magnitudeIncrement, beginY + magnitudeIncrement)
          drawLine(canvas, color, beginX + magnitudeIncrement, beginY + magnitudeIncrement, beginX + magnitudeIncrement, endY - magnitudeIncrement )
          drawLine(canvas, color, endX - magnitudeIncrement, beginY + magnitudeIncrement, endX - magnitudeIncrement, endY - magnitudeIncrement)
          drawLine(canvas, color, beginX + magnitudeIncrement, endY - magnitudeIncrement, endX - magnitudeIncrement, endY - magnitudeIncrement)
          magnitudeIncrement++
      else
        while magnitudeIncrement < numberOfIterationsNecessary
          drawLine(canvas, color, beginX - magnitudeIncrement, beginY - magnitudeIncrement, endX + magnitudeIncrement, beginY - magnitudeIncrement)
          drawLine(canvas, color, beginX - magnitudeIncrement, beginY - magnitudeIncrement, beginX - magnitudeIncrement, endY + magnitudeIncrement )
          drawLine(canvas, color, endX + magnitudeIncrement, beginY - magnitudeIncrement, endX + magnitudeIncrement, endY + magnitudeIncrement)
          drawLine(canvas, color, beginX - magnitudeIncrement, endY + magnitudeIncrement, endX + magnitudeIncrement, endY + magnitudeIncrement)
          magnitudeIncrement++
    else
      if (endY < beginY)
        while magnitudeIncrement < numberOfIterationsNecessary
          drawLine(canvas, color, beginX + magnitudeIncrement, beginY - magnitudeIncrement, endX - magnitudeIncrement, beginY - magnitudeIncrement)
          drawLine(canvas, color, beginX + magnitudeIncrement, beginY - magnitudeIncrement, beginX + magnitudeIncrement, endY + magnitudeIncrement )
          drawLine(canvas, color, endX - magnitudeIncrement, beginY - magnitudeIncrement, endX - magnitudeIncrement, endY + magnitudeIncrement)
          drawLine(canvas, color, beginX + magnitudeIncrement, endY + magnitudeIncrement, endX - magnitudeIncrement, endY + magnitudeIncrement)
          magnitudeIncrement++
      else
        while magnitudeIncrement < numberOfIterationsNecessary
          drawLine(canvas, color, beginX - magnitudeIncrement, beginY + magnitudeIncrement, endX + magnitudeIncrement, beginY + magnitudeIncrement)
          drawLine(canvas, color, beginX - magnitudeIncrement, beginY + magnitudeIncrement, beginX - magnitudeIncrement, endY - magnitudeIncrement )
          drawLine(canvas, color, endX + magnitudeIncrement, beginY + magnitudeIncrement, endX + magnitudeIncrement, endY - magnitudeIncrement)
          drawLine(canvas, color, beginX - magnitudeIncrement, endY - magnitudeIncrement, endX + magnitudeIncrement, endY - magnitudeIncrement)
          magnitudeIncrement++
