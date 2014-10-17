zoomPosture = [
  (event) ->
    drawInformation(event)
    #updateCursor(event)

  (event) ->
    if not mousePressed
      mousePressed = true
      getMousePositionOnCanvas(event)
      zoomAction(xSpot, ySpot)

  (event) ->
    if mousePressed
      mousePressed = false

  (event) ->
]

