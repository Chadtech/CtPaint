# organized as they are in the 2 x 11 tool bar grid
toolNames = [
  'zoom', 'select'
  'sample', 'fill'
  'square', 'circle'
  'line', 'point'
  'flip', 'rotate'
  'invert', 'displace'
  'scale', 'resize'
  'horizontalSwap', 'verticalSwap'
  'copy', 'paste'
  'cut', 'all'
  'undo', 'redo'
  'cursorColor', 'modeChange'
  'magnitudeDown', 'magnitudeUp'
]

toolMaxMagnitudes = [
  4, ''
  '', ''
  7, 7
  7, 7
  '', ''
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
  false, false
]

toolMenuImages = [
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
  '', ''
  '', ''
]

ctPaintTools = {}

iteration = 0
while iteration < toolNames.length
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
  ctPaintTools[iteration].pressedImage[0].src = 'assets/u'+zeroPadder(iteration,2)+'000.PNG'
  ctPaintTools[iteration].pressedImage[1].src = 'assets/v'+zeroPadder(iteration,2)+'000.PNG'
  iteration++

ctPaintTools[0].posture = zoomPosture
ctPaintTools[1].posture = selectPosture
ctPaintTools[2].posture = samplePosture
ctPaintTools[3].posture = fillPosture
ctPaintTools[4].posture = squarePosture
ctPaintTools[5].posture = circlePosture
ctPaintTools[6].posture = linePosture
ctPaintTools[7].posture = pointPosture
ctPaintTools[8].posture = emptyPosture
ctPaintTools[9].posture = emptyPosture
ctPaintTools[10].posture = emptyPosture
ctPaintTools[11].posture = emptyPosture
ctPaintTools[12].posture = emptyPosture
ctPaintTools[13].posture = emptyPosture
ctPaintTools[14].posture = horizontalColorSwapPosture
ctPaintTools[15].posture = verticalColorSwapPosture
ctPaintTools[16].posture = emptyPosture
ctPaintTools[17].posture = emptyPosture
ctPaintTools[18].posture = emptyPosture
ctPaintTools[19].posture = emptyPosture
ctPaintTools[20].posture = emptyPosture
ctPaintTools[21].posture = emptyPosture

ctPaintTools[8].toolsAction = flipAction
ctPaintTools[9].toolsAction = rotateAction
ctPaintTools[10].toolsAction = invertAction
ctPaintTools[11].toolsAction = replaceAction
ctPaintTools[12].toolsAction = scaleAction
ctPaintTools[13].toolsAction = resizeAction
ctPaintTools[16].toolsAction = copyAction
ctPaintTools[17].toolsAction = pasteAction
ctPaintTools[18].toolsAction = cutAction
ctPaintTools[19].toolsAction = allAction
ctPaintTools[20].toolsAction = undoAction
ctPaintTools[21].toolsAction = redoAction
ctPaintTools[22].toolsAction = cursorColorAction
ctPaintTools[23].toolsAction = modeChangeAction
ctPaintTools[24].toolsAction = magnitudeUpAction
ctPaintTools[25].toolsAction = magnitudeDownAction

ctPaintTools[8].menuImage.src = 'assets/t01.png'
ctPaintTools[11].menuImage.src = 'assets/t02.png'
ctPaintTools[9].menuImage.src = 'assets/t04.png'
ctPaintTools[12].menuImage.src = 'assets/t05.png'
ctPaintTools[13].menuImage.src = 'assets/t03.png'

enterLitUp = new Image()
cancelLitUp = new Image()

enterLitUp.src = 'assets/tEnter.png'
cancelLitUp.src = 'assets/tCancel.png'

xLitUp = new Image()
yLitUp = new Image()

xLitUp.src = 'assets/t11.png'
yLitUp.src = 'assets/t21.png'

ninetyDegreesLitUp = new Image()
oneHundredAndEightyDegreesLitUp = new Image()
twoHundredAndSeventyDegreesLitUp = new Image()

