###
  Put pixel is a basic drawing function. A pixel of a given
  color is placed on the canvas as the location given. 
  The color is given as an rgb array, and translated into
  image data.
###
putPixel = (canvas, color, whereAtX, whereAtY) ->
  newPixel = canvas.createImageData(1,1)
  newPixelsColor = newPixel.data
  newPixelsColor[0] = color[0]
  newPixelsColor[1] = color[1]
  newPixelsColor[2] = color[2]
  newPixelsColor[3] = 255
  canvas.putImageData(newPixel, whereAtX, whereAtY)

###
  Ironically point action does not utilize the put pixel
  function. Line and circle drawing form the basis of
  the point tool. Should putpixel be used to put a pixel
  where the mouse is clicked, the user could not draw
  strokes. The browser does not register mouse location 
  fast enough. This results in distantly spaced specks, as
  the mouse might travel 10 or 20 pixels between putpixel
  actions.

  Instad, lines are drawn. When the typical user decides
  to change one pixel, they are actually drawing a line
  of length 1. When strokes are made, the past location
  of the mouse is continuously remembered, and a line
  is drawn from that location to the present location.

  When the magnitude of the point tool is increased,
  it instead continuously draws circles instead of
  points.
###
pointAction = (canvas, color, beginX, beginY, endX, endY) ->
  if tH[tH.length - 1].magnitude < 2
    drawLine(canvas, color, beginX, beginY, endX, endY)
  else
    magnitudeIncrement = 0
    while magnitudeIncrement < tH[tH.length - 1].magnitude
      drawLine(canvas, color, beginX + magnitudeIncrement, beginY, endX + magnitudeIncrement, endY)
      drawLine(canvas, color, beginX - magnitudeIncrement, beginY, endX - magnitudeIncrement, endY)
      drawLine(canvas, color, beginX, beginY + magnitudeIncrement, endX, endY + magnitudeIncrement)
      drawLine(canvas, color, beginX, beginY - magnitudeIncrement, endX, endY - magnitudeIncrement)
      magnitudeIncrement++
  if tH[tH.length - 1].magnitude > 1
    calculatedRadius = (tH[tH.length - 1].magnitude - 2)
    magnitudeIncrement = 0
    while magnitudeIncrement < calculatedRadius
      drawCircle( canvas, color, beginX, beginY, calculatedRadius - magnitudeIncrement, true )
      drawCircle( canvas, color, endX, endY, calculatedRadius - magnitudeIncrement, true )
      magnitudeIncrement++
    
    