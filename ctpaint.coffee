###
  the height of the horizontal tool bar, and the width of the vertical toolbar
###
toolbarHeight = 37
toolbarWidth = 52

###
  The main canvases width and height, declared at their default values
###
canvasWidth = 256
canvasHeight = 256

###
  canvasYPos and canvasXPos is the upper left corner of the canvas relative to the window.

  canvasXOffset and canvasYOffset is how much the canvas is 'scrolled' away for when the canvas
  is larger than can fit in the window
###

canvasXPos = toolbarWidth + 5
canvasYPos = 5
canvasXOffset = 0
canvasYOffset = 0

###
  canvasAsData is the canvas stored as data. This is useful when the canvas needs to be changed
  temporarily, such as between when you have clicked on the line draw tool, but not released.
  The canvas is constantly refreshed with the data during these moments.
###
canvasAsData = undefined

###
  selectedTool is the currently selected tool, updated when a new one is selected so the code
  regarding the selected tool can be static. previouslySelectedTool stores a value that
  selectedTool is sometimes reset to, for tools that should automatically go back to the
  previously selected one (sample)
###
selectedTool = undefined
previouslySelectedTool = undefined
# useful during tool declaration
numberOfTools = 24
# Refers to whether toolbar0 is in view mode 0 or 1
toolViewMode = 0


mousePressed = false
draggingBorder = false

zoomActivate = false
cornersVisible = true

selection = undefined
selectionToPaste = undefined
areaSelected = false
justUp = false
areaSelectedsWidth = 0
areaSelectedsHeight = 0
areasXSpot = 0
areasYSpot = 0
areaXOffset = 0
areaYOffset = 0
areaOldX = 0
areaOldY = 0

fillPermission = true

menuUp = false
whatSortOfDataSorting = undefined
menuDatumZero = undefined
spotInMenuZeroDatum = 0
menuDatumOne = undefined
spotInMenuOneDatum = 0

normalCircumstance = true

xSpot = undefined
ySpot = undefined

oldX = undefined
oldY = undefined

xSpotZoom = undefined
ySpotZoom = undefined

oldXZoom = undefined
oldYZoom = undefined

buttonWidth = 24
buttonHeight = 24
###
  Color swatches are the four colors in the very lower left corner of the window
  They are the colors you have immediate access to drawing with
###
colorSwatches = [ [192,192,192], [0,0,0], [64,64,64], [255,255,255] ]
###
  True when the menu has popped up to change a color in the color pallete
###
colorModify = false
###
  The static image of the color menu that gives the impression of
  deep functionality
###
colorMenuImage = new Image()
colorMenuImage.src = 'assets\\t00.png'
###
  defined as an index number once a color has been shift clicked
###
spotInColorPallete = undefined
###
  The color pallete. Even numbered pallete elements are on the top row,
  odds on the bottom row. That aside the colors ascend from left to right

  The colors were largely ripped out of the youtube video of Tom Sach's
  video 'colors'. Some minor adjustments.
###
colorPallete = [
  [ 0, 0, 0 ] 
  [ 64, 64, 64 ] 
  [ 128, 128, 128 ] 
  [ 192, 192, 192 ] 
  [ 255, 255, 255 ] 
  [ 50, 54, 128 ] 
  [ 85, 96, 45 ] 
  [ 0, 47, 167 ] 
  [ 221, 201, 142 ] 
  [ 10, 186, 181 ] 
  [ 243, 211, 27 ] 
  [ 159, 170, 210 ]
  [ 255, 91, 49 ] 
  [ 157, 212, 147 ] 
  [ 212, 51, 29 ] 
  [ 10, 202, 26 ] 
]
###
  When a region is selected, it is outlined by a box. The outline
  has a very particular pattern, and the declaration of the
  relevant program components is very complicated. The pattern
  is four pixels long. The variable dataToGive contains the color
  pattern along the outline. 

  selectLinesOfLengthX contains four canvas elements, each 1 pixel
  tall. Each canvas element is its index number + 1 wide. When the
  outline is drawn, a the canvas of length 4 (index 3) is repeatedly
  pasted until there is less than four pixels left. At which point,
  a canvas of the remaining length is pasted (1, 2 or 3). 
  selectLinesOfLengthY is the vertical version of this technique.
###

selectLinesOfLengthX = []
selectLinesOfLengthY = []
dataToGive = [
  [224, 96, 128, 255] 
  [128, 128, 128, 255] 
  [128, 128, 128, 255] 
  [192, 192, 0, 255] 
]

lineIndex = 0
while lineIndex < dataToGive.length

  horizontalCanvasElement = document.createElement('canvas')
  horizontalCanvasElement = horizontalCanvasElement.getContext('2d').createImageData(lineIndex+1, 1)
  selectLinesOfLengthX.push horizontalCanvasElement

  verticalCanvasElement = document.createElement('canvas')
  verticalCanvasElement = verticalCanvasElement.getContext('2d').createImageData(1, lineIndex+1)
  selectLinesOfLengthY.push verticalCanvasElement
  
  dataIndex = 0
  while dataIndex < (lineIndex+1)
    eachColorIndex = 0
    while eachColorIndex < dataToGive.length
      colorIndexOfDatum = eachColorIndex + (dataIndex * 4)
      selectLinesOfLengthX[selectLinesOfLengthX.length-1].data[colorIndexOfDatum] = 
        dataToGive[dataIndex][eachColorIndex]
      selectLinesOfLengthY[selectLinesOfLengthY.length-1].data[colorIndexOfDatum] = 
        dataToGive[dataIndex][eachColorIndex]
      eachColorIndex++
    dataIndex++
  lineIndex++

###
  Given a number, zero padder returns a string of that number
  padded with zeros in front of it.
###
zeroPadder = (number,numberOfZerosToFill) ->
  numberAsString = number+''
  while numberAsString.length < numberOfZerosToFill
    numberAsString = '0'+numberAsString
  return numberAsString
###
  replaceAt replaces the element at stringsIndex in a string
  with one given as an argument (replacement)
###
replaceAt = (string, replacement, stringsIndex) ->
  return string.substr(0,stringsIndex) + replacement + string.substr(stringsIndex + 1)

###
  rgbToHex and hexToRGB convert between the two standards
  of color expression.
###

rgbToHex = (rgb, hashtag) ->
  if hashtag == undefined or hashtag
    return '#' + 
      zeroPadder(rgb[0].toString(16),2) + 
      zeroPadder(rgb[1].toString(16),2) + 
      zeroPadder(rgb[2].toString(16),2)
  else
    return zeroPadder(rgb[0].toString(16),2) + 
      zeroPadder(rgb[1].toString(16),2) + 
      zeroPadder(rgb[2].toString(16),2)

hexToRGB = (hex) ->
  return [parseInt(hex[0] + hex[1], 16)
    parseInt(hex[2] + hex[3], 16)
    parseInt(hex[4] + hex[5], 16)
  ]

# The main Canvas
ctCanvas = document.getElementById('CtPaint')
ctContext = ctCanvas.getContext('2d')

# The vertical toolbar
toolbar0Canvas = document.getElementById('toolbar0')
toolbar0Context = toolbar0Canvas.getContext('2d')

###
  toolbar0 has two images, that are switched by pressing the alt key. One shows the tools icon
  the other the shortkey to that tool
###
toolbar0sImages = [new Image(), new Image()]
toolbar0sImages[0].src = 'assets\\toolbar0v.PNG'
toolbar0sImages[1].src = 'assets\\toolbar0u.PNG'

###
  toolbar1 is the horizontal toolbar. It has two images. The first of the color palette and color 
  swatches, the second of the information board
