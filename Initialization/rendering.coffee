###
  Figure out where to put the canvas
###
positionCanvas = ->
  $('#ctpaintDiv').css('top', (canvasYPos+canvasYOffset).toString())
  $('#ctpaintDiv').css('left',(canvasXPos+canvasXOffset).toString())

getMousePositionOnCanvas = (event) ->
  if not zoomActivate
    xSpot = event.clientX - canvasXPos - canvasXOffset
    ySpot = event.clientY - canvasYPos - canvasYOffset
  else
    xSpot = event.clientX - toolbarWidth
    ySpot = event.clientY

    xSpot = xSpot // zoomFactor
    ySpot = ySpot // zoomFactor

    xSpot += zoomRootX
    ySpot += zoomRootY

setCasualPosition = (event) ->
  if not zoomActivate
    casualX = event.clientX - canvasXPos - canvasXOffset
    casualY = event.clientY - canvasYPos - canvasYOffset
  else
    casualX = event.clientX - toolbarWidth
    casualY = event.clientY

    casualX = casualX // zoomFactor
    casualY = casualY // zoomFactor

    casualX += zoomRootX
    casualY += zoomRootY

###
  Only done at the very initialization of CtPaint.
###
prepareCanvas = ->
  ctContext.canvas.width = canvasWidth
  ctContext.canvas.height = canvasHeight

  ctContext.fillStyle = '#000000'
  ctContext.fillRect(0,0,canvasWidth,canvasHeight)

  positionCanvas()

###
  Position the menu div. The menu is un-(de?)-initialized
  by just putting the menu off screen and switching tools
  (ending the menus functionality)
###
positionMenu = () ->
  if not menuUp
    $('#menuDiv').css('top',(window.innerHeight + 100).toString())

setCanvasSizes = ->
  toolbar0Context.canvas.width = toolbarWidth
  toolbar0Context.canvas.height = window.innerHeight-toolbarHeight

  toolbar1Context.canvas.width = window.innerWidth
  toolbar1Context.canvas.height = toolbarHeight

  backgroundContext.canvas.width = window.innerWidth
  backgroundContext.canvas.height = window.innerHeight

placeToolbars = ->
  $('#toolbar0Div').css('top', '0')
  $('#toolbar1Div').css('top', (window.innerHeight-toolbarHeight).toString())