ninetyDegreesLitUp.src = 'assets/t14.png'
oneHundredAndEightyDegreesLitUp.src = 'assets/t24.png'
twoHundredAndSeventyDegreesLitUp.src = 'assets/t34.png'

toolsToNumbers =
  'zoom':0
  'select':1
  'sample':2
  'fill':3
  'square':4
  'circle':5
  'line':6
  'point':7
  'flip':8
  'rotate':9
  'invert':10
  'replace':11
  'scale':12
  'resize':13
  'horizontalSwap':14
  'verticalSwap':15
  'copy':16
  'paste':17
  'cut':18
  'all':19
  'undo':20
  'redo':21
  'cursorColor':22
  'modeChange':23
  'magnitudeDown':24
  'magnitudeUp':25


###
  Fancy Responsive tools are tools with icons that change with the tools magnitude and mode.

  The code in this section utilizes a png file naming schema for the assets. For an explaination
  of that schema look at the comments in imageCutOut.py in the folder spriteGeneration
###

fancyResponsiveTools = ['zoom', 'square', 'circle', 'line', 'point']

placeHolder = ''

fancyResponsiveIcons =
  'zoom':placeHolder
  'square':placeHolder
  'circle':placeHolder
  'line':placeHolder
  'point':placeHolder

fancyToolIndex = 0
while fancyToolIndex < fancyResponsiveTools.length
  fancyIconIndex = 0
  # For each fancy tool, declare an array of two empty arrays
  # These arrays correspond to selected icons, and non selected icons
  fancyResponsiveIcons[fancyResponsiveTools[fancyToolIndex]] = [ [], [] ]
  while fancyIconIndex < toolMaxMagnitudes[toolsToNumbers[fancyResponsiveTools[fancyToolIndex]]]
    # For each magnitude, populate each array with a new image.
    fancyResponsiveIcons[fancyResponsiveTools[fancyToolIndex]][0].push new Image()
    fancyResponsiveIcons[fancyResponsiveTools[fancyToolIndex]][1].push new Image()

    # source the icon for non selected tool fancyToolIndex of magnitude fancyIconIndex
    imageSource = 'assets/u' + zeroPadder(toolsToNumbers[fancyResponsiveTools[fancyToolIndex]], 2)
    imageSource += '00' + fancyIconIndex.toString() + '.PNG'
    fancyResponsiveIcons[fancyResponsiveTools[fancyToolIndex]][0][fancyIconIndex].src =
      imageSource

    # source the icon for selected tool fancyToolIndex of magnitude fancyIconIndex
    imageSource = 'assets/u'+zeroPadder(toolsToNumbers[fancyResponsiveTools[fancyToolIndex]], 2)
    imageSource += '0' + fancyIconIndex.toString() + '0.PNG'
    fancyResponsiveIcons[fancyResponsiveTools[fancyToolIndex]][1][fancyIconIndex].src =
      imageSource

    fancyIconIndex++
  fancyToolIndex++

# toolsWhichCanBeSolid are tools that when their mode is true, draw a filled version
# instead of an outline.
toolsWhichCanBeSolid = [ 'select', 'square', 'circle' ]

solidIcons =
  'select': [ new Image(), new Image() ]
  'square': [ new Image(), new Image() ]
  'circle': [ new Image(), new Image() ]

solidToolIndex = 0
while solidToolIndex < toolsWhichCanBeSolid.length
  imageSource = 'assets/u' + zeroPadder(toolsToNumbers[ toolsWhichCanBeSolid[solidToolIndex] ], 2)
  imageSource += '100.PNG'
  solidIcons[toolsWhichCanBeSolid[solidToolIndex]][0].src = imageSource

  imageSource = 'assets/u' + zeroPadder(toolsToNumbers[ toolsWhichCanBeSolid[solidToolIndex] ], 2)
  imageSource += '200.PNG'
  solidIcons[toolsWhichCanBeSolid[solidToolIndex]][1].src = imageSource

  solidToolIndex++