###
toolbar1Canvas = document.getElementById('toolbar1')
toolbar1Context = toolbar1Canvas.getContext('2d')
toolbar1sImage0 = new Image()
toolbar1sImage0.src = 'assets\\toolbar10.png'
toolbar1sImage1 = new Image()
toolbar1sImage1.src = 'assets\\toolbar11.png'

###
  The background canvas is just a gray expanse behind everything
###
backgroundCanvas = document.getElementById('background')
backgroundContext = backgroundCanvas.getContext('2d')

###
  The corners are the four small dots at the corners of the main canvas. They give an impression of
  boundary, and resizeability. One of them can be clicked on to resize the canvas,
  which is the lower right one.
###
corner0Canvas = document.getElementById('corner0')
corner0Context = corner0Canvas.getContext('2d')
corner1Canvas = document.getElementById('corner1')
corner1Context = corner1Canvas.getContext('2d')
corner2Canvas = document.getElementById('corner2')
corner2Context = corner2Canvas.getContext('2d')
corner3Canvas = document.getElementById('corner3')
corner3Context = corner3Canvas.getContext('2d')

corner0Context.canvas.width = 1
corner0Context.canvas.height = 1
corner1Context.canvas.width = 1
corner1Context.canvas.height = 1
corner2Context.canvas.width = 1
corner2Context.canvas.height = 1
corner3Context.canvas.width = 1
corner3Context.canvas.height = 1

###
  The menucanvas is a canvas that displays whatever menu is currently active. Menus such as resize
  and scale. When inactive it sits off screen. When activated its updated with the correct 
  appearanceand location
###
menuCanvas = document.getElementById('menu')
menuContext = menuCanvas.getContext('2d')


###
 keysToKeyCodes correlates the keycode of a key, with the keys name.
 That way I can just type in the name of the key to get the key code.
###

keysToKeyCodes = 
  'backspace':8
  'tab':9
  'enter':13
  'shift':16
  'ctrl':17
  'alt':18
  'caps lock':20
  'escape':27
  'space':32
  'left':37
  'up':38
  'right':39
  'down':40
  'delete':46
  '0':48
  '1':49
  '2':50
  '3':51
  '4':52
  '5':53
  '6':54
  '7':55
  '8':56
  '9':57
  'a':65
  'b':66
  'c':67
  'd':68
  'e':69
  'f':70
  'g':71
  'h':72
  'i':73
  'j':74
  'k':75
  'l':76
  'm':77
  'n':78
  'o':79
  'p':80
  'q':81
  'r':82
  's':83
  't':84
  'u':85
  'v':86
  'w':87
  'x':88
  'y':89
  'z':90
  'left command':91
  'right command':93
  'numpad0':96
  'numpad1':97
  'numpad2':98
  'numpad3':99
  'numpad4':100
  'numpad5':101
  'numpad6':102
  'numpad7':103
  'numpad8':104
  'numpad9':105
  'f1':112
  'f2':113
  'f3':114
  'f4':115
  'f5':116
  'f6':117
  'f7':118
  'f8':119
  'f9':120
  'f10':121
  'f11':122
  'f12':123
  'semicolon':186
  'equals':187
  'comma':188
  'minus':189
  'period':190
  'forward slash':191
  'tilda':192
  'left bracket':219
  'back slash':220
  'right bracket':221
  'single quote':222

###
  In this section, I declare an object to connect each character as a string, to 
  an array of images of that character. These images can be drawn onto the canvas.

  (A)
  The letters 'm', 'n', and 'o', are arbitrary codes assigned to three different
  colorations of each character. The files of the images themselves are designated
  with the code. One they are organized into the stringsToGlyph object, they are
  referenced by index of the array element of stringsToGlyph. m is of a dark character
  on a dark background. n is a medium coloration, where the chracter is adequately
  bright. o has a brighter background, and a brighter character, for when a letter
  must be highlighted.
###
stringOfCharacters = 
  'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ `.,;:'+"'"+'"?!0123456789@#$%^&*(){}[]'
stringsToGlyphs = {}
stringOfCharactersIndex = 0
# (A)
varietyCodes = [ 'm', 'n', 'o' ]
while stringOfCharactersIndex < stringOfCharacters.length
  stringsToGlyphs[stringOfCharacters[stringOfCharactersIndex]] = [ 
    new Image()
    new Image()
    new Image()]
  imageVariety = 0
  while imageVariety < 3
    asset = 'assets\\' + varietyCodes[imageVariety]+zeroPadder(stringOfCharactersIndex,4)+'.PNG'
    stringsToGlyphs[stringOfCharacters[stringOfCharactersIndex]][imageVariety].src = asset
    imageVariety++
  stringOfCharactersIndex++

###
  This function draws the letters onto the canvas.
###

drawStringAsCommandPrompt = (canvas, stringToDraw, coloration, whereAtX, whereAtY) ->
  stringIndex = 0
  while stringIndex < stringToDraw.length
    glyph = stringsToGlyphs[stringToDraw[stringIndex]][coloration]
    canvas.drawImage(glyph, whereAtX + (12 * stringIndex), whereAtY)
    stringIndex++

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
selectAction = (canvas, beginX, beginY, endX, endY) ->
  drawSelectBox(canvas, beginX, beginY, endX, endY)

drawSelectBox = (canvas, beginX, beginY, endX, endY) ->
  if beginX > endX
    swapStorage = beginX
    beginX = endX
    endX = swapStorage
  if beginY > endY
    swapStorage = beginY
    beginY = endY
    endY = swapStorage
  distanceX = endX - beginX
  distanceY = endY - beginY
  while distanceX > 0
    if distanceX > 3
      canvas.putImageData(selectLinesOfLengthX[3],endX - distanceX, beginY)
      canvas.putImageData(selectLinesOfLengthX[3],endX - distanceX, endY)
      distanceX-=4
    else
      canvas.putImageData(selectLinesOfLengthX[distanceX - 1],endX - distanceX, beginY)
      canvas.putImageData(selectLinesOfLengthX[distanceX - 1],endX - distanceX, endY)
      distanceX-=distanceX
  while distanceY > 0
    if distanceY > 3
      canvas.putImageData(selectLinesOfLengthY[3], beginX, endY - distanceY)
      canvas.putImageData(selectLinesOfLengthY[3], endX, endY - distanceY)
      distanceY-=4
    else
      canvas.putImageData(selectLinesOfLengthY[distanceY - 1], beginX, endY - distanceY)
      canvas.putImageData(selectLinesOfLengthY[distanceY - 1], endX, endY - distanceY)
      distanceY-=distanceY

sampleAction = ->
  console.log '2'

getColorValue = (canvas, whereAtX, whereAtY) ->
  return rgbToHex(canvas.getImageData(whereAtX, whereAtY, 1, 1).data)

fillAction = (canvas, context, colorToChangeTo, xPos, yPos) ->
  floodFill(canvas, context, colorToChangeTo, xPos, yPos)

