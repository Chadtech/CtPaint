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
  if event.keyCode == keysToKeyCodes['1']
    tH.push ctPaintTools[0]
    tH.shift()
    drawToolbars()
    copeWithSelection()
  if event.keyCode == keysToKeyCodes['2']
    tH.push ctPaintTools[1]
    tH.shift()
    drawToolbars()
    copeWithSelection()
  if event.keyCode == keysToKeyCodes['3']
    tH.push ctPaintTools[2]
    tH.shift()
    drawToolbars()
    copeWithSelection()
  if event.keyCode == keysToKeyCodes['4']
    tH.push ctPaintTools[3]
    tH.shift()
    drawToolbars()
    copeWithSelection()
  if event.keyCode == keysToKeyCodes['5']
    tH.push ctPaintTools[4]
    tH.shift()
    drawToolbars()
    copeWithSelection()
  if event.keyCode == keysToKeyCodes['6']
    tH.push ctPaintTools[5]
    tH.shift()
    drawToolbars()
    copeWithSelection()
  if event.keyCode == keysToKeyCodes['7']
    tH.push ctPaintTools[6]
    tH.shift()
    drawToolbars()
    copeWithSelection()
  if event.keyCode == keysToKeyCodes['8']
    tH.push ctPaintTools[7]
    tH.shift()
    drawToolbars()
    copeWithSelection()
  if event.keyCode == keysToKeyCodes['b']
    verticalColorSwap()
  if event.keyCode == keysToKeyCodes['c']
    copyAction()
  if event.keyCode == keysToKeyCodes['d']
    replaceAction()
  if event.keyCode == keysToKeyCodes['e']
    resizeAction()
  if event.keyCode == keysToKeyCodes['f']
    flipAction()
  if event.keyCode == keysToKeyCodes['i']
    invertAction()
  if event.keyCode == keysToKeyCodes['q']
    horizontalColorSwap()
  if event.keyCode == keysToKeyCodes['v']
    pasteAction()

  if event.keyCode == keysToKeyCodes['right']
    if canvasWidth > (window.innerWidth - toolbarWidth - 5)
      if (-1 * canvasXOffset) < ((canvasWidth + 10) - (window.innerWidth - toolbarWidth))
        canvasXOffset -= 3
        positionCanvas()
        positionCorners()
  if event.keyCode == keysToKeyCodes['left']
    if canvasWidth > (window.innerWidth - toolbarWidth - 5)
      if canvasXOffset < 0
        canvasXOffset += 3
        positionCanvas()
        positionCorners()

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

