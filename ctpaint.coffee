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
  tH is an array containing tools. The last element in the array is the tool the user 
  is currently using. When he switches to a new tool, its added to the end of tH, and 
  the first element is removed (shift()).

  tH is regrettably named. Its short for 'toolHistory'. When I wrote toolHistory into
  the code, I would frequently reference the last element in toolHistory with
  toolHistory[toolHistory.length - 1], which was a pain. 

  Originally it was named 'selectedTool' wasnt an array. To get to previously selected
  tools. I would reference another variable named 'previouslySelectedTool'. I ran into
  problems, when the relevant history was greater than 1 tool into the past.
###
tH = [ undefined, undefined ]

# useful during tool declaration
numberOfTools = 24
# Refers to whether toolbar0 is in view mode 0 or 1
toolViewMode = 0

mousePressed = false
draggingBorder = false

zoomActivate = false
cornersVisible = true

###
  These variables are all relevant to the selection process, 
  which is initiated by either using the select tool, or 
  pasting an image into the canvas. 

  Selection is the actual image data. areaSelected is a global
  boolean of whether an area is selected. selectionX and 
  selectionY are its location on the canvas. gripX and gripY
  is the location of selection while it is being dragged.
###

selection = undefined
areaSelected = false
selectionX = 0
selectionY = 0
gripX = 0
gripY = 0
selectionsWidth = 0
selectionsHeight = 0

###
  These variables are useful when any pop up menu shows up.
  menuUp reflects whether a menu is up. whatSortOfDataSorting
  is delcared as various functions that have their own processes
  of data reading. menuDatumZero is a some stored memory
  relevant to that menu, such as the width of the canvas in the
  resize menu. spotInMenuZeroDatum is what spot in the stored
  memory is being modified.
###

menuUp = false
whatSortOfDataSorting = undefined
menuDatum = undefined
spotInMenuDatum = 0

###
  A menu being up is an abnormal circumstance. The key
  press events are different depending on whether conditions
  are normal or not.
### 
normalCircumstance = true

###
  xSpot and ySpot are the global variables for the x coordinated.
  They are only updated by the getMousePositionOnCanvas function.
  oldX and oldY are used in the many tools that require a memory
  of where the tool started, or where it was.
###
xSpot = undefined
ySpot = undefined

oldX = undefined
oldY = undefined

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
  Color menu is the menu that comes up when you shift click
  on any color in the color pallete. The color menu has one input,
  that begin a hexidecimal color. When Enter is pressed, that spot 
  in the color pallete becomes that hexidecimal color. 
###

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
  menuDatum = rgbToHex(colorPallete[spotInColorPallete]).substr(1)
  spotInMenuDatum = 0
  drawColorMenu()

###
  This function takes strings of key names, and decides what to do with them
###
colorDataSorting = ( inputMaterial ) ->
  if inputMaterial isnt undefined
    keysThatDontAddData = ['backspace', 'left', 'right', 'enter']
    if not (inputMaterial in keysThatDontAddData)
      menuDatum = replaceAt(menuDatum, inputMaterial, spotInMenuDatum )
      if spotInMenuDatum < 5
        spotInMenuDatum++
    else
      switch inputMaterial
        when 'backspace'
          menuDatum = replaceAt(menuDatum, '0', spotInMenuDatum)
          if 0 < spotInMenuDatum
            spotInMenuDatum--
        when 'left'
          if 0 < spotInMenuDatum
            spotInMenuDatum--
        when 'right'
          if spotInMenuDatum < 5
            spotInMenuDatum++
        when 'enter'
          colorPallete[spotInColorPallete] =  hexToRGB(menuDatum)
          drawToolbars()
          $('#menuDiv').css('top',(window.innerHeight).toString())
          normalCircumstance = true
          menuUp = false
    drawColorMenu()

drawColorMenu = () ->
  currentlyHighlighted = menuDatum[spotInMenuDatum].toUpperCase()
  drawStringAsCommandPrompt( menuContext, menuDatum.toUpperCase(), 1, 91, 10 )
  drawStringAsCommandPrompt( menuContext, currentlyHighlighted, 2, 91+(12*spotInMenuDatum), 10 )


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
  red = parseInt(hex[0] + hex[1], 16)
  green = parseInt(hex[2] + hex[3], 16)
  blue = parseInt(hex[4] + hex[5], 16)
  return [red, green, blue]

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


