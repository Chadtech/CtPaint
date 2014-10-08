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

keyListeningUnderNormalCircumstance = (event) ->
  if event.keyCode is keysToKeyCodes['1']
    tH.push ctPaintTools[0]
    tH.shift()
    drawToolbars()
    copeWithSelection()
  if event.keyCode is keysToKeyCodes['2']
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
  if event.keyCode is keysToKeyCodes['x']
    cutAction()
  if event.keyCode is keysToKeyCodes['y']
    redoAction()
  if event.keyCode is keysToKeyCodes['z']
    undoAction()
  if event.keyCode is keysToKeyCodes['right']
    if canvasWidth > (window.innerWidth - toolbarWidth - 5)
      if (-1 * canvasXOffset) < ((canvasWidth + 10) - (window.innerWidth - toolbarWidth))
        canvasXOffset -= 3
        positionCanvas()
        positionCorners()
  if event.keyCode is keysToKeyCodes['left']
    if canvasWidth > (window.innerWidth - toolbarWidth - 5)
      if canvasXOffset < 0
        canvasXOffset += 3
        positionCanvas()
        positionCorners()
  if event.keyCode is keysToKeyCodes['backspace']
    if areaSelected
      areaSelected = false
      

keyListeningUnderAbnormalCircumstance = (event) ->
  switch event.keyCode
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
    when keysToKeyCodes['x'] then 'x'
    when keysToKeyCodes['y'] then 'y'
    when keysToKeyCodes['backspace'] then 'backspace'
    when keysToKeyCodes['left'] then 'left'
    when keysToKeyCodes['right'] then 'right'
    when keysToKeyCodes['enter'] then 'enter'