floodFill = (canvas, context, colorToChangeTo, xPosition, yPosition) ->
  # The argument context is the context of the argument canvas.
  # ColorToChangeTo is a three element array of color values 0<=.<255
  # xPosition and yPosition are the coordates that the fill is initiated 
  # ( where the user clicks in my case )

  ###
  In my code, colors are given as (R,G,B), but the pixels in the canvas have an alpha channel, so I 
  need to add an alpha value of 255. In my code I found that if floodFill is used quickly in 
  succession, colorToChangeTo, could retain the pushed 255, and become a RGB pixel with several 255s
  after it. To enture its in the form of [R,G,B,255], I take only the first three values of 
  colorToChangeTo.
  ###

  colorToChangeTo = [colorToChangeTo[0], colorToChangeTo[1], colorToChangeTo[2], 255]

  ###
  Here is a function to simplify the code comparing two colors.
  Javascript (unlike python) doesnt allow comparing arrays, but 
  I can compare to values of the arrays to verify their equality.
  ###

  sameColorCheck = (colorA, colorB) ->
    return colorA[0] == colorB[0] and colorA[1] == colorB[1] and colorA[2] == colorB[2]
  ###

  (A)
  The the getImageData the puteImageData functions of the canvas are computationally taxing.
  In this flood fill function, the data, an array of color values, is first grabbed.
  Its far faster to manipulate an array than it is to manipulate the canvas element directly.

  (B)
  The canvas elements data is just an array of color values. If the pixels are numbered, and 'R0' 
  refers to the red value of pixel one. The canvases data looks like 
  [ R0, G0, B0, A0, R1, G1, B1, A1, R2 ]. I decided to convert the array into an array of pixels for
  ease of coding, though I wonder if the program would be significantly faster if I worked with 
  just the array.

  (C)
  Since we are working with a one dimensional array of pixels. The (x,y) coordinates no longer make 
  sense. originalPosition is the position in the one dimensional array translated from the two 
  dimenstional (x,y) coordinates. colorToReplace is the color we are replacing, and its the color at
  originalPosition.

  ###

  # (A)
  wholeCanvas = context.getImageData(0,0, canvas.width, canvas.height)
  wholeCanvasData = []
  canvasIndex = 0
  while canvasIndex < wholeCanvas.data.length
    wholeCanvasData.push wholeCanvas.data[canvasIndex]
    canvasIndex++
  wholeCanvas = wholeCanvasData

  # (B)    
  wholeCanvasAsPixels = []
  singlePixel = []
  canvasIndex = 0
  while canvasIndex < wholeCanvas.length
    singlePixel.push wholeCanvas[canvasIndex]
    if singlePixel.length == 4
      wholeCanvasAsPixels.push singlePixel
      singlePixel = []
    canvasIndex++
  wholeCanvas = wholeCanvasAsPixels

  # (C)
  originalPosition = xPosition + (yPosition * canvas.width)
  colorToReplace = wholeCanvas[originalPosition]

  ###
  (A)
  The queue is declared populated with the pixel that was clicked on. The first pixel to be
  checked is set to colorToChangeTo. Every pixel after will be color changed by checkAndFill

  (B)
  The checkAndFill pixel looks at each neighbor (north, east, west, and south), and sees if its
  the color to be replaced (colorToReplace). Before doing any of that though, it checks to make 
  sure there is in fact a northernly, easternly, westernly, southernly neighbor. 

  (C)
  The while loop does checkAndFill for as long as there is an element in the queue. After it checks
  that pixel, it removes it from the array. For a normal region, pixelsToCheck fills up quickly as
  it touches many pixels with 2 or more available neighbors. Eventually the only members in 
  the queue have no available neighbors, and pixelsToCheck deflates.
  ###

  # (A)
  pixelsToCheck = [originalPosition]
  wholeCanvas[originalPosition] = colorToChangeTo

  # (B)
  checkAndFill = (pixelIndex)->
    # North
    if (pixelIndex - canvas.width) >= 0
      if sameColorCheck(colorToReplace, wholeCanvas[pixelIndex - canvas.width])
        pixelsToCheck.push (pixelIndex - canvas.width)
        wholeCanvas[pixelIndex - canvas.width] = colorToChangeTo
    # East
    if (pixelIndex + 1)%canvas.width != 0
      if sameColorCheck(colorToReplace, wholeCanvas[pixelIndex + 1])
        pixelsToCheck.push (pixelIndex + 1)
        wholeCanvas[pixelIndex + 1] = colorToChangeTo
    # South
    if (pixelIndex + canvas.width) < (canvas.width * canvas.height)
      if sameColorCheck(colorToReplace, wholeCanvas[pixelIndex + canvas.width])
        pixelsToCheck.push (pixelIndex + canvas.width)
        wholeCanvas[pixelIndex + canvas.width] = colorToChangeTo
    # West
    if pixelIndex%canvas.width != 0
      if sameColorCheck(colorToReplace, wholeCanvas[pixelIndex - 1])
        pixelsToCheck.push (pixelIndex - 1)
        wholeCanvas[pixelIndex - 1] = colorToChangeTo

  # (C)
  while pixelsToCheck.length
    checkAndFill(pixelsToCheck[0])
    pixelsToCheck.shift()

  ###
  revisedCanvasToPaste is a new canvas, that is the same size of the canvas that was read.
  The manipulated data of the original canvas is then put into the revised canvas and the
  revised canvas is pasted over the old.
  ###

  revisedCanvasToPaste = document.createElement('canvas')
  revisedCanvasToPaste.getContext('2d').createImageData(canvas.width, canvas.height)

  pixelInCanvasIndex = 0
  while pixelInCanvasIndex < wholeCanvas.length
    colorValueIndex = 0
    while colorValueIndex < wholeCanvas[pixelInCanvasIndex].length
      revisedCanvasToPaste.data[(pixelInCanvasIndex * 4) + colorValueIndex] = 
        wholeCanvas[pixelInCanvasIndex][colorValueIndex]
      colorValueIndex++
    pixelInCanvasIndex++
  context.putImageData(revisedCanvasToPaste,0,0)

