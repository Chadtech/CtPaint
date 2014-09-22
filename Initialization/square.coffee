squareAction = (canvas, color, beginX, beginY, endX, endY, fillOrNot) ->
  if not tH[tH.length - 1].mode and not fillOrNot
    magnitudeIncrement = 0
    if (beginX < endX) == (beginY < endY)
      if (beginX < endX)
        while magnitudeIncrement < tH[tH.length - 1].magnitude
          mi = magnitudeIncrement
          drawLine(canvas, color, beginX + mi, beginY + mi, endX - mi, beginY + mi)
          drawLine(canvas, color, beginX + mi, beginY + mi, beginX + mi, endY - mi )
          drawLine(canvas, color, endX - mi, beginY + mi, endX - mi, endY - mi)
          drawLine(canvas, color, beginX + mi, endY - mi, endX - mi, endY - mi)
          magnitudeIncrement++
      else
        while magnitudeIncrement < tH[tH.length - 1].magnitude
          mi = magnitudeIncrement
          drawLine(canvas, color, beginX - mi, beginY - mi, endX + mi, beginY - mi)
          drawLine(canvas, color, beginX - mi, beginY - mi, beginX - mi, endY + mi )
          drawLine(canvas, color, endX + mi, beginY - mi, endX + mi, endY + mi)
          drawLine(canvas, color, beginX - mi, endY + mi, endX + mi, endY + mi)
          magnitudeIncrement++
    else
      if (endY < beginY)
        while magnitudeIncrement < tH[tH.length - 1].magnitude
          mi = magnitudeIncrement
          drawLine(canvas, color, beginX + mi, beginY - mi, endX - mi, beginY - mi)
          drawLine(canvas, color, beginX + mi, beginY - mi, beginX + mi, endY + mi )
          drawLine(canvas, color, endX - mi, beginY - mi, endX - mi, endY + mi)
          drawLine(canvas, color, beginX + mi, endY + mi, endX - mi, endY + mi)
          magnitudeIncrement++
      else
        while magnitudeIncrement < tH[tH.length - 1].magnitude
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
    if (beginX < endX) == (beginY < endY)
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