getColorValue = (canvas, whereAtX, whereAtY) ->
  return rgbToHex(canvas.getImageData(whereAtX, whereAtY, 1, 1).data)

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
  revisedCanvasToPaste = revisedCanvasToPaste.getContext('2d')
  revisedCanvasToPaste = revisedCanvasToPaste.createImageData(canvas.width, canvas.height)
  
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
  if not tH[tH.length - 1].mode and not fillOrNot
    magnitudeIncrement = 0
    if (beginX < endX) == (beginY < endY)
      if (beginX < endX)
        while magnitudeIncrement < tH[tH.length - 1].magnitude
          mi = magnitudeIncrement
          drawLine(canvas, color, beginX + mi, beginY + mi, endX - mi, beginY + mi)
          drawLine(canvas, color, beginX + mi, beginY + mi, beginX + mi, endY - mi )
          drawLine(canvas, color, endX - mi, beginY + mi, endX - mi, endY - mi)
          drawLine(canvas, color, beginX + mi, endY - mi, endX - mi, endY - mi)
          magnitudeIncrement++
      else
        while magnitudeIncrement < tH[tH.length - 1].magnitude
          mi = magnitudeIncrement
          drawLine(canvas, color, beginX - mi, beginY - mi, endX + mi, beginY - mi)
          drawLine(canvas, color, beginX - mi, beginY - mi, beginX - mi, endY + mi )
          drawLine(canvas, color, endX + mi, beginY - mi, endX + mi, endY + mi)
          drawLine(canvas, color, beginX - mi, endY + mi, endX + mi, endY + mi)
          magnitudeIncrement++
    else
      if (endY < beginY)
        while magnitudeIncrement < tH[tH.length - 1].magnitude
          mi = magnitudeIncrement
          drawLine(canvas, color, beginX + mi, beginY - mi, endX - mi, beginY - mi)
          drawLine(canvas, color, beginX + mi, beginY - mi, beginX + mi, endY + mi )
          drawLine(canvas, color, endX - mi, beginY - mi, endX - mi, endY + mi)
          drawLine(canvas, color, beginX + mi, endY + mi, endX - mi, endY + mi)
          magnitudeIncrement++
      else
        while magnitudeIncrement < tH[tH.length - 1].magnitude
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


###
  drawCircle is the basic circle drawing function. The arguments are as
  you would expect with the exception of cornerBlock. When the circle
  tool has fill turned on, smaller circles are drawn inside of a largest
  circle. When ctPaint draws successive circles some of the successors
  dont put pixels one pixel deeper. There are empty speckles. To avoid
  that, the corner block argument switches on a mode to bulk out the 
  'corners' of the circle, meaning, when the next pixel is being drawn
  diagonally (+1, +1) from the current pixel, draw a pixel vertically 
  and horizontally (+1, 0) and (0, +1)

  The draw circle function is a bresenham algorithm, which can only
  draw one eight of a complete circle. If the algorithm is done
  eight times inverted vertically, horizontally, and across the 
  axis(?) You can get each section of the circle (2 ^ 3 = 8)
###

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

circleAction = ( canvas, color, xPos, yPos ) ->
  if not tH[tH.length - 1].mode
    whetherCornerBlocks = false
    if tH[tH.length - 1].magnitude > 1
      whetherCornerBlocks = true
    calculatedRadius = Math.pow(Math.pow(xPos - oldX, 2) + Math.pow(yPos - oldY, 2), 0.5)
    calculatedRadius = Math.round(calculatedRadius)
    magnitudeIncrement = 0
    while magnitudeIncrement < tH[tH.length - 1].magnitude
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



###
  drawline is the basic line drawing function. Its a
  bresenham algorithm.
###

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

###
  Line action is an elaboration using drawine as well as draw
  circle. The line is made thicker by just drawing several lines,
  with end points expanding away from a center end point. This
  does not create a very 'natural' looking end point, but it does
  make the line bolder. To give the line a more 'natural' end point,
  a filled circle is drawn on each end.
###

lineAction = (canvas, color, beginX, beginY, endX, endY) ->
  lineSlope = undefined
  if tH[tH.length - 1].magnitude > 1
    lineSlope = Math.abs(beginX - endX) / Math.abs(beginY - endY)
    if lineSlope > 1
      lineSlope = Math.abs(beginY - endY) / Math.abs(beginX - endX)
  magnitudeIncrement = 0
  while magnitudeIncrement < tH[tH.length - 1].magnitude
    drawLine(canvas, color, beginX + magnitudeIncrement, beginY, endX + magnitudeIncrement, endY)
    drawLine(canvas, color, beginX - magnitudeIncrement, beginY, endX - magnitudeIncrement, endY)
    drawLine(canvas, color, beginX, beginY + magnitudeIncrement, endX, endY + magnitudeIncrement)
    drawLine(canvas, color, beginX, beginY - magnitudeIncrement, endX, endY - magnitudeIncrement)
    magnitudeIncrement++
  if tH[tH.length - 1].magnitude > 1
    calculatedRadius = (tH[tH.length - 1]) - Math.round(lineSlope * 1.21)
    magnitudeIncrement = 0
    while magnitudeIncrement < calculatedRadius
      drawCircle( canvas, color, beginX, beginY, calculatedRadius - magnitudeIncrement, true )
      drawCircle( canvas, color, endX, endY, calculatedRadius - magnitudeIncrement, true )
      magnitudeIncrement++


