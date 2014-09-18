# organized as they are in the 2 x 11 tool bar grid
toolNames = [
  'zoom', 'select'
  'sample', 'fill'
  'square', 'circle'
  'line', 'point'
  'NOT A TOOL', 'NOT A TOOL'
  'flip', 'rotate'
  'invert', 'displace'
  'scale', 'resize'
  'horizontalSwap', 'verticalSwap'
  'copy', 'paste'
  'cut', 'view'
  'undo', 'redo'
]

toolMaxMagnitudes = [
  4, ''
  '', ''
  15, 15
  6, 9

  '', ''

  '', ''
  '', ''
  '', ''
  '', ''
  '', ''
  '', ''
  '', ''
]

toolModeCapacity = [
  false, true
  false, false
  true, true
  false, false

  false, false

  false, false
  false, false
  false, false
  false, false
  false, false
  false, false
  false, false
]

toolMenuImages = [
  '', ''
  '', ''
  '', ''
  '', ''

  '', ''

  new Image(), new Image()
  '', new Image()
  new Image(), new Image()
  '', ''
  '', ''
  '', ''
  '', ''
]

ctPaintTools = {}

iteration = 0
while iteration < numberOfTools
  thisIteration = iteration
  ctPaintTools[iteration] =
    number: iteration
    name: toolNames[iteration]
    clickRegion: [((iteration%2)*25),(Math.floor(iteration/2))*25]
    pressedImage: [new Image(), new Image()]
    magnitude: 1
    maxMagnitude: toolMaxMagnitudes[iteration]
    modeCapable: toolModeCapacity[iteration]
    mode: false
    menuImage: toolMenuImages[iteration]
    toolsAction: ->
      console.log 'did a '+toolNames[@number]
  ctPaintTools[iteration].pressedImage[0].src = 'assets\\u'+zeroPadder(iteration,2)+'.PNG'
  ctPaintTools[iteration].pressedImage[1].src = 'assets\\v'+zeroPadder(iteration,2)+'.PNG'
  iteration++

ctPaintTools[0].toolsAction = zoomAction
ctPaintTools[1].toolsAction = selectAction
ctPaintTools[3].toolsAction = fillAction
ctPaintTools[4].toolsAction = squareAction
ctPaintTools[5].toolsAction = circleAction
ctPaintTools[6].toolsAction = lineAction
ctPaintTools[7].toolsAction = pointAction
ctPaintTools[10].toolsAction = flipAction
ctPaintTools[10].menuImage.src = 'assets\\t01.png'
ctPaintTools[11].toolsAction = rotateAction
ctPaintTools[11].menuImage.src = 'assets\\t04.png'
ctPaintTools[12].toolsAction = invertAction
ctPaintTools[13].toolsAction = replaceAction
ctPaintTools[13].menuImage.src = 'assets\\t02.png'
ctPaintTools[14].toolsAction = scaleAction
ctPaintTools[14].menuImage.src = 'assets\\t05.png'
ctPaintTools[15].toolsAction = resizeAction
ctPaintTools[15].menuImage.src = 'assets\\t03.png'
ctPaintTools[16].toolsAction = horizontalColorSwap
ctPaintTools[17].toolsAction = verticalColorSwap