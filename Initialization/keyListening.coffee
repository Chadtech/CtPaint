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
    resizeAction()
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
