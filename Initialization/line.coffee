###
  drawline is the basic line drawing function. Its a
  bresenham algorithm.
###
drawLine = (canvas, color, beginX, beginY, endX, endY, boldness) ->
  if boldness is undefined
    boldness = false
  deltaX = Math.abs(endX - beginX)
  if beginX < endX
    directionX = 1
  else
    directionX = -1
  deltaY = Math.abs(endY - beginY)
  if beginY < endY
    directionY = 1
  else
    directionY = -1
  if deltaX > deltaY
    errorOne = deltaX/2
  else
    errorOne = -deltaY/2
  keepGoin = true
  while keepGoin
    if not boldness
      putPixel(canvas, color, beginX, beginY)
    else
      drawCircle( canvas, color, beginX, beginY, boldness, true )
    if (beginX == endX) and (beginY == endY)
      keepGoin = false
    errorTwo = errorOne
    if errorTwo > -deltaX
      errorOne -= deltaY
      beginX += directionX
    if errorTwo < deltaY
      errorOne += deltaX
      beginY += directionY

###
  Line action is an elaboration using drawine as well as draw
  circle. The line is made thicker by just drawing several lines,
  with end points expanding away from a center end point. This
  does not create a very 'natural' looking end point, but it does
  make the line bolder. To give the line a more 'natural' end point,
  a filled circle is drawn on each end.
###
lineAction = (canvas, color, beginX, beginY, endX, endY) ->
  doingBoldness = false
  if tH[tH.length - 1].magnitude > 1
    doingBoldness = tH[tH.length - 1].magnitude - 1
  drawLine(canvas, color, beginX, beginY, endX, endY, doingBoldness)