###
  Put pixel is a basic drawing function. A pixel of a given
  color is placed on the canvas as the location given. 
  The color is given as an rgb array, and translated into
  image data.
###
putPixel = (canvas, color, whereAtX, whereAtY) ->
  newPixel = canvas.createImageData(1,1)
  newPixelsColor = newPixel.data
  newPixelsColor[0] = color[0]
  newPixelsColor[1] = color[1]
  newPixelsColor[2] = color[2]
  newPixelsColor[3] = 255
  canvas.putImageData(newPixel, whereAtX, whereAtY)

###
  Ironically point action does not utilize the put pixel
  function. Line and circle drawing form the basis of
  the point tool. Should putpixel be used to put a pixel
  where the mouse is clicked, the user could not draw
  strokes. The browser does not register mouse location 
  fast enough, resulting in distantly spaced specks, as
  the mouse might travel 10 or 20 pixels between putpixel
  actions.

  Instad, lines are drawn. When the typical user decides
  to change one pixel, they are actually drawing a line
  of length 1. When strokes are made, the past location
  of the mouse is continuously remembered, and a line
  is drawn from that location to the present location.

  When the magnitude of the point tool is increased,
  it instead continuously draws circles instead of
  points.
###
pointAction = (canvas, color, beginX, beginY, endX, endY) ->
  if tH[tH.length - 1].magnitude < 2
    drawLine(canvas, color, beginX, beginY, endX, endY)
  else
    magnitudeIncrement = 0
    while magnitudeIncrement < tH[tH.length - 1].magnitude
      drawLine(canvas, color, beginX + magnitudeIncrement, beginY, endX + magnitudeIncrement, endY)
      drawLine(canvas, color, beginX - magnitudeIncrement, beginY, endX - magnitudeIncrement, endY)
      drawLine(canvas, color, beginX, beginY + magnitudeIncrement, endX, endY + magnitudeIncrement)
      drawLine(canvas, color, beginX, beginY - magnitudeIncrement, endX, endY - magnitudeIncrement)
      magnitudeIncrement++
  if tH[tH.length - 1].magnitude > 1
    calculatedRadius = (tH[tH.length - 1].magnitude - 2)
    magnitudeIncrement = 0
    while magnitudeIncrement < calculatedRadius
      drawCircle( canvas, color, beginX, beginY, calculatedRadius - magnitudeIncrement, true )
      drawCircle( canvas, color, endX, endY, calculatedRadius - magnitudeIncrement, true )
      magnitudeIncrement++
    
flipAction = () ->
  menuUp = true
  normalCircumstance = false
  $('#menuDiv').css('top', (window.innerHeight - toolbarHeight - 45).toString())
  $('#menuDiv').css('left', (toolbarWidth + 10).toString())

  menuContext.canvas.width = 119
  menuContext.canvas.height = 35

  tH.push ctPaintTools[10]

  menuContext.drawImage(tH[tH.length - 1].menuImage, 0, 0)
  drawToolbars()

  whatSortOfDataSorting = flipDataSorting

