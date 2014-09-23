# organized as they are in the 2 x 11 tool bar grid
toolNames = [
  'zoom', 'select'
  'sample', 'fill'
  'square', 'circle'
  'line', 'point'
  'NOT A TOOL0', 'NOT A TOOL1'
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
    posture: ''
    menuImage: toolMenuImages[iteration]
    toolsAction: ->
      console.log 'did a '+toolNames[@number]
  ctPaintTools[iteration].pressedImage[0].src = 'assets\\u'+zeroPadder(iteration,2)+'.PNG'
  ctPaintTools[iteration].pressedImage[1].src = 'assets\\v'+zeroPadder(iteration,2)+'.PNG'
  iteration++

ctPaintTools[0].posture = zoomPosture
ctPaintTools[1].posture = selectPosture
ctPaintTools[2].posture = samplePosture
ctPaintTools[3].posture = fillPosture
ctPaintTools[4].posture = squarePosture
ctPaintTools[5].posture = circlePosture
ctPaintTools[6].posture = linePosture
ctPaintTools[7].posture = pointPosture
ctPaintTools[10].posture = emptyPosture
ctPaintTools[11].posture = emptyPosture
ctPaintTools[12].posture = emptyPosture
ctPaintTools[13].posture = emptyPosture
ctPaintTools[14].posture = emptyPosture
ctPaintTools[15].posture = emptyPosture
ctPaintTools[16].posture = emptyPosture
ctPaintTools[17].posture = emptyPosture

ctPaintTools[10].toolsAction = flipAction
ctPaintTools[12].toolsAction = invertAction
ctPaintTools[15].toolsAction = resizeAction

ctPaintTools[16].posture = horizontalColorSwapPosture
ctPaintTools[17].posture = verticalColorSwapPosture


ctPaintTools[10].menuImage.src = 'assets\\t01.png'
ctPaintTools[13].menuImage.src = 'assets\\t02.png'
ctPaintTools[11].menuImage.src = 'assets\\t04.png'
ctPaintTools[14].menuImage.src = 'assets\\t05.png'
ctPaintTools[15].menuImage.src = 'assets\\t03.png'

selectedTool = ctPaintTools[7]

