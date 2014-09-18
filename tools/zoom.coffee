zoomAction = ->
  ###
  If the user zooms in while the canvas width or height exceeds 256, the css anti aliasing 
  will be turned on. No idea why.

  New solution idea : destroy the canvas when it is scaled bigger, 
  and paste data onto a new canvas
  ###
  if zoomActivate
    zoomActivate = false
    cornersVisible = true
    ctCanvas.style.width = (canvasWidth).toString()+'px'
    ctCanvas.style.height = (canvasHeight).toString()+'px'
  else
    zoomActivate = true
    cornersVisible = false
    scaleCanvasBigger( 2 ** selectedTool.magnitude )
  selectedTool = previouslySelectedTool
  positionCorners()
  drawToolbars()