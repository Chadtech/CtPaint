keyListeningUnderNormalCircumstance = (event) ->
  if event.keyCode == keysToKeyCodes['1']
    previouslySelectedTool = selectedTool
    selectedTool = ctPaintTools[0]
    drawToolbars()
  if event.keyCode == keysToKeyCodes['2']
    previouslySelectedTool = selectedTool
    selectedTool = ctPaintTools[1]
    drawToolbars()
  if event.keyCode == keysToKeyCodes['3']
    previouslySelectedTool = selectedTool
    selectedTool = ctPaintTools[2]
    drawToolbars()
  if event.keyCode == keysToKeyCodes['4']
    previouslySelectedTool = selectedTool
    selectedTool = ctPaintTools[3]
    drawToolbars()
  if event.keyCode == keysToKeyCodes['5']
    previouslySelectedTool = selectedTool
    selectedTool = ctPaintTools[4]
    drawToolbars()
  if event.keyCode == keysToKeyCodes['6']
    previouslySelectedTool = selectedTool
    selectedTool = ctPaintTools[5]
    drawToolbars()
  if event.keyCode == keysToKeyCodes['7']
    previouslySelectedTool = selectedTool
    selectedTool = ctPaintTools[6]
    drawToolbars()
  if event.keyCode == keysToKeyCodes['8']
    previouslySelectedTool = selectedTool
    selectedTool = ctPaintTools[7]
    drawToolbars()
  if event.keyCode == keysToKeyCodes['e']
    ctPaintTools[15].toolsAction()
  if event.keyCode == keysToKeyCodes['q']
    horizontalColorSwap()
  if event.keyCode == keysToKeyCodes['b']
    verticalColorSwap()
  if event.keyCode == keysToKeyCodes['right']
    if canvasWidth > (window.innerWidth - toolbarWidth - 5)
      if (-1 * canvasXOffset) < ((canvasWidth + 10) - (window.innerWidth - toolbarWidth))
        canvasXOffset-=3
        positionCanvas()
        positionCorners()
  if event.keyCode == keysToKeyCodes['left']
    if canvasWidth > (window.innerWidth - toolbarWidth - 5)
      if canvasXOffset < 0
        canvasXOffset+=3
        positionCanvas()
        positionCorners()

keyListeningUnderAbnormalCircumstance = (event) ->
  switch event.keyCode
    when keysToKeyCodes['0']
      return '0'
    when keysToKeyCodes['1']
      return '1'
    when keysToKeyCodes['2']
      return '2'
    when keysToKeyCodes['3']
      return '3'
    when keysToKeyCodes['4']
      return '4'
    when keysToKeyCodes['5']
      return '5'
    when keysToKeyCodes['6']
      return '6'
    when keysToKeyCodes['7']
      return '7'
    when keysToKeyCodes['8']
      return '8'
    when keysToKeyCodes['9']
      return '9'
    when keysToKeyCodes['a']
      return 'a'
    when keysToKeyCodes['b']
      return 'b'
    when keysToKeyCodes['c']
      return 'c'
    when keysToKeyCodes['d']
      return 'd'
    when keysToKeyCodes['e']
      return 'e'
    when keysToKeyCodes['f']
      return 'f'
    when keysToKeyCodes['x']
      return 'x'
    when keysToKeyCodes['y']
      return 'y'
    when keysToKeyCodes['backspace']
      return 'backspace'
    when keysToKeyCodes['left']
      return 'left'
    when keysToKeyCodes['right']
      return 'right'
    when keysToKeyCodes['enter']
      return 'enter'