flipDataSorting = ( inputMaterial ) ->
  if inputMaterial isnt undefined
    acceptableKeys = ['x','y']
    if inputMaterial in acceptableKeys
      switch inputMaterial
        when 'x'
          if areaSelected
            console.log selection.data 
          else
            tWidth = ctContext.canvas.width
            tHeight = ctContext.canvas.height
            canvasAsWeFoundIt = ctContext.getImageData(0, 0, tWidth, tHeight)
            canvasData = canvasAsWeFoundIt.data
            canvasInPixels = []

            canvasIndex = 0
            colorAtDatum = []
            while canvasIndex < canvasData.length
              colorAtDatum.push canvasData[canvasIndex]
              if canvasIndex % 4 is 3
                canvasInPixels.push colorAtDatum
                colorAtDatum = []
              canvasIndex++

            flippedCanvas = []
            pixelIndex = 0
            while pixelIndex < canvasInPixels.length
              rowStart = pixelIndex // tWidth
              inRow = pixelIndex %% tWidth
              pixelToFlip = rowStart * tWidth
              pixelToFlip += (tWidth - inRow - 1)
              flippedCanvas.push canvasInPixels[pixelToFlip]
              pixelIndex++

            pixelIndex = 0
            while pixelIndex < canvasInPixels.length
              colorIndex = 0
              while colorIndex < 4
                datumIndex = pixelIndex * 4
                canvasAsWeFoundIt.data[datumIndex + colorIndex] = 
                  flippedCanvas[pixelIndex][colorIndex]
                colorIndex++
              pixelIndex++

            ctContext.putImageData(canvasAsWeFoundIt, 0, 0)
            canvasAsData = ctCanvas.toDataURL()
            tH.pop()
            drawToolbars()
            $('#menuDiv').css('top',(window.innerHeight).toString())
            normalCircumstance = true
            menuUp = false
        when 'y'
          if areaSelected
            console.log selection.data 
          else
            tWidth = ctContext.canvas.width
            tHeight = ctContext.canvas.height
            canvasAsWeFoundIt = ctContext.getImageData(0, 0, tWidth, tHeight)
            canvasData = canvasAsWeFoundIt.data
            canvasInPixels = []

            canvasIndex = 0
            colorAtDatum = []
            while canvasIndex < canvasData.length
              colorAtDatum.push canvasData[canvasIndex]
              if canvasIndex % 4 is 3
                canvasInPixels.push colorAtDatum
                colorAtDatum = []
              canvasIndex++

            flippedCanvas = []
            rowIndex = 0
            while rowIndex < (canvasInPixels.length // tWidth)
              thisRow = (canvasInPixels.length // tWidth) - rowIndex - 1
              rowAt = thisRow * tWidth
              columnIndex = 0
              while columnIndex < tWidth
                flippedCanvas.push canvasInPixels[rowAt + columnIndex]
                columnIndex++
              rowIndex++

            pixelIndex = 0
            while pixelIndex < canvasInPixels.length
              colorIndex = 0
              while colorIndex < 4
                datumIndex = pixelIndex * 4
                canvasAsWeFoundIt.data[datumIndex + colorIndex] = 
                  flippedCanvas[pixelIndex][colorIndex]
                colorIndex++
              pixelIndex++

            ctContext.putImageData(canvasAsWeFoundIt, 0, 0)
            canvasAsData = ctCanvas.toDataURL()
            tH.pop()
            drawToolbars()
            $('#menuDiv').css('top',(window.innerHeight).toString())
            normalCircumstance = true
            menuUp = false


invertAction = () ->
  tH.push ctPaintTools[12]

  tWidth = ctContext.canvas.width
  tHeight = ctContext.canvas.height
  canvasAsWeFoundIt = ctContext.getImageData(0, 0, tWidth, tHeight)
  canvasData = canvasAsWeFoundIt.data
  canvasInPixels = []

  canvasIndex = 0
  colorAtDatum = []
  while canvasIndex < canvasData.length
    colorAtDatum.push canvasData[canvasIndex]
    if canvasIndex % 4 is 3
      canvasInPixels.push colorAtDatum
      colorAtDatum = []
    canvasIndex++

  pixelIndex = 0
  while pixelIndex < canvasInPixels.length
    red = canvasInPixels[pixelIndex][0]
    green = canvasInPixels[pixelIndex][1]
    blue = canvasInPixels[pixelIndex][2]
    canvasInPixels[pixelIndex] = [ 255 - red, 255 - green, 255 - blue, 255]
    pixelIndex++

  pixelIndex = 0
  while pixelIndex < canvasInPixels.length
    colorIndex = 0
    while colorIndex < 4
      datumIndex = pixelIndex * 4
      canvasAsWeFoundIt.data[datumIndex + colorIndex] = 
      canvasInPixels[pixelIndex][colorIndex]
      colorIndex++
    pixelIndex++

  ctContext.putImageData(canvasAsWeFoundIt, 0, 0)
  canvasAsData = ctCanvas.toDataURL()

  setTimeout( ()->
    tH.pop()
    drawToolbars()
  ,20)
resizeAction = () ->
  menuUp = true
  normalCircumstance = false
  $('#menuDiv').css('top', (window.innerHeight - toolbarHeight - 45).toString())
  $('#menuDiv').css('left', (toolbarWidth + 10).toString())

  menuContext.canvas.width = 390
  menuContext.canvas.height = 35

  tH.push ctPaintTools[15]
  menuContext.drawImage(tH[tH.length - 1].menuImage, 0, 0)
  drawToolbars()

  resizeDataSortingInitialize(canvasWidth, canvasHeight)
  whatSortOfDataSorting = resizeDataSorting

resizeDataSortingInitialize = (width, height) ->
  menuDatum = zeroPadder(width, 4) + zeroPadder(height, 4)
  spotInMenuDatum = 0
  drawResizeMenu()

resizeDataSorting = ( inputMaterial ) ->
  if inputMaterial isnt undefined
    keysThatDontAddData = ['backspace', 'left', 'right', 'enter']
    if not (inputMaterial in keysThatDontAddData)
      if not isNaN(inputMaterial)
        menuDatum = replaceAt(menuDatum, inputMaterial, spotInMenuDatum )
        if spotInMenuDatum < 7
          spotInMenuDatum++
    else
      switch inputMaterial
        when 'backspace'
          menuDatum = replaceAt(menuDatum, '0', spotInMenuDatum)
          if 0 < spotInMenuDatum
            spotInMenuDatum--
        when 'left'
          if 0 < spotInMenuDatum
            spotInMenuDatum--
        when 'right'
          if spotInMenuDatum < 7
            spotInMenuDatum++
        when 'enter'
          $('#menuDiv').css('top',(window.innerHeight).toString())
          normalCircumstance = true
          menuUp = false
          newWidth = menuDatum.substr(0,4)
          newHeight = menuDatum.substr(4,4)
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
          tH.pop()
          drawToolbars()
    drawResizeMenu()

drawResizeMenu = () ->
  drawStringAsCommandPrompt( menuContext, menuDatum.substr(0,4), 1, 116, 10 )
  drawStringAsCommandPrompt( menuContext, menuDatum.substr(4,4), 1, 228, 10 )
  xPos = 116 + ((spotInMenuDatum // 4) * 112) + ( 12 * ( spotInMenuDatum %% 4 ) )
  drawStringAsCommandPrompt( menuContext, menuDatum[spotInMenuDatum], 2, xPos, 10 )


###
  HorizontalColorSwap swaps the 4 swatch colors horizontally.
  Meaning if the swatches are:

      *** ***
      *0* *1*
      *** ***

        *** ***
        *2* *3*
        *** ***

  horizontalColorSwap swaps 0 with 1, and 2 with 3    
###
horizontalColorSwap = () ->
  tH.push ctPaintTools[16]
  drawToolbars()

  rearrangedSwatches = [ colorSwatches[1], colorSwatches[0], colorSwatches[3], colorSwatches[2] ]
  colorSwatches = rearrangedSwatches

  setTimeout( ()->
    tH.pop()
    drawToolbars()
  ,20)

###
  verticalColorSwap swaps the 4 swatch colors vertically.
  Meaning if the swatches are:

      *** ***
      *0* *1*
      *** ***

        *** *** 
        *2* *3*
        *** ***

  verticalColorSwap swaps 0 with 2, and 1 with 3    
###
verticalColorSwap = () ->
  tH.push ctPaintTools[17]
  drawToolbars()

  rearrangedSwatches = [ colorSwatches[2], colorSwatches[3], colorSwatches[0], colorSwatches[1] ]
  colorSwatches = rearrangedSwatches

  setTimeout( ()->
    tH.pop()
    drawToolbars()
  ,20)

positionCorners = ->
  if cornersVisible
    $('#corner0Div').css('top',(canvasYPos-1+canvasYOffset).toString())
    $('#corner0Div').css('left',(canvasXPos-1+canvasXOffset).toString())

    $('#corner1Div').css('top',(canvasYPos-1+canvasYOffset).toString())
    $('#corner1Div').css('left',(canvasXPos+canvasWidth+1+canvasXOffset).toString())

    $('#corner2Div').css('top',(canvasYPos+canvasHeight+1+canvasYOffset).toString())
    $('#corner2Div').css('left',(canvasXPos+canvasWidth+1+canvasXOffset).toString())

    $('#corner3Div').css('top',(canvasYPos+canvasHeight+1+canvasYOffset).toString())
    $('#corner3Div').css('left',(canvasXPos-1+canvasXOffset).toString())
  
  else
    $('#corner0Div').css('top',(window.innerHeight).toString())
    $('#corner0Div').css('left',(canvasXPos-1+canvasXOffset).toString())

    $('#corner1Div').css('top',(window.innerHeight).toString())
    $('#corner1Div').css('left',(canvasXPos+canvasWidth+1+canvasXOffset).toString())

    $('#corner2Div').css('top',(window.innerHeight).toString())
    $('#corner2Div').css('left',(canvasXPos+canvasWidth+1+canvasXOffset).toString())

    $('#corner3Div').css('top',(window.innerHeight).toString())
    $('#corner3Div').css('left',(canvasXPos-1+canvasXOffset).toString())  

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
  toolbar0Context.drawImage(
    tH[tH.length - 1].pressedImage[toolViewMode]
    tH[tH.length - 1].clickRegion[0],
    tH[tH.length - 1].clickRegion[1])

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

modeToGlyph = () ->
  if tH[tH.length - 1].modeCapable
    if tH[tH.length - 1].mode
      return ',T'
    else
      return ',F'
  else
    return '  '

magnitudeToGlyph = () ->
  if typeof tH[tH.length - 1] is 'string'
    return ' '
  else
    return tH[tH.length - 1].magnitude.toString(16).toUpperCase()

drawInformationToolbar1 = ->
  xPos = event.clientX - (toolbarWidth + 5) - canvasXOffset
  yPos = event.clientY - 5 - canvasYOffset
  colorValue = getColorValue(ctContext, xPos, yPos).toUpperCase()
  coordinates = ', (' + xPos.toString() + ', ' + yPos.toString() + ')'
  colorAndCoordinates = colorValue + coordinates
  drawStringAsCommandPrompt(toolbar1Context, colorAndCoordinates, 0, 191, 12)

drawInformationToolbar0 = ->
  toolbarInformation = magnitudeToGlyph()+modeToGlyph()
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
  if event.keyCode == keysToKeyCodes['2']
    tH.push ctPaintTools[1]
    tH.shift()
    drawToolbars()
  if event.keyCode == keysToKeyCodes['3']
    tH.push ctPaintTools[2]
    tH.shift()
    drawToolbars()
  if event.keyCode == keysToKeyCodes['4']
    tH.push ctPaintTools[3]
    tH.shift()
    drawToolbars()
  if event.keyCode == keysToKeyCodes['5']
    tH.push ctPaintTools[4]
    tH.shift()
    drawToolbars()
  if event.keyCode == keysToKeyCodes['6']
    tH.push ctPaintTools[5]
    tH.shift()
    drawToolbars()
  if event.keyCode == keysToKeyCodes['7']
    tH.push ctPaintTools[6]
    tH.shift()
    drawToolbars()
  if event.keyCode == keysToKeyCodes['8']
    tH.push ctPaintTools[7]
    tH.shift()
    drawToolbars()
  if event.keyCode == keysToKeyCodes['e']
    resizeAction()
  if event.keyCode == keysToKeyCodes['f']
    flipAction()
  if event.keyCode == keysToKeyCodes['i']
    invertAction()
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

zoomPosture = [
  () ->
    toolbar1Context.drawImage(toolbar1sImage1,188,3)   
    drawInformationToolbar0()
    drawInformationToolbar1()
  () ->
    mousePressed = true
    getMousePositionOnCanvas(event)
    if zoomActivate
      zoomActivate = false
      cornersVisible = true
      ctCanvas.style.width = (canvasWidth).toString()+'px'
      ctCanvas.style.height = (canvasHeight).toString()+'px'
    else
      zoomActivate = true
      cornersVisible = false
      scaleCanvasBigger( 2 ** tH[tH.length - 1].magnitude )
    positionCorners()
    drawToolbars()
  () ->
    mousePressed = false
]
selectPosture = [
  () ->
    if not areaSelected
      toolbar1Context.drawImage(toolbar1sImage1,188,3)   
      drawInformationToolbar0()
      drawInformationToolbar1()
      if mousePressed
        getMousePositionOnCanvas(event)
        canvasDataAsImage = new Image()
        canvasDataAsImage.onload = ->
          ctContext.drawImage(canvasDataAsImage,0,0)
          drawSelectBox(ctContext, oldX - 1, oldY - 1, xSpot + 1, ySpot + 1)
        canvasDataAsImage.src = canvasAsData
    else
      if mousePressed
        getMousePositionOnCanvas(event)
        xOffset = xSpot - oldX
        yOffset = ySpot - oldY
        gripX = selectionX + xOffset
        gripY = selectionY + yOffset
        rightEdge = gripX + selectionsWidth
        bottomEdge = gripY + selectionsHeight
        canvasDataAsImage = new Image()
        canvasDataAsImage.onload = ->
          ctContext.drawImage(canvasDataAsImage,0,0)
          canvasAsData = ctCanvas.toDataURL()
          ctContext.putImageData(selection, gripX, gripY)
          drawSelectBox(ctContext, gripX - 1, gripY - 1, rightEdge, bottomEdge)
        canvasDataAsImage.src = canvasAsData
  () ->
    mousePressed = true
    if not areaSelected
      getMousePositionOnCanvas(event)
      oldX = xSpot
      oldY = ySpot
    else
      getMousePositionOnCanvas(event)
      oldX = xSpot
      oldY = ySpot
      withinXBoundaries = selectionX < xSpot and xSpot < (selectionX + selectionsWidth)
      withinYBoundaries = selectionY < ySpot and ySpot < (selectionY + selectionsHeight)
      if not (withinXBoundaries and withinYBoundaries)
        areaSelected = false
        canvasDataAsImage = new Image()
        canvasDataAsImage.onload = ->
          ctContext.drawImage(canvasDataAsImage,0,0)
          ctContext.putImageData(selection, selectionX, selectionY)
          canvasAsData = ctCanvas.toDataURL()
        canvasDataAsImage.src = canvasAsData
  () ->
    mousePressed = false
    if not areaSelected
      sortedXs = [ Math.min(xSpot, oldX), Math.max(xSpot, oldX) ]
      sortedYs = [ Math.min(ySpot, oldY), Math.max(ySpot, oldY) ]
      selectionsWidth = Math.abs(xSpot - oldX)
      selectionsHeight = Math.abs(ySpot - oldY)
      selectionX = sortedXs[0]
      selectionY = sortedYs[0]
      if 0 < selectionsWidth and 0 < selectionsHeight
        selection = 
          ctContext.getImageData( sortedXs[0], sortedYs[0], selectionsWidth, selectionsHeight)
        canvasDataAsImage = new Image()
        canvasDataAsImage.onload = ->
          ctContext.drawImage(canvasDataAsImage,0,0)
          squareAction(ctContext, colorSwatches[1], oldX, oldY, xSpot - 1, ySpot - 1, true)
          canvasAsData = ctCanvas.toDataURL()
          ctContext.putImageData(selection, selectionX, selectionY)
          drawSelectBox(ctContext, oldX - 1, oldY - 1, xSpot + 1, ySpot + 1)
        canvasDataAsImage.src = canvasAsData
        areaSelected = true
    else
      selectionX = gripX
      selectionY = gripY
]


samplePosture = [
  () ->
    toolbar1Context.drawImage(toolbar1sImage1,188,3)   
    drawInformationToolbar0()
    drawInformationToolbar1()
  () ->
    mousePressed = true
  () ->
    mousePressed = false
    getMousePositionOnCanvas(event)
    colorSwatches[0] = hexToRGB(getColorValue(ctContext, xSpot, ySpot).substr(1))
    tH.pop()
    tH.push tH[tH.length - 1]
    drawToolbars()
]


fillPosture = [
  () ->
    toolbar1Context.drawImage(toolbar1sImage1,188,3)   
    drawInformationToolbar0()
    drawInformationToolbar1()
  () ->
    mousePressed = true
    getMousePositionOnCanvas(event)
    floodFill(ctCanvas, ctContext, colorSwatches[0], xSpot, ySpot)
  () ->
    mousePressed = false
    canvasAsData = ctCanvas.toDataURL()
]
squarePosture = [
  () ->
    toolbar1Context.drawImage(toolbar1sImage1,188,3)   
    drawInformationToolbar0()
    drawInformationToolbar1()
    if mousePressed
      getMousePositionOnCanvas(event)
      canvasDataAsImage = new Image()
      canvasDataAsImage.onload = ->
        ctContext.drawImage(canvasDataAsImage,0,0)
        squareAction(ctContext, colorSwatches[0], oldX, oldY, xSpot, ySpot)
      canvasDataAsImage.src = canvasAsData
  () ->
    mousePressed = true
    getMousePositionOnCanvas(event)
    oldX = xSpot
    oldY = ySpot
  () ->
    mousePressed = false
    canvasAsData = ctCanvas.toDataURL()
]


circlePosture = [
  () ->
    toolbar1Context.drawImage(toolbar1sImage1,188,3)   
    drawInformationToolbar0()
    drawInformationToolbar1()
    if mousePressed
      getMousePositionOnCanvas(event)
      canvasDataAsImage = new Image()
      canvasDataAsImage.onload = ->
        ctContext.drawImage(canvasDataAsImage,0,0)
        circleAction(ctContext, colorSwatches[0], xSpot, ySpot)
      canvasDataAsImage.src = canvasAsData
  () ->
    mousePressed = true
    getMousePositionOnCanvas(event)
    oldX = xSpot
    oldY = ySpot
  () ->
    mousePressed = false
    canvasAsData = ctCanvas.toDataURL()
]
linePosture = [
  () ->
    toolbar1Context.drawImage(toolbar1sImage1,188,3)   
    drawInformationToolbar0()
    drawInformationToolbar1()
    if mousePressed
      getMousePositionOnCanvas(event)
      canvasDataAsImage = new Image()
      canvasDataAsImage.onload = ->
        ctContext.drawImage(canvasDataAsImage,0,0)
        lineAction(ctContext, colorSwatches[0], oldX, oldY, xSpot, ySpot)
      canvasDataAsImage.src = canvasAsData
  () ->
    mousePressed = true
    getMousePositionOnCanvas(event)
    oldX = xSpot
    oldY = ySpot
  () ->
    mousePressed = false
    canvasAsData = ctCanvas.toDataURL()
]

pointPosture = [
  () ->
    toolbar1Context.drawImage(toolbar1sImage1,188,3)   
    drawInformationToolbar0()
    drawInformationToolbar1()
    if mousePressed
      oldX = xSpot
      oldY = ySpot
      getMousePositionOnCanvas(event)
      pointAction(ctContext, colorSwatches[0], xSpot, ySpot, oldX, oldY)
  () ->
    mousePressed = true
    getMousePositionOnCanvas(event)
    pointAction(ctContext, colorSwatches[0], xSpot, ySpot, xSpot, ySpot)
  () ->
    mousePressed = false
    canvasAsData = ctCanvas.toDataURL()
]
emptyPosture = [
  () ->
    toolbar1Context.drawImage(toolbar1sImage1,188,3)   
    drawInformationToolbar0()
    drawInformationToolbar1()
  () ->
    mousePressed = true
  () ->
    mousePressed = false
]
horizontalColorSwapPosture = [
  () ->
    toolbar1Context.drawImage(toolbar1sImage1,188,3)   
    drawInformationToolbar0()
    drawInformationToolbar1()
  () ->
    mousePressed = true
  () ->
    mousePressed = false
    drawToolbars()
]


verticalColorSwapPosture = [
  () ->
    toolbar1Context.drawImage(toolbar1sImage1,188,3)   
    drawInformationToolbar0()
    drawInformationToolbar1()
  () ->
    mousePressed = true
  () ->
    mousePressed = false
    drawToolbars()
]
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


$(document).ready ()->
  setTimeout( ()->
    setCanvasSizes()
    prepareCanvas()
    placeToolbars()
    tH.push ctPaintTools[7]
    tH.shift()
    tH.push ctPaintTools[7]
    tH.shift()
    drawToolbars()
    positionMenu()
    canvasAsData = ctCanvas.toDataURL()
  , 2000)

  $('body').keydown (event) ->
    event.preventDefault()
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
      if tH[tH.length - 1].mode
        tH[tH.length - 1].mode = false
      else
        tH[tH.length - 1].mode = true
    if event.keyCode == keysToKeyCodes['equals']
      if tH[tH.length - 1].magnitude < tH[tH.length - 1].maxMagnitude
        tH[tH.length - 1].magnitude++
        drawInformationToolbar0()
    if event.keyCode == keysToKeyCodes['minus']
      if tH[tH.length - 1].magnitude > 1
        tH[tH.length - 1].magnitude--
        drawInformationToolbar0()
    if event.keyCode == keysToKeyCodes['shift']
      colorModify = true

  $('body').keyup (event) ->
    event.preventDefault()
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
    tH[tH.length - 1].posture[0]()

  $('#CtPaint').mousedown (event)->
    tH[tH.length - 1].posture[1]()

  $('#CtPaint').mouseup (event)->
    tH[tH.length - 1].posture[2]()
  
  $('#toolbar0').mousedown (event)->
    toolIndex = 0
    while toolIndex < numberOfTools
      if ctPaintTools[toolIndex].clickRegion[0]<event.clientX and event.clientX<(ctPaintTools[toolIndex].clickRegion[0]+buttonWidth)
        if ctPaintTools[toolIndex].clickRegion[1]<event.clientY and event.clientY<(ctPaintTools[toolIndex].clickRegion[1]+buttonHeight)
          if toolIndex < 8 
            tH.push ctPaintTools[toolIndex]
            tH.shift()
          else
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
        else
          colorSwatches[0] = colorPallete[(((toolbar1X - 52 ) // 17) * 2) + ((toolbar1Y - 4) // 16)]
        drawToolbars()

        