drawToolbars = ->
  toolbar0Context.fillStyle = '#202020'
  toolbar0Context.fillRect(0, 0, toolbarWidth, window.innerHeight - toolbarHeight)
  toolbar0Context.drawImage(toolbar0sImages[toolViewMode], 0, 0)
  almostWindowHeight =  window.innerHeight - toolbarHeight
  drawLine(toolbar0Context, [16, 20, 8], toolbarWidth - 1, 0, toolbarWidth - 1, almostWindowHeight)
  toolbar0Context.drawImage(
    tH[tH.length - 1].pressedImage[toolViewMode]
    tH[tH.length - 1].clickRegion[0],
    tH[tH.length - 1].clickRegion[1])

  ###
    The following code looks at the condition of the state-sensitive tool icons (fancy and 
    solid-capable tools). The relevant tools are square, circle, line, and point.

    Each section, for square, circle, line and point, is identical. So I have therefore
    only commented the square section. The comments should be equally explainatory for the 
    other tools.
  ###

  # Only if the view mode is pictoral, and...
  if toolViewMode is 0
    # If the current tool is the square tool
    if tH[tH.length - 1].name is 'square'
      # and its not in fill mode
      if not tH[tH.length - 1].mode
        # draw the icon reflecting its current magnitude and selection state
        theImage = fancyResponsiveIcons['square'][1][tH[tH.length - 1].magnitude - 1]
        iconX = tH[tH.length - 1].clickRegion[0]
        iconY = tH[tH.length - 1].clickRegion[1]
        toolbar0Context.drawImage( theImage, iconX, iconY)
      # and it is in fill mode
      else
        # draw the icon reflecting that its filled and selected
        theImage = solidIcons['square'][1]
        iconX = tH[tH.length - 1].clickRegion[0]
        iconY = tH[tH.length - 1].clickRegion[1]
        toolbar0Context.drawImage( theImage, iconX, iconY)
    # If the current tool is not square  
    else
      # and sqaure isnt in fill mode
      if not ctPaintTools[toolsToNumbers['square']].mode
        # but square's mangitude is still greater than one
        if ctPaintTools[toolsToNumbers['square']].magnitude > 1
          # draw its unselected icon in that magnitude
          theImage = 
            fancyResponsiveIcons['square'][0][ctPaintTools[toolsToNumbers['square']].magnitude - 1]
          iconX = ctPaintTools[toolsToNumbers['square']].clickRegion[0]
          iconY = ctPaintTools[toolsToNumbers['square']].clickRegion[1]
          toolbar0Context.drawImage( theImage, iconX, iconY)
      # and square is in fill mode
      else
        theImage = solidIcons['square'][0]
        iconX = ctPaintTools[toolsToNumbers['square']].clickRegion[0]
        iconY = ctPaintTools[toolsToNumbers['square']].clickRegion[1]
        toolbar0Context.drawImage( theImage, iconX, iconY)

    # If the current tool is the circle tool ...
    if tH[tH.length - 1].name is 'circle'
      if not tH[tH.length - 1].mode
        theImage = fancyResponsiveIcons['circle'][1][tH[tH.length - 1].magnitude - 1]
        iconX = tH[tH.length - 1].clickRegion[0]
        iconY = tH[tH.length - 1].clickRegion[1]
        toolbar0Context.drawImage( theImage, iconX, iconY )
      else
        theImage = solidIcons['circle'][1]
        iconX = tH[tH.length - 1].clickRegion[0]
        iconY = tH[tH.length - 1].clickRegion[1]
        toolbar0Context.drawImage( theImage, iconX, iconY)
    else
      if not ctPaintTools[toolsToNumbers['circle']].mode
        if ctPaintTools[toolsToNumbers['circle']].magnitude > 1
          theImage = 
            fancyResponsiveIcons['circle'][0][ctPaintTools[toolsToNumbers['circle']].magnitude - 1]
          iconX = ctPaintTools[toolsToNumbers['circle']].clickRegion[0]
          iconY = ctPaintTools[toolsToNumbers['circle']].clickRegion[1]
          toolbar0Context.drawImage( theImage, iconX, iconY)
      else
        theImage = solidIcons['circle'][0]
        iconX = ctPaintTools[toolsToNumbers['circle']].clickRegion[0]
        iconY = ctPaintTools[toolsToNumbers['circle']].clickRegion[1]
        toolbar0Context.drawImage( theImage, iconX, iconY)

    if tH[tH.length - 1].name is 'zoom'
      theImage = fancyResponsiveIcons['zoom'][1][tH[tH.length - 1].magnitude - 1]
      iconX = tH[tH.length - 1].clickRegion[0]
      iconY = tH[tH.length - 1].clickRegion[1]
      toolbar0Context.drawImage( theImage, iconX, iconY )
    else
      if ctPaintTools[toolsToNumbers['zoom']].magnitude > 1
        theImage = 
          fancyResponsiveIcons['zoom'][0][ctPaintTools[toolsToNumbers['zoom']].magnitude - 1]
        iconX = ctPaintTools[toolsToNumbers['zoom']].clickRegion[0]
        iconY = ctPaintTools[toolsToNumbers['zoom']].clickRegion[1]
        toolbar0Context.drawImage( theImage, iconX, iconY)

   if tH[tH.length - 1].name is 'select'
      if tH[tH.length - 1].mode
        theImage = solidIcons['select'][1]
        iconX = tH[tH.length - 1].clickRegion[0]
        iconY = tH[tH.length - 1].clickRegion[1]
        toolbar0Context.drawImage( theImage, iconX, iconY)
    else
      if ctPaintTools[toolsToNumbers['select']].mode
        theImage = solidIcons['select'][0]
        iconX = ctPaintTools[toolsToNumbers['select']].clickRegion[0]
        iconY = ctPaintTools[toolsToNumbers['select']].clickRegion[1]
        toolbar0Context.drawImage( theImage, iconX, iconY)

    if tH[tH.length - 1].name is 'line'
      theImage = fancyResponsiveIcons['line'][1][tH[tH.length - 1].magnitude - 1]
      iconX = tH[tH.length - 1].clickRegion[0]
      iconY = tH[tH.length - 1].clickRegion[1]
      toolbar0Context.drawImage( theImage, iconX, iconY )
    else
      if ctPaintTools[toolsToNumbers['line']].magnitude > 1
        theImage = 
          fancyResponsiveIcons['line'][0][ctPaintTools[toolsToNumbers['line']].magnitude - 1]
        iconX = ctPaintTools[toolsToNumbers['line']].clickRegion[0]
        iconY = ctPaintTools[toolsToNumbers['line']].clickRegion[1]
        toolbar0Context.drawImage( theImage, iconX, iconY)

    if tH[tH.length - 1].name is 'point'
      theImage = fancyResponsiveIcons['point'][1][tH[tH.length - 1].magnitude - 1]
      iconX = tH[tH.length - 1].clickRegion[0]
      iconY = tH[tH.length - 1].clickRegion[1]
      toolbar0Context.drawImage( theImage, iconX, iconY )
    else
      if ctPaintTools[toolsToNumbers['point']].magnitude > 1
        theImage = 
          fancyResponsiveIcons['point'][0][ctPaintTools[toolsToNumbers['point']].magnitude - 1]
        iconX = ctPaintTools[toolsToNumbers['point']].clickRegion[0]
        iconY = ctPaintTools[toolsToNumbers['point']].clickRegion[1]
        toolbar0Context.drawImage( theImage, iconX, iconY)

  toolbar1Context.fillStyle = '#202020'
  toolbar1Context.fillRect(0,0,window.innerWidth,toolbarHeight)

  toolbar1Context.drawImage(toolbar1sImage0, 3, 2)
  drawLine(toolbar1Context, [16, 20, 8], toolbarWidth - 1, 0, window.innerWidth, 0)
  toolbar1Context.drawImage(toolbar1sImage1, toolbar1sImage0.width + 5, 3)
  toolbar1Context.drawImage(toolbar1sImage1, toolbar1sImage0.width + toolbar1sImage1.width + 17, 3)
  drawLine(toolbar1Context, [16, 20, 8], toolbarWidth - 1, 0, window.innerWidth, 0)
  toolbar1Context.drawImage(ct, window.innerWidth - 35, 2)

  toolbar1Context.fillStyle = rgbToHex(colorSwatches[0])
  toolbar1Context.fillRect(7, 4, 14, 14)

  toolbar1Context.fillStyle = rgbToHex(colorSwatches[1])
  toolbar1Context.fillRect(24, 4, 14, 14)

  toolbar1Context.fillStyle = rgbToHex(colorSwatches[2])
  toolbar1Context.fillRect(16, 21, 14, 14)

  toolbar1Context.fillStyle = rgbToHex(colorSwatches[3])
  toolbar1Context.fillRect(33, 21, 14, 14)

  paletteIndex = 0
  while paletteIndex < colorPalette.length
    toolbar1Context.fillStyle = rgbToHex(colorPalette[paletteIndex])
    toolbar1Context.fillRect(52 + (17 * (paletteIndex // 2)), 4 + (17 * (paletteIndex % 2)), 14, 14)
    paletteIndex++

updateCursor = (event)->
  coverUpOldCursor()
  if not zoomActivate
    cursorX = event.clientX - canvasXPos - canvasXOffset
    cursorY = event.clientY - canvasYPos - canvasYOffset
  else
    cursorX = event.clientX - toolbarWidth
    cursorY = event.clientY

    cursorX = cursorX // zoomFactor
    cursorY = cursorY // zoomFactor

    cursorX += zoomRootX
    cursorY += zoomRootY

  updateOldCursor()
  oldCursorX = cursorX
  oldCursorY = cursorY
  putPixel( ctContext, colorOfCursorPixel, cursorX, cursorY)

coverUpOldCursor = ->
  if oldCursorsColor isnt undefined
    putPixel( ctContext, oldCursorsColor.data, oldCursorX, oldCursorY )

updateOldCursor = ->
  oldCursorsColor = ctContext.getImageData(cursorX, cursorY, 1, 1)

refreshCursor = ( particularColor ) ->
  if particularColor isnt undefined
    putPixel( ctContext, particularColor, cursorX, cursorY )
  else
    putPixel( ctContext, colorOfCursorPixel, cursorX, cursorY )

drawInformation = ( event, extraInformation ) ->
  toolbar1Context.drawImage(toolbar1sImage1, toolbar1sImage0.width + 5, 3) 
  if extraInformation is undefined
    extraInformation = ''
  toolbar1Context.drawImage(toolbar1sImage1, toolbar1sImage0.width + 5, 3)
  toolbar1Context.drawImage(toolbar1sImage1, toolbar1sImage0.width + toolbar1sImage1.width + 17, 3)

  if not zoomActivate 
    xPos = event.clientX - canvasXPos - canvasXOffset
    yPos = event.clientY - canvasYPos - canvasYOffset
  else
    xPos = event.clientX - toolbarWidth
    yPos = event.clientY

    xPos = xPos // zoomFactor
    yPos = yPos // zoomFactor

    xPos += zoomRootX
    yPos += zoomRootY

  colorValue = getColorValue(ctContext, xPos, yPos).toUpperCase()
  coordinates = ', (' + xPos.toString() + ', ' + yPos.toString() + ')'
  colorAndCoordinates = colorValue + coordinates
  drawStringAsCommandPrompt(toolbar1Context, colorAndCoordinates, 0, toolbar1sImage0.width + 7, 12)
  drawStringAsCommandPrompt(toolbar1Context, 
    extraInformation, 
    0, 
    toolbar1sImage0.width + toolbar1sImage1.width + 19, 
    12) 

historyUpdate = ->
  cH.push ctCanvas.toDataURL()
  cH.shift()
  cF = []

copeWithSelection = ()->
  copeX = selectionX
  copeY = selectionY
  if areaSelected
    areaSelected = false
    canvasDataAsImage = new Image()
    canvasDataAsImage.onload = ->
      ctContext.drawImage(canvasDataAsImage, 0, 0)
      ctContext.putImageData(selection, copeX, copeY)
      cH.push ctCanvas.toDataURL()
      cH.shift()
      cF = []
    canvasDataAsImage.src = cH[cH.length - 1]

#makeTransparent = () ->
#  if areaSelected