squareAction = (canvas, color, beginX, beginY, endX, endY, fillOrNot) ->
  if not selectedTool.mode and not fillOrNot
    magnitudeIncrement = 0
    if (beginX < endX) == (beginY < endY)
      if (beginX < endX)
        while magnitudeIncrement < selectedTool.magnitude
          mi = magnitudeIncrement
          drawLine(canvas, color, beginX + mi, beginY + mi, endX - mi, beginY + mi)
          drawLine(canvas, color, beginX + mi, beginY + mi, beginX + mi, endY - mi )
          drawLine(canvas, color, endX - mi, beginY + mi, endX - mi, endY - mi)
          drawLine(canvas, color, beginX + mi, endY - mi, endX - mi, endY - mi)
          magnitudeIncrement++
      else
        while magnitudeIncrement < selectedTool.magnitude
          mi = magnitudeIncrement
          drawLine(canvas, color, beginX - mi, beginY - mi, endX + mi, beginY - mi)
          drawLine(canvas, color, beginX - mi, beginY - mi, beginX - mi, endY + mi )
          drawLine(canvas, color, endX + mi, beginY - mi, endX + mi, endY + mi)
          drawLine(canvas, color, beginX - mi, endY + mi, endX + mi, endY + mi)
          magnitudeIncrement++
    else
      if (endY < beginY)
        while magnitudeIncrement < selectedTool.magnitude
          mi = magnitudeIncrement
          drawLine(canvas, color, beginX + mi, beginY - mi, endX - mi, beginY - mi)
          drawLine(canvas, color, beginX + mi, beginY - mi, beginX + mi, endY + mi )
          drawLine(canvas, color, endX - mi, beginY - mi, endX - mi, endY + mi)
          drawLine(canvas, color, beginX + mi, endY + mi, endX - mi, endY + mi)
          magnitudeIncrement++
      else
        while magnitudeIncrement < selectedTool.magnitude
          mi = magnitudeIncrement
          drawLine(canvas, color, beginX - mi, beginY + mi, endX + mi, beginY + mi)
          drawLine(canvas, color, beginX - mi, beginY + mi, beginX - mi, endY - mi )
          drawLine(canvas, color, endX + mi, beginY + mi, endX + mi, endY - mi)
          drawLine(canvas, color, beginX - mi, endY - mi, endX + mi, endY - mi)
          magnitudeIncrement++
  else
    numberOfIterationsNecessary = 0
    if Math.abs(beginX - endX) > Math.abs(beginY - endY)
      numberOfIterationsNecessary = Math.abs(beginY - endY)
    else
      numberOfIterationsNecessary = Math.abs(beginX - endX)
    magnitudeIncrement = 0
    if (beginX < endX) == (beginY < endY)
      if (beginX < endX)
        while magnitudeIncrement < numberOfIterationsNecessary
          mi = magnitudeIncrement
          drawLine(canvas, color, beginX + mi, beginY + mi, endX - mi, beginY + mi)
          drawLine(canvas, color, beginX + mi, beginY + mi, beginX + mi, endY - mi )
          drawLine(canvas, color, endX - mi, beginY + mi, endX - mi, endY - mi)
          drawLine(canvas, color, beginX + mi, endY - mi, endX - mi, endY - mi)
          magnitudeIncrement++
      else
        while magnitudeIncrement < numberOfIterationsNecessary
          mi = magnitudeIncrement
          drawLine(canvas, color, beginX - mi, beginY - mi, endX + mi, beginY - mi)
          drawLine(canvas, color, beginX - mi, beginY - mi, beginX - mi, endY + mi )
          drawLine(canvas, color, endX + mi, beginY - mi, endX + mi, endY + mi)
          drawLine(canvas, color, beginX - mi, endY + mi, endX + mi, endY + mi)
          magnitudeIncrement++
    else
      if (endY < beginY)
        while magnitudeIncrement < numberOfIterationsNecessary
          mi = magnitudeIncrement
          drawLine(canvas, color, beginX + mi, beginY - mi, endX - mi, beginY - mi)
          drawLine(canvas, color, beginX + mi, beginY - mi, beginX + mi, endY + mi )
          drawLine(canvas, color, endX - mi, beginY - mi, endX - mi, endY + mi)
          drawLine(canvas, color, beginX + mi, endY + mi, endX - mi, endY + mi)
          magnitudeIncrement++
      else
        while magnitudeIncrement < numberOfIterationsNecessary
          mi = magnitudeIncrement
          drawLine(canvas, color, beginX - mi, beginY + mi, endX + mi, beginY + mi)
          drawLine(canvas, color, beginX - mi, beginY + mi, beginX - mi, endY - mi )
          drawLine(canvas, color, endX + mi, beginY + mi, endX + mi, endY - mi)
          drawLine(canvas, color, beginX - mi, endY - mi, endX + mi, endY - mi)
          magnitudeIncrement++

circleAction = ( canvas, color, xPos, yPos ) ->
  if not selectedTool.mode
    whetherCornerBlocks = false
    if selectedTool.magnitude > 1
      whetherCornerBlocks = true
    calculatedRadius = Math.pow(Math.pow(xPos - oldX, 2) + Math.pow(yPos - oldY, 2), 0.5)
    calculatedRadius = Math.round(calculatedRadius)
    magnitudeIncrement = 0
    while magnitudeIncrement < selectedTool.magnitude
      thisIncrementsRadius = calculatedRadius - magnitudeIncrement
      drawCircle( canvas, color, oldX, oldY, thisIncrementsRadius, whetherCornerBlocks )
      magnitudeIncrement++
  else
    calculatedRadius = Math.pow(Math.pow(xPos - oldX, 2) + Math.pow(yPos - oldY, 2), 0.5)
    calculatedRadius = Math.round(calculatedRadius)
    magnitudeIncrement = 0
    while magnitudeIncrement < calculatedRadius
      drawCircle( canvas, color, oldX, oldY, calculatedRadius - magnitudeIncrement, true )
      magnitudeIncrement++
      
drawCircle = ( canvas, color, centerX, centerY, radius, cornerBlock) ->
  radiusError = 1 - radius
  xOffset = 0
  yOffset = radius
  xDelta = 0
  yDelta = -2 * radius

  putPixel(canvas, color, centerX, centerY + radius)
  putPixel(canvas, color, centerX, centerY - radius)
  putPixel(canvas, color, centerX + radius, centerY)
  putPixel(canvas, color, centerX - radius, centerY)

  if not cornerBlock
    while xOffset < yOffset
      if radiusError >= 0
        yOffset--
        yDelta += 2
        radiusError += yDelta
      xOffset++
      xDelta += 2
      radiusError += (xDelta + 1)

      putPixel( canvas, color, centerX + xOffset, centerY + yOffset)
      putPixel( canvas, color, centerX - xOffset, centerY + yOffset)
      putPixel( canvas, color, centerX + xOffset, centerY - yOffset)
      putPixel( canvas, color, centerX - xOffset, centerY - yOffset)

      putPixel( canvas, color, centerX + yOffset, centerY + xOffset)
      putPixel( canvas, color, centerX - yOffset, centerY + xOffset)
      putPixel( canvas, color, centerX + yOffset, centerY - xOffset)
      putPixel( canvas, color, centerX - yOffset, centerY - xOffset)
  else
    doACornerBlock = false
    while xOffset < yOffset
      if radiusError >= 0
        yOffset--
        yDelta += 2
        radiusError += yDelta
        doACornerBlock = true
      xOffset++
      xDelta += 2
      radiusError += (xDelta + 1)

      putPixel( canvas, color, centerX + xOffset, centerY + yOffset)
      putPixel( canvas, color, centerX - xOffset, centerY + yOffset)
      putPixel( canvas, color, centerX + xOffset, centerY - yOffset)
      putPixel( canvas, color, centerX - xOffset, centerY - yOffset)

      putPixel( canvas, color, centerX + yOffset, centerY + xOffset)
      putPixel( canvas, color, centerX - yOffset, centerY + xOffset)
      putPixel( canvas, color, centerX + yOffset, centerY - xOffset)
      putPixel( canvas, color, centerX - yOffset, centerY - xOffset)
      
      if doACornerBlock
        putPixel( canvas, color, centerX + xOffset - 1, centerY + yOffset)
        putPixel( canvas, color, centerX - xOffset + 1, centerY + yOffset)
        putPixel( canvas, color, centerX + xOffset - 1, centerY - yOffset)
        putPixel( canvas, color, centerX - xOffset + 1, centerY - yOffset)

        putPixel( canvas, color, centerX + yOffset, centerY + xOffset - 1)
        putPixel( canvas, color, centerX - yOffset, centerY + xOffset - 1)
        putPixel( canvas, color, centerX + yOffset, centerY - xOffset + 1)
        putPixel( canvas, color, centerX - yOffset, centerY - xOffset + 1)
        doACornerBlock = false

lineAction = (canvas, color, beginX, beginY, endX, endY) ->
  lineSlope = undefined
  if selectedTool.magnitude > 1
    lineSlope = Math.abs(beginX - endX) / Math.abs(beginY - endY)
    if lineSlope > 1
      lineSlope = Math.abs(beginY - endY) / Math.abs(beginX - endX)
  magnitudeIncrement = 0
  while magnitudeIncrement < selectedTool.magnitude
    drawLine(canvas, color, beginX + magnitudeIncrement, beginY, endX + magnitudeIncrement, endY)
    drawLine(canvas, color, beginX - magnitudeIncrement, beginY, endX - magnitudeIncrement, endY)
    drawLine(canvas, color, beginX, beginY + magnitudeIncrement, endX, endY + magnitudeIncrement)
    drawLine(canvas, color, beginX, beginY - magnitudeIncrement, endX, endY - magnitudeIncrement)
    magnitudeIncrement++
  if selectedTool.magnitude > 1
    calculatedRadius = (selectedTool.magnitude - 2) - Math.round(lineSlope * 1.21)
    magnitudeIncrement = 0
    while magnitudeIncrement < calculatedRadius
      drawCircle( canvas, color, beginX, beginY, calculatedRadius - magnitudeIncrement, true )
      drawCircle( canvas, color, endX, endY, calculatedRadius - magnitudeIncrement, true )
      magnitudeIncrement++

