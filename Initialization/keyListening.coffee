###
  These functions handle key presses. Under abnormal circumstances,
  such as when a menu is up, the keys do not trigger the same events.
  When a menu is up for example, the '1' must input data, instead of
  act as a shortkey for the zoom tool.

  Since the kinds of abnormal conditions are various, the function
  keyListeningUnderAbnormalCircumstances simply passed a string
  of the key pressed. The function act as the argument in a data
  sorting function corresponding to a menu, and referenced by
  whatSortOfDataSorting.
###
keyListeningUnderNormalCircumstance = [
  (event) ->
    if event.keyCode is keysToKeyCodes['1']
      tH.push ctPaintTools[0]
      tH.shift()
      drawToolbars()
      copeWithSelection()
    if event.keyCode is keysToKeyCodes['2']
      coverUpOldCursor()
      tH.push ctPaintTools[1]
      tH.shift()
      drawToolbars()
      copeWithSelection()
    if event.keyCode is keysToKeyCodes['3']
      tH.push ctPaintTools[2]
      tH.shift()
      drawToolbars()
      copeWithSelection()
    if event.keyCode is keysToKeyCodes['4']
      tH.push ctPaintTools[3]
      tH.shift()
      drawToolbars()
      copeWithSelection()
    if event.keyCode is keysToKeyCodes['5']
      tH.push ctPaintTools[4]
      tH.shift()
      drawToolbars()
      copeWithSelection()
    if event.keyCode is keysToKeyCodes['6']
      tH.push ctPaintTools[5]
      tH.shift()
      drawToolbars()
      copeWithSelection()
    if event.keyCode is keysToKeyCodes['7']
      tH.push ctPaintTools[6]
      tH.shift()
      drawToolbars()
      copeWithSelection()
    if event.keyCode is keysToKeyCodes['8']
      tH.push ctPaintTools[7]
      tH.shift()
      drawToolbars()
      copeWithSelection()
    if event.keyCode is keysToKeyCodes['a']
      allAction()
    if event.keyCode is keysToKeyCodes['b']
      verticalColorSwap()
    if event.keyCode is keysToKeyCodes['c']
      copyAction()
    if event.keyCode is keysToKeyCodes['d']
      replaceAction()
    if event.keyCode is keysToKeyCodes['e']
      resizeAction()
    if event.keyCode is keysToKeyCodes['f']
      flipAction()
    if event.keyCode is keysToKeyCodes['g']
      cursorColorAction()
    if event.keyCode is keysToKeyCodes['i']
      invertAction()
    if event.keyCode is keysToKeyCodes['q']
      horizontalColorSwap()
    if event.keyCode is keysToKeyCodes['r']
      rotateAction()
    if event.keyCode is keysToKeyCodes['v']
      pasteAction()
    if event.keyCode is keysToKeyCodes['w']
      scaleAction()
    if event.keyCode is keysToKeyCodes['x']
      cutAction()
    if event.keyCode is keysToKeyCodes['y']
      redoAction()
    if event.keyCode is keysToKeyCodes['z']
      undoAction()

    if event.keyCode is keysToKeyCodes['up']
      if not zoomActivate
        if canvasHeight > (window.innerHeight - toolbarHeight - 5)
          if canvasYOffset < 0 
            canvasYOffset += 9
            positionCanvas()
      else
        if ( zoomRootY - ( ( 9 // zoomFactor ) + 2) ) > 0
          canvasYPos += zoomRootY * zoomFactor
          zoomRootY -= ( 9 // zoomFactor ) + 2
          canvasYPos -= (zoomRootY * zoomFactor)
          positionCanvas()
          updateCursor()

    if event.keyCode is keysToKeyCodes['down']
      if not zoomActivate
        if canvasHeight > (window.innerHeight - toolbarHeight - 5)
          if (-1 * canvasYOffset) < ((canvasHeight + 10) - (window.innerHeight - toolbarHeight))
            canvasYOffset -= 9
            positionCanvas()
      else
        bottomEdge = (canvasHeight - (window.innerHeight - toolbarHeight) // zoomFactor)
        if ( zoomRootY + ( ( 9 // zoomFactor ) + 2) ) < (bottomEdge + 2)
          canvasYPos += zoomRootY * zoomFactor
          zoomRootY += ( 9 // zoomFactor ) + 2
          canvasYPos -= (zoomRootY * zoomFactor)
          positionCanvas()
          updateCursor()

    if event.keyCode is keysToKeyCodes['left']
      if not zoomActivate
        if canvasWidth > (window.innerWidth - toolbarWidth - 5)
          if canvasXOffset < 0 
            canvasXOffset += 9
            positionCanvas()
      else
        if ( zoomRootX - ( ( 9 // zoomFactor ) + 2) ) > 0
          canvasXPos += zoomRootX * zoomFactor
          zoomRootX -= ( 9 // zoomFactor ) + 2
          canvasXPos -= (zoomRootX * zoomFactor)
          positionCanvas()
          updateCursor()

    if event.keyCode is keysToKeyCodes['right']
      if not zoomActivate
        if canvasWidth > (window.innerWidth - toolbarWidth - 5)
          if (-1 * canvasXOffset) < ((canvasWidth + 10) - (window.innerWidth - toolbarWidth))
            canvasXOffset -= 9
            positionCanvas()
      else
        sideEdge = (canvasWidth - (window.innerWidth - toolbarWidth) // zoomFactor)
        if ( zoomRootX + ( ( 9 // zoomFactor ) + 2) ) < (sideEdge + 2)
          canvasXPos += zoomRootX * zoomFactor
          zoomRootX += ( 9 // zoomFactor ) + 2
          canvasXPos -= (zoomRootX * zoomFactor)
          positionCanvas()
          updateCursor()
          
    if event.keyCode is keysToKeyCodes['backspace']
      if areaSelected
        areaSelected = false
        canvasDataAsImage = new Image()
        canvasDataAsImage.onload = ->
          ctContext.drawImage(canvasDataAsImage,0,0)
          cH.push ctCanvas.toDataURL()
          cH.shift()
          cF = []
        canvasDataAsImage.src = canvasHoldover
]
 
justPassTheCharacter = (keyPressed) ->
  switch keyPressed
    when keysToKeyCodes['0'] then '0'
    when keysToKeyCodes['1'] then '1'
    when keysToKeyCodes['2'] then '2'
    when keysToKeyCodes['3'] then '3'
    when keysToKeyCodes['4'] then '4'
    when keysToKeyCodes['5'] then '5'
    when keysToKeyCodes['6'] then '6'
    when keysToKeyCodes['7'] then '7'
    when keysToKeyCodes['8'] then '8'
    when keysToKeyCodes['9'] then '9'
    when keysToKeyCodes['a'] then 'a'
    when keysToKeyCodes['b'] then 'b'
    when keysToKeyCodes['c'] then 'c'
    when keysToKeyCodes['d'] then 'd'
    when keysToKeyCodes['e'] then 'e'
    when keysToKeyCodes['f'] then 'f'
    when keysToKeyCodes['n'] then 'n'
    when keysToKeyCodes['x'] then 'x'
    when keysToKeyCodes['y'] then 'y'
    when keysToKeyCodes['backspace'] then 'backspace'
    when keysToKeyCodes['left'] then 'left'
    when keysToKeyCodes['right'] then 'right'
    when keysToKeyCodes['enter'] then 'enter'

keyListeningUnderAbnormalCircumstance = [
  (event) ->
    justPassTheCharacter( event.keyCode )
  (event) ->
    justPassTheCharacter( event.keyCode )
]