drawLine = (canvas, color, beginX, beginY, endX, endY) ->
  deltaX = Math.abs(endX - beginX)
  if beginX < endX
    directionX = 1
  else
    directionX = -1
  deltaY = Math.abs(endY - beginY)
  if beginY < endY
    directionY = 1
  else
    directionY = -1
  if deltaX > deltaY
    errorOne = deltaX/2
  else
    errorOne = -deltaY/2
  keepGoin = true
  while keepGoin
    putPixel(canvas,color,beginX,beginY)
    if (beginX == endX) and (beginY == endY)
      keepGoin = false
    errorTwo = errorOne
    if errorTwo > -deltaX
      errorOne -= deltaY
      beginX += directionX
    if errorTwo < deltaY
      errorOne += deltaX
      beginY += directionY

pointAction = (canvas, color, beginX, beginY, endX, endY) ->
  if selectedTool.magnitude < 2
    drawLine(canvas, color, beginX, beginY, endX, endY)
  else
    magnitudeIncrement = 0
    while magnitudeIncrement < selectedTool.magnitude
      drawLine(canvas, color, beginX + magnitudeIncrement, beginY, endX + magnitudeIncrement, endY)
      drawLine(canvas, color, beginX - magnitudeIncrement, beginY, endX - magnitudeIncrement, endY)
      drawLine(canvas, color, beginX, beginY + magnitudeIncrement, endX, endY + magnitudeIncrement)
      drawLine(canvas, color, beginX, beginY - magnitudeIncrement, endX, endY - magnitudeIncrement)
      magnitudeIncrement++
  if selectedTool.magnitude > 1
    calculatedRadius = (selectedTool.magnitude - 2)
    magnitudeIncrement = 0
    while magnitudeIncrement < calculatedRadius
      drawCircle( canvas, color, beginX, beginY, calculatedRadius - magnitudeIncrement, true )
      drawCircle( canvas, color, endX, endY, calculatedRadius - magnitudeIncrement, true )
      magnitudeIncrement++

putPixel = (canvas, color, whereAtX, whereAtY) ->
  newPixel = canvas.createImageData(1,1)
  newPixelsColor = newPixel.data
  newPixelsColor[0] = color[0]
  newPixelsColor[1] = color[1]
  newPixelsColor[2] = color[2]
  newPixelsColor[3] = 255
  canvas.putImageData(newPixel, whereAtX, whereAtY)
flipAction = () ->
  console.log 'FLIP ACTION'
rotateAction = () ->
  console.log 'ROTATE ACTION'
invertAction = () ->
  console.log 'INVERT ACTION'
replaceAction = () ->
  console.log 'REPLACE ACTION'
scaleAction = () ->
  console.log 'SCALE ACTION'
resizeAction = () ->
  menuUp = true
  normalCircumstance = false
  $('#menuDiv').css('top', (window.innerHeight - toolbarHeight - 45).toString())
  $('#menuDiv').css('left', (toolbarWidth + 10).toString())

  menuContext.canvas.width = 390
  menuContext.canvas.height = 35

  previouslySelectedTool = selectedTool
  selectedTool = ctPaintTools[15]
  menuContext.drawImage(selectedTool.menuImage, 0, 0)
  drawToolbars()

  resizeDataSortingInitialize(canvasWidth, canvasHeight)
  whatSortOfDataSorting = resizeDataSorting

resizeDataSortingInitialize = (width, height) ->
  menuDatumZero = zeroPadder(width, 4) + zeroPadder(height, 4)
  spotInMenuZeroDatum = 0
  drawResizeMenu()


resizeDataSorting = ( inputMaterial ) ->
  if inputMaterial isnt undefined
    keysThatDontAddData = ['backspace', 'left', 'right', 'enter']
    if not inputMaterial in keysThatDontAddData
      if not isNaN(inputMaterial)
        menuDatumZero = replaceAt(menuDatumZero, inputMaterial, spotInMenuZeroDatum )
        if spotInMenuZeroDatum < 7
          spotInMenuZeroDatum++
    else
      switch inputMaterial
        when 'backspace'
          menuDatumZero = replaceAt(menuDatumZero, '0', spotInMenuZeroDatum)
          if 0 < spotInMenuZeroDatum
            spotInMenuZeroDatum--
        when 'left'
          if 0 < spotInMenuZeroDatum
            spotInMenuZeroDatum--
        when 'right'
          if spotInMenuZeroDatum < 7
            spotInMenuZeroDatum++
        when 'enter'
          $('#menuDiv').css('top',(window.innerHeight).toString())
          normalCircumstance = true
          menuUp = false
          newWidth = menuDatumZero.substr(0,4)
          newHeight = menuDatumZero.substr(4,4)
          ctContext.canvas.width = parseInt(newWidth)
          ctContext.canvas.height = parseInt(newHeight)
          canvasDataAsImage = new Image()
          canvasDataAsImage.onload = ->
            ctContext.drawImage(canvasDataAsImage,0,0)
            canvasAsData = ctCanvas.toDataURL()
            canvasDataAsImage = new Image()
            canvasDataAsImage.src = canvasAsData
          canvasDataAsImage.src = canvasAsData
          ctContext.fillStyle = rgbToHex(colorSwatches[1])
          if (ctContext.canvas.width > canvasWidth) and (ctContext.canvas.height > canvasHeight)
            ctContext.fillRect(canvasWidth, 0, ctContext.canvas.width, ctContext.canvas.height)
            ctContext.fillRect(0, canvasHeight, canvasWidth, ctContext.canvas.height)
          else if (ctContext.canvas.width > canvasWidth)
            ctContext.fillRect(canvasWidth, 0, ctContext.canvas.width, ctContext.canvas.height)
          else if (ctContext.canvas.height > canvasHeight)
            ctContext.fillRect(0, canvasHeight, ctContext.canvas.width, ctContext.canvas.height)
          canvasWidth = ctContext.canvas.width
          canvasHeight = ctContext.canvas.height
          ctCanvas.style.width = (canvasWidth).toString()+'px'
          ctCanvas.style.height = (canvasHeight).toString()+'px'
          positionCorners()
          selectedTool = previouslySelectedTool
          drawToolbars()
    drawResizeMenu()

drawResizeMenu = () ->
  drawStringAsCommandPrompt( menuContext, menuDatumZero.substr(0,4), 1, 116, 10 )
  drawStringAsCommandPrompt( menuContext, menuDatumZero.substr(4,4), 1, 228, 10 )
  xPos = 116 + ((spotInMenuZeroDatum // 4) * 112) + ( 12 * ( spotInMenuZeroDatum %% 4 ) )
  drawStringAsCommandPrompt( menuContext, menuDatumZero[spotInMenuZeroDatum], 2, xPos, 10 )


horizontalColorSwap = () ->
  previouslySelectedTool = selectedTool
  selectedTool = ctPaintTools[16]
  drawToolbars()

  rearrangedSwatches = [ colorSwatches[1], colorSwatches[0], colorSwatches[3], colorSwatches[2] ]
  colorSwatches = rearrangedSwatches

  setTimeout( ()->
    selectedTool = previouslySelectedTool
    drawToolbars()
  ,20)

verticalColorSwap = () ->
  previouslySelectedTool = selectedTool
  selectedTool = ctPaintTools[17]
  drawToolbars()

  rearrangedSwatches = [ colorSwatches[2], colorSwatches[3], colorSwatches[0], colorSwatches[1] ]
  colorSwatches = rearrangedSwatches

  setTimeout( ()->
    selectedTool = previouslySelectedTool
    drawToolbars()
  ,20)

colorMenu = ()->
  menuUp = true
  normalCircumstance = false
  $('#menuDiv').css('top', (window.innerHeight - toolbarHeight - 45).toString())
  $('#menuDiv').css('left', (toolbarWidth + 10).toString())

  menuContext.canvas.width = 255
  menuContext.canvas.height = 35

  menuContext.drawImage(colorMenuImage, 0, 0)

  colorDataSortingInitialize()
  whatSortOfDataSorting = colorDataSorting

colorDataSortingInitialize = () ->
  menuDatumZero = rgbToHex(colorPallete[spotInColorPallete]).substr(1)
  spotInMenuZeroDatum = 0
  drawColorMenu()

colorDataSorting = ( inputMaterial ) ->
  if inputMaterial isnt undefined
    keysThatDontAddData = ['backspace', 'left', 'right', 'enter']
    if not inputMaterial in keysThatDontAddData
      menuDatumZero = replaceAt(menuDatumZero, inputMaterial, spotInMenuZeroDatum )
      if spotInMenuZeroDatum < 5
        spotInMenuZeroDatum++
    else
      switch inputMaterial
        when 'backspace'
          menuDatumZero = replaceAt(menuDatumZero, '0', spotInMenuZeroDatum)
          if 0 < spotInMenuZeroDatum
            spotInMenuZeroDatum--
        when 'left'
          if 0 < spotInMenuZeroDatum
            spotInMenuZeroDatum--
        when 'right'
          if spotInMenuZeroDatum < 5
            spotInMenuZeroDatum++
        when 'enter'
          colorPallete[spotInColorPallete] =  hexToRGB(menuDatumZero)
          drawToolbars()
          $('#menuDiv').css('top',(window.innerHeight).toString())
          normalCircumstance = true
          menuUp = false
    drawColorMenu()

drawColorMenu = () ->
  currentlyHighlighted = menuDatumZero[spotInMenuZeroDatum].toUpperCase()
  drawStringAsCommandPrompt( menuContext, menuDatumZero.toUpperCase(), 1, 91, 10 )
  drawStringAsCommandPrompt( menuContext, currentlyHighlighted, 2, 91+(12*spotInMenuZeroDatum), 10 )

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
positionCorners = ->
  if cornersVisible
    $('#border0Div').css('top',(canvasYPos-1+canvasYOffset).toString())
    $('#border0Div').css('left',(canvasXPos-1+canvasXOffset).toString())

    $('#border1Div').css('top',(canvasYPos-1+canvasYOffset).toString())
    $('#border1Div').css('left',(canvasXPos+canvasWidth+1+canvasXOffset).toString())

    $('#border2Div').css('top',(canvasYPos+canvasHeight+1+canvasYOffset).toString())
    $('#border2Div').css('left',(canvasXPos+canvasWidth+1+canvasXOffset).toString())

    $('#border3Div').css('top',(canvasYPos+canvasHeight+1+canvasYOffset).toString())
    $('#border3Div').css('left',(canvasXPos-1+canvasXOffset).toString())
  
  else
    $('#border0Div').css('top',(window.innerHeight).toString())
    $('#border0Div').css('left',(canvasXPos-1+canvasXOffset).toString())

    $('#border1Div').css('top',(window.innerHeight).toString())
    $('#border1Div').css('left',(canvasXPos+canvasWidth+1+canvasXOffset).toString())

    $('#border2Div').css('top',(window.innerHeight).toString())
    $('#border2Div').css('left',(canvasXPos+canvasWidth+1+canvasXOffset).toString())

    $('#border3Div').css('top',(window.innerHeight).toString())
    $('#border3Div').css('left',(canvasXPos-1+canvasXOffset).toString())  

positionCanvas = ->
  $('#ctpaintDiv').css('top', (canvasYPos+canvasYOffset).toString())
  $('#ctpaintDiv').css('left',(canvasXPos+canvasXOffset).toString())

prepareCanvas = ->
  ctContext.canvas.width = canvasWidth
  ctContext.canvas.height = canvasHeight

  ctContext.fillStyle = '#000000'
  ctContext.fillRect(0,0,canvasWidth,canvasHeight)

  positionCanvas()
  positionCorners()

positionMenu = () ->
  if not menuUp
    $('#menuDiv').css('top',(window.innerHeight).toString())

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
  toolbar0Context.fillRect(0,0,toolbarWidth,window.innerHeight-toolbarHeight)
  toolbar0Context.drawImage(toolbar0sImages[toolViewMode],0,0)
  drawLine(toolbar0Context,[16,20,8],toolbarWidth-1,0,toolbarWidth-1,window.innerHeight-toolbarHeight)
  if selectedTool
    toolbar0Context.drawImage(
      selectedTool.pressedImage[toolViewMode],
      selectedTool.clickRegion[0],
      selectedTool.clickRegion[1])

  toolbar1Context.fillStyle = '#202020'
  toolbar1Context.fillRect(0,0,window.innerWidth,toolbarHeight)

  toolbar1Context.drawImage(toolbar1sImage0,3,2)
  drawLine(toolbar1Context,[16,20,8],toolbarWidth-1,0,window.innerWidth,0)
  toolbar1Context.drawImage(toolbar1sImage1,188,3)
  drawLine(toolbar1Context,[16,20,8],toolbarWidth-1,0,window.innerWidth,0)

  toolbar1Context.fillStyle = rgbToHex(colorSwatches[0])
  toolbar1Context.fillRect(7,4,14,14)

  toolbar1Context.fillStyle = rgbToHex(colorSwatches[1])
  toolbar1Context.fillRect(24,4,14,14)

  toolbar1Context.fillStyle = rgbToHex(colorSwatches[2])
  toolbar1Context.fillRect(16,21,14,14)

  toolbar1Context.fillStyle = rgbToHex(colorSwatches[3])
  toolbar1Context.fillRect(33,21,14,14)

  palleteIndex = 0
  while palleteIndex < colorPallete.length
    toolbar1Context.fillStyle = rgbToHex(colorPallete[palleteIndex])
    toolbar1Context.fillRect(52 + (17 * (palleteIndex // 2)), 4 + (17 * (palleteIndex % 2)),14,14)
    palleteIndex++

  drawInformationToolbar0()

modeToGlyph = (tool) ->
  if tool.modeCapable
    if tool.mode
      return ',T'
    else
      return ',F'
  else
    return '  '

magnitudeToGlyph = (tool) ->
  if typeof selectedTool.maxMagnitude == 'string'
    return ' '
  else
    return selectedTool.magnitude.toString(16).toUpperCase()

drawInformationToolbar1 = ->
  xPos = event.clientX - (toolbarWidth + 5) - canvasXOffset
  yPos = event.clientY - 5 - canvasYOffset
  colorValue = getColorValue(ctContext, xPos, yPos).toUpperCase()
  coordinates = ', (' + xPos.toString() + ', ' + yPos.toString() + ')'
  colorAndCoordinates = colorValue + coordinates
  drawStringAsCommandPrompt(toolbar1Context, colorAndCoordinates, 0, 191, 12)

drawInformationToolbar0 = ->
  toolbarInformation = magnitudeToGlyph(selectedTool)+modeToGlyph(selectedTool)
  drawStringAsCommandPrompt(toolbar0Context, toolbarInformation, 0, 6, 104)

getMousePositionOnCanvas = (event) ->
  xSpot = event.clientX - (toolbarWidth+5) - canvasXOffset
  ySpot = event.clientY - 5 - canvasYOffset

getMousePositionOnZoom = (event) ->
  xSpotZoom = event.clientX - (toolbarWidth)
  ySpotZoom = event.clientY - (toolbarHeight)

scaleCanvasBigger = ( factor ) ->
  console.log 'FACTOR * DIMENSION', factor * ctCanvas.width, factor * ctCanvas.height
  ctCanvas.style.width = (factor * ctCanvas.width).toString()+'px'
  ctCanvas.style.height = (factor * ctCanvas.height).toString()+'px'

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
    ctPaintTools[16].toolsAction()
  if event.keyCode == keysToKeyCodes['b']
    ctPaintTools[17].toolsAction()
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

$(document).ready ()->
  setTimeout( ()->
    #ctContext.imageSmoothingEnabled = false
    setCanvasSizes()
    prepareCanvas()
    placeToolbars()
    selectedTool = ctPaintTools[7]
    previouslySelectedTool = ctPaintTools[7]
    drawToolbars()
    positionMenu()
    canvasAsData = ctCanvas.toDataURL()
  , 2000)

  $('body').keydown (event) ->
    if normalCircumstance
      keyListeningUnderNormalCircumstance(event)
    else
      whatSortOfDataSorting( keyListeningUnderAbnormalCircumstance(event) )
    if event.keyCode == keysToKeyCodes['up']
      if canvasHeight > (window.innerHeight - toolbarHeight - 5)
        if canvasYOffset < 0 
          canvasYOffset+=3
          positionCanvas()
          positionCorners()
    if event.keyCode == keysToKeyCodes['down']
      if canvasHeight > (window.innerHeight - toolbarHeight - 5)
        if (-1 * canvasYOffset) < ((canvasHeight + 10) - (window.innerHeight - toolbarHeight))
          canvasYOffset-=3
          positionCanvas()
          positionCorners()
    if event.keyCode == keysToKeyCodes['alt']
      toolViewMode++
      toolViewMode = toolViewMode%2
      drawToolbars()
    if event.keyCode == keysToKeyCodes['space']
      if selectedTool.mode
        selectedTool.mode = false
      else
        selectedTool.mode = true
    if event.keyCode == keysToKeyCodes['equals']
      if selectedTool.magnitude < selectedTool.maxMagnitude
        selectedTool.magnitude++
        drawInformationToolbar0()
    if event.keyCode == keysToKeyCodes['minus']
      if selectedTool.magnitude > 1
        selectedTool.magnitude--
        drawInformationToolbar0()
    if event.keyCode == keysToKeyCodes['shift']
      colorModify = true


  $('body').keyup (event) ->
    if event.keyCode == keysToKeyCodes['shift']
      colorModify = false

  $(window).resize ()->
    if canvasWidth < (window.innerWidth - toolbarWidth - 5)
      canvasXOffset = 0
    if canvasHeight < (window.innerHeight - toolbarHeight - 5)
      canvasYOffset = 0
    if menuUp
      $('#menuDiv').css('top', (window.innerHeight - toolbarHeight - 45).toString())
      $('#menuDiv').css('left', (toolbarWidth + 10).toString())
    else
      $('#menuDiv').css('top', (window.innerHeight).toString())
    positionCanvas()
    positionCorners()
    setCanvasSizes()
    placeToolbars()
    drawToolbars()

  $(window).scroll ()->
    window.scroll(0,0)

  window.onmousemove = () ->
    rightBoundary = (canvasWidth + 5 + toolbarWidth + 20)
    leftBoundary = (canvasWidth + 5 + toolbarWidth)
    if (event.clientX < rightBoundary) and (leftBoundary < event.clientX)
      if (event.clientY < (canvasHeight + 5 + 20)) and ((canvasHeight + 5) < event.clientY)
        $('#wholeWindow').css 'cursor', 'se-resize'
    else
      $('#wholeWindow').css 'cursor', 'default'

  window.onmousedown = (event)->
    rightBoundary = (canvasWidth + 5 + toolbarWidth + 20)
    leftBoundary = (canvasWidth + 5 + toolbarWidth)
    if (event.clientX < rightBoundary) and (leftBoundary < event.clientX)
      if (event.clientY < (canvasHeight + 5 + 20)) and ((canvasHeight + 5) < event.clientY)
        canvasAsData = ctCanvas.toDataURL()
        oldX = event.clientX
        oldY = event.clientY
        draggingBorder = true

  window.onmouseup = (event) ->
    if draggingBorder
      draggingBorder = false
      ctContext.canvas.width = event.clientX - oldX + canvasWidth
      ctContext.canvas.height = event.clientY - oldY + canvasHeight
      canvasDataAsImage = new Image()
      canvasDataAsImage.onload = ->
        ctContext.drawImage(canvasDataAsImage,0,0)
        canvasAsData = ctCanvas.toDataURL()
        canvasDataAsImage = new Image()
        canvasDataAsImage.src = canvasAsData
      canvasDataAsImage.src = canvasAsData
      ctContext.fillStyle = rgbToHex(colorSwatches[1])
      if (ctContext.canvas.width > canvasWidth) and (ctContext.canvas.height > canvasHeight)
        ctContext.fillRect(canvasWidth, 0, ctContext.canvas.width, ctContext.canvas.height)
        ctContext.fillRect(0, canvasHeight, canvasWidth, ctContext.canvas.height)
      else if (ctContext.canvas.width > canvasWidth)
        ctContext.fillRect(canvasWidth, 0, ctContext.canvas.width, ctContext.canvas.height)
      else if (ctContext.canvas.height > canvasHeight)
        ctContext.fillRect(0, canvasHeight, ctContext.canvas.width, ctContext.canvas.height)
      canvasWidth = ctContext.canvas.width
      canvasHeight = ctContext.canvas.height
      ctCanvas.style.width = (canvasWidth).toString()+'px'
      ctCanvas.style.height = (canvasHeight).toString()+'px'
      positionCorners()
      $('#wholeWindow').css 'cursor', 'default'   

  $('#CtPaint').mouseleave ()->  
    toolbar1Context.drawImage(toolbar1sImage1,188,3)   

  $('#CtPaint').mousemove (event)->
    toolbar1Context.drawImage(toolbar1sImage1,188,3)   
    drawInformationToolbar0()
    drawInformationToolbar1()
    if not areaSelected
      switch selectedTool.name
        when 'select'
          if mousePressed
            if not areaSelected
              getMousePositionOnCanvas(event)
              canvasDataAsImage = new Image()
              canvasDataAsImage.onload = ->
                ctContext.drawImage(canvasDataAsImage,0,0)
                selectedTool.toolsAction(ctContext, oldX, oldY, xSpot, ySpot)
              canvasDataAsImage.src = canvasAsData
            else

        when 'square'
          if mousePressed
            getMousePositionOnCanvas(event)
            canvasDataAsImage = new Image()
            canvasDataAsImage.onload = ->
              ctContext.drawImage(canvasDataAsImage,0,0)
              selectedTool.toolsAction(ctContext, colorSwatches[0], oldX, oldY, xSpot, ySpot)
            canvasDataAsImage.src = canvasAsData
        when 'circle'
          if mousePressed
            getMousePositionOnCanvas(event)
            canvasDataAsImage = new Image()
            canvasDataAsImage.onload = ->
              ctContext.drawImage(canvasDataAsImage,0,0)
              selectedTool.toolsAction(ctContext, colorSwatches[0], xSpot, ySpot)
            canvasDataAsImage.src = canvasAsData
        when 'line'
          if mousePressed
            getMousePositionOnCanvas(event)
            canvasDataAsImage = new Image()
            canvasDataAsImage.onload = ->
              ctContext.drawImage(canvasDataAsImage,0,0)
              selectedTool.toolsAction(ctContext, colorSwatches[0], oldX, oldY, xSpot, ySpot)
            canvasDataAsImage.src = canvasAsData
        when 'point'
          if mousePressed
            oldX = xSpot
            oldY = ySpot
            getMousePositionOnCanvas(event)
            selectedTool.toolsAction(ctContext, colorSwatches[0], xSpot, ySpot, oldX, oldY)
    else
      getMousePositionOnCanvas(event)
      areaXOffset = xSpot - areaOldX
      areaYOffset = ySpot - areaOldY
      canvasDataAsImage = new Image()
      canvasDataAsImage.onload = ->
        ctContext.drawImage(canvasDataAsImage,0,0)
        console.log 'C', selectionToPaste
        ctContext.putImageData(selectionToPaste, oldX + 1 + areaXOffset, oldY + 1 + areaYOffset)
      canvasDataAsImage.src = canvasAsData
      #selectedTool.toolsAction(ctContext, oldX, oldY, xSpot, ySpot)


  $('#CtPaint').mousedown (event)->
    mousePressed = true
    getMousePositionOnCanvas(event)
    if not areaSelected
      switch selectedTool.name
        when 'zoom'
          selectedTool.toolsAction()
        when 'select'
          oldX = xSpot
          oldY = ySpot
        when 'fill'
          selectedTool.toolsAction(ctCanvas, ctContext, colorSwatches[0], xSpot, ySpot)
        when 'circle'
          oldX = xSpot
          oldY = ySpot
        when 'square'
          oldX = xSpot
          oldY = ySpot
        when 'line'
          oldX = xSpot
          oldY = ySpot
        when 'point'
          selectedTool.toolsAction(ctContext, colorSwatches[0], xSpot, ySpot, xSpot, ySpot)
    else
      #console.log 'A', areasXSpot < xSpot, xSpot < (areasXSpot + areaSelectedsWidth)
      #console.log 'A.1', areasXSpot, areaSelectedsWidth, areasXSpot + areaSelectedsWidth
      if areasXSpot < xSpot and xSpot < (areasXSpot + areaSelectedsWidth) and areasYSpot < ySpot and ySpot < (areasYSpot + areaSelectedsHeight)
        areaOldX = xSpot
        areaOldY = xSpot
      else
        canvasDataAsImage = new Image()
        canvasDataAsImage.onload = ->
          ctContext.drawImage(canvasDataAsImage,0,0)
          console.log 'C', selectionToPaste
          ctContext.putImageData(selectionToPaste, oldX + 1, oldY + 1)
          canvasAsData = ctCanvas.toDataURL()
        canvasDataAsImage.src = canvasAsData
        areaSelected = false
        justUp = true


  $('#CtPaint').mouseup (event)->
    mousePressed = false
    switch selectedTool.name
      when 'select'
        if not areaSelected
          if not justUp
            getMousePositionOnCanvas(event)
            areaSelected = true
            areasXSpot = oldX
            areasYSpot = oldY
            areaSelectedsHeight = Math.abs(oldY - ySpot)
            areaSelectedsWidth = Math.abs(oldX - xSpot)
            selection = ctContext.getImageData(oldX + 1, oldY + 1, Math.abs((oldX + 1) - xSpot), Math.abs((oldY + 1) - ySpot))
            selectionToPaste = document.createElement('canvas').getContext('2d').createImageData(selection.width, selection.height)
            datumIndex = 0
            while datumIndex < selection.data.length
              selectionToPaste.data[datumIndex] = selection.data[datumIndex]
              datumIndex++
            #squareAction = (canvas, color, beginX, beginY, endX, endY)
            canvasDataAsImage = new Image()
            canvasDataAsImage.onload = ->
              ctContext.drawImage(canvasDataAsImage,0,0)
              squareAction(ctContext, colorSwatches[1], oldX + 1, oldY + 1, xSpot - 1, ySpot - 1, true)
              canvasAsData = ctCanvas.toDataURL()
              ctContext.putImageData(selectionToPaste, oldX + 1, oldY + 1)
              selectedTool.toolsAction(ctContext, oldX, oldY, xSpot, ySpot)
            canvasDataAsImage.src = canvasAsData
          else
            justUp = false

          #ctContext.putImageData(selectionToPaste, oldX + 1, oldY + 1 )
          #drawSelectBox(ctContext, oldX, oldY, xSpot, ySpot)
        #else
          #squareAction(ctContext, colorSwatches[2], oldX + 1, oldY + 1, xSpot - 1, ySpot - 1, true)
          #ctContext.putImageData(selectionToPaste, oldX + 1 + areaXOffset, oldY + 1 + areaYOffset)


      when 'fill'
        canvasAsData = ctCanvas.toDataURL()
      when 'square'
        canvasAsData = ctCanvas.toDataURL()
      when 'circle'
        canvasAsData = ctCanvas.toDataURL()
      when 'line'
        canvasAsData = ctCanvas.toDataURL()
      when 'point'
        canvasAsData = ctCanvas.toDataURL()

  $('#zoomWindow').mousedown (event)->
    mousePressed = true
    switch selectedTool.name
      when 'zoom'
        selectedTool.toolsAction()

  $('#toolbar0').mousedown (event)->
    toolIndex = 0
    while toolIndex < numberOfTools
      if ctPaintTools[toolIndex].clickRegion[0]<event.clientX and event.clientX<(ctPaintTools[toolIndex].clickRegion[0]+buttonWidth)
        if ctPaintTools[toolIndex].clickRegion[1]<event.clientY and event.clientY<(ctPaintTools[toolIndex].clickRegion[1]+buttonHeight)
          if toolIndex < 8 
            previouslySelectedTool = selectedTool
            selectedTool = ctPaintTools[toolIndex]
          else
            console.log 'C', ctPaintTools[toolIndex]
            ctPaintTools[toolIndex].toolsAction()
      toolIndex++
    drawToolbars()

  $('#toolbar1').mousemove (event)->
    drawStringAsCommandPrompt(toolbar1Context, getColorValue(toolbar1Context, event.clientX, event.clientY - window.innerHeight + toolbarHeight).toUpperCase() + ', (#,#) ', 0, 191, 12)

  $('#toolbar1').mouseleave ()->  
    toolbar1Context.drawImage(toolbar1sImage1,188,3)  

  $('#toolbar1').mousedown (event)->
    toolbar1X = event.clientX
    toolbar1Y = event.clientY - (window.innerHeight - toolbarHeight)
    if 52 < toolbar1X and toolbar1X < 188
      if 4 < toolbar1Y and toolbar1Y < 35
        if colorModify
          spotInColorPallete = (((toolbar1X - 52 ) // 17) * 2) + ((toolbar1Y - 4) // 16)
          colorMenu()
          console.log 'D'
        else
          colorSwatches[0] = colorPallete[(((toolbar1X - 52 ) // 17) * 2) + ((toolbar1Y - 4) // 16)]
        drawToolbars()