hexadecimalProper = [
  '0'
  '1'
  '2'
  '3'
  '4'
  '5'
  '6'
  '7'
  '8'
  '9'
  'a'
  'b'
  'c'
  'd'
  'e'
  'f'
]

arabicNumeralsProper = [
  '0'
  '1'
  '2'
  '3'
  '4'
  '5'
  '6'
  '7'
  '8'
  '9'  
]


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
  cH is short for canvas history. 
###
cH = [
  undefined
  undefined
  undefined
  undefined
  undefined
  undefined
  undefined
  undefined
  undefined
  undefined
]
###
  cF is short for canvas future
###
cF = []

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
numberOfTools = 22
# Refers to whether toolbar0 is in view mode 0 or 1
toolViewMode = 0

mousePressed = false
mouseExit = false
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
selectionActFinish = false

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
  The memory where a selection is stored when it is copied
###
copyMemory = undefined
copyExists = false

###
  A menu being up is an abnormal circumstance. The key
  press events are different depending on whether conditions
  are normal or not.
### 
normalCircumstance = true

fillProceed = true

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

cursorColors = [
  [ 255, 85, 0, 255 ]
  [ 85, 0, 255, 255 ]
  [ 255, 255, 255, 255 ]
  [ 0, 255, 85, 255 ]
  [ 255, 223, 128, 255 ]
  [ 95, 255, 0, 255 ]
  [ 0, 0, 0, 255 ]
  [ 0, 95, 255, 255 ]
  [ 128, 0, 96, 255 ]
  [ 96, 128, 0, 255 ]
  [ 128, 11, 0, 255 ]
]

indexOfCursorColors = 0

colorOfCursorPixel = cursorColors[indexOfCursorColors]

cursorX = undefined
cursorY = undefined

oldCursorX = undefined
oldCursorY = undefined

oldCursorsColor = undefined

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
spotInColorPalette = undefined

###
  The color pallete. Even numbered pallete elements are on the top row,
  odds on the bottom row. That aside the colors ascend from left to right

  The colors were largely ripped out of the youtube video of Tom Sach's
  video 'colors'. Some minor adjustments.
###

topRow = [
  # Default windows light gray / windows command prompt gray
  [192, 192, 192]
  # black
  [0 ,0 ,0]
  # Olive Drab
  [85, 96, 45]
  # Sand / Skin light brown
  [221, 201, 142]
  # McDonalds Yellow
  [243, 211, 27]
  # An instance of Orange in Sach's video 'color'
  [255, 91, 49]
  # McDonalds Red
  [212, 51, 29]
  # Slightly gray-blue pink
  [230, 121, 166]
]

bottomRow = [
  # Default Windows dark gray
  [64, 64, 64]
  # White
  [255, 255, 255]
  # Lighter and grayer Navy Blue
  [50, 54, 128]
  # Klein Blue
  [0, 47, 167]
  # Tiffany Blue
  [10, 186, 181]
  # 'Oriental Avenue' Blue
  # As in, the color of that property from the game monopoly
  # that I believe is gray and not blue, but apparently
  # most people consider to be blue.
  [159, 170, 210]
  # Green I made up 0
  [157, 212, 147]
  # Green I made up 1
  [10, 202, 26]
]

colorPalette = []
colorPaletteIndex = 0
while colorPaletteIndex < 8
  colorPalette.push topRow[colorPaletteIndex]
  colorPalette.push bottomRow[colorPaletteIndex]
  colorPaletteIndex++

  
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

  console.log colorMenuImage.width
  menuContext.canvas.width = 340
  menuContext.canvas.height = 35

  menuContext.drawImage(colorMenuImage, 0, 0)

  colorDataSortingInitialize()
  whatSortOfDataSorting = colorDataSorting

colorDataSortingInitialize = () ->
  menuDatum = rgbToHex(colorPalette[spotInColorPalette]).substr(1)
  spotInMenuDatum = 0
  drawColorMenu()

###
  This function takes strings of key names, and decides what to do with them
###
colorDataSorting = ( inputMaterial ) ->
  if inputMaterial isnt undefined
    keysThatDontAddData = ['backspace', 'left', 'right', 'enter']
    keyAddsData = not (inputMaterial in keysThatDontAddData)
    keyIsAcceptableDataFormat = inputMaterial in hexadecimalProper
    if keyAddsData and keyIsAcceptableDataFormat
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
          colorPalette[spotInColorPalette] = hexToRGB(menuDatum)
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

###
  sameColorCheck returns a boolean given two colors.
  It returns true if the two colors share the same
  values for red, green, and blue (alpha is ignored).
###
sameColorCheck = (colorA, colorB) ->
    redAreSame = colorA[0] == colorB[0]
    greenAreSame = colorA[1] == colorB[1]
    blueAreSame = colorA[2] == colorB[2]
    return  redAreSame and greenAreSame and blueAreSame

    
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
  'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ `.,;:'+"'"+'"?!0123456789@#$%^&*(){}[]='
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
###
dataToGive = [
  [239, 8, 8, 255]
  [239, 8, 8, 255]
  [16, 120, 120, 255]
  [16, 120, 120, 255]
]
###
dataToGive = [
  [64, 64, 239, 255]
  [64, 64, 239, 255]
  [192, 192, 16, 255]
  [192, 192, 16, 255]
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

  # Flood fill will break if its replacing a color with itself
  if not sameColorCheck(colorToChangeTo, colorToReplace)
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

circleAction = ( canvas, color, radiusToPass ) ->
  if not tH[tH.length - 1].mode
    whetherCornerBlocks = false
    if tH[tH.length - 1].magnitude > 1
      whetherCornerBlocks = true
    magnitudeIncrement = 0
    while magnitudeIncrement < tH[tH.length - 1].magnitude
      thisIncrementsRadius = radiusToPass - magnitudeIncrement
      drawCircle( canvas, color, oldX, oldY, thisIncrementsRadius, whetherCornerBlocks )
      magnitudeIncrement++
  else
    magnitudeIncrement = 0
    while magnitudeIncrement < radiusToPass
      drawCircle( canvas, color, oldX, oldY, radiusToPass - magnitudeIncrement, true )
      magnitudeIncrement++


###
  drawline is the basic line drawing function. Its a
  bresenham algorithm.
###
drawLine = (canvas, color, beginX, beginY, endX, endY, boldness) ->
  if boldness is undefined
    boldness = false
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
    if not boldness
      putPixel(canvas, color, beginX, beginY)
    else
      drawCircle( canvas, color, beginX, beginY, boldness, true )
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
  doingBoldness = false
  if tH[tH.length - 1].magnitude > 1
    doingBoldness = tH[tH.length - 1].magnitude - 1
  drawLine(canvas, color, beginX, beginY, endX, endY, doingBoldness)
  ###
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
    calculatedRadius = (tH[tH.length - 1].magnitude) - Math.round(lineSlope * 1.21)
    magnitudeIncrement = 0
    while magnitudeIncrement < calculatedRadius
      drawCircle( canvas, color, beginX, beginY, calculatedRadius - magnitudeIncrement, true )
      drawCircle( canvas, color, endX, endY, calculatedRadius - magnitudeIncrement, true )
      magnitudeIncrement++
  ###


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
  fast enough. This results in distantly spaced specks, as
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
    
    
###
  These are the functions relevant to flipping images, whether that
  image be the canvas itself, or a selection of the canvas. 
###
flipAction = () ->
  menuUp = true
  normalCircumstance = false
  $('#menuDiv').css('top', (window.innerHeight - toolbarHeight - 45).toString())
  $('#menuDiv').css('left', (toolbarWidth + 10).toString())

  menuContext.canvas.width = 204
  menuContext.canvas.height = 35

  tH.push ctPaintTools[toolsToNumbers['flip']]

  menuContext.drawImage(tH[tH.length - 1].menuImage, 0, 0)
  drawToolbars()

  whatSortOfDataSorting = flipDataSorting

###
  flipDataSorting does all the heavy lifting of the flip 
  tool. 

  After listening to the key that was pressed and working with it.
  It goes into one of four distinct sectionf of code: (A) flip
  a selected area horizontally, (B) flip the canvas horizontally
  (C) flip a selected area vertically; and (D) flip the canvas
  vertically

  All the sections basically flow the same way:
    (a) Get the data of the image being manipulated
    (b) Convert it into an array of pixels (instead 
    of an array of color values)
    (c) Rearrange it accordingly
    (d) Turn it back into image data 
    (e) Paste it back onto the canvas, and wrap up the
    whole operation
###
flipDataSorting = ( inputMaterial ) ->
  if inputMaterial isnt undefined
    acceptableKeys = ['x','y']
    if inputMaterial in acceptableKeys
      switch inputMaterial
        when 'x'
          #   ( A )
          if areaSelected
            #   ( a )
            selectionsData = selection.data
            selectionInPixels = []

            #   ( b )
            selectionIndex = 0
            colorOfDatum = []
            while selectionIndex < selectionsData.length
              colorOfDatum.push selectionsData[selectionIndex]
              if selectionIndex % 4 is 3
                selectionInPixels.push colorOfDatum
                colorOfDatum = []
              selectionIndex++

            #   ( c )
            flippedSelection = []
            pixelIndex = 0
            while pixelIndex < selectionInPixels.length
              rowStart = pixelIndex // selectionsWidth
              inRow = pixelIndex %% selectionsWidth
              pixelToFlip = rowStart * selectionsWidth
              pixelToFlip += (selectionsWidth - inRow - 1)
              flippedSelection.push selectionInPixels[pixelToFlip]
              pixelIndex++

            #   ( d )
            pixelIndex = 0
            while pixelIndex < flippedSelection.length
              colorIndex = 0
              while colorIndex < 4
                datumIndex = pixelIndex * 4
                selection.data[datumIndex + colorIndex] = 
                  flippedSelection[pixelIndex][colorIndex]
                colorIndex++
              pixelIndex++

            #   ( e )
            ctContext.putImageData(selection, selectionX, selectionY)
            tH.pop()
            drawToolbars()
            $('#menuDiv').css('top',(window.innerHeight).toString())
            normalCircumstance = true
            menuUp = false

          #   ( B )
          else
            #   ( a )
            tWidth = ctContext.canvas.width
            tHeight = ctContext.canvas.height
            canvasAsWeFoundIt = ctContext.getImageData(0, 0, tWidth, tHeight)
            canvasData = canvasAsWeFoundIt.data
            canvasInPixels = []

            #   ( b )
            canvasIndex = 0
            colorAtDatum = []
            while canvasIndex < canvasData.length
              colorAtDatum.push canvasData[canvasIndex]
              if canvasIndex % 4 is 3
                canvasInPixels.push colorAtDatum
                colorAtDatum = []
              canvasIndex++

            #   ( c )
            flippedCanvas = []
            pixelIndex = 0
            while pixelIndex < canvasInPixels.length
              rowStart = pixelIndex // tWidth
              inRow = pixelIndex %% tWidth
              pixelToFlip = rowStart * tWidth
              pixelToFlip += (tWidth - inRow - 1)
              flippedCanvas.push canvasInPixels[pixelToFlip]
              pixelIndex++

            #  ( d )
            pixelIndex = 0
            while pixelIndex < canvasInPixels.length
              colorIndex = 0
              while colorIndex < 4
                datumIndex = pixelIndex * 4
                canvasAsWeFoundIt.data[datumIndex + colorIndex] = 
                  flippedCanvas[pixelIndex][colorIndex]
                colorIndex++
              pixelIndex++

            #   ( e )
            ctContext.putImageData(canvasAsWeFoundIt, 0, 0)
            cH.push ctCanvas.toDataURL()
            cH.shift()
            cF = []
            tH.pop()
            drawToolbars()
            $('#menuDiv').css('top',(window.innerHeight).toString())
            normalCircumstance = true
            menuUp = false

        when 'y'
          #   ( C )
          if areaSelected
            #   ( a )
            selectionsData = selection.data
            selectionInPixels = []

            #   ( b )
            selectionIndex = 0
            colorOfDatum = []
            while selectionIndex < selectionsData.length
              colorOfDatum.push selectionsData[selectionIndex]
              if selectionIndex % 4 is 3
                selectionInPixels.push colorOfDatum
                colorOfDatum = []
              selectionIndex++

            #   ( c )
            flippedSelection = []
            rowIndex = 0
            while rowIndex < (selectionInPixels.length // selectionsWidth)
              thisRow = (selectionInPixels.length // selectionsWidth) - rowIndex - 1
              rowAt = thisRow * selectionsWidth
              columnIndex = 0
              while columnIndex < selectionsWidth
                flippedSelection.push selectionInPixels[rowAt + columnIndex]
                columnIndex++
              rowIndex++

            #   ( d )
            pixelIndex = 0
            while pixelIndex < flippedSelection.length
              colorIndex = 0
              while colorIndex < 4
                datumIndex = pixelIndex * 4
                selection.data[datumIndex + colorIndex] = 
                  flippedSelection[pixelIndex][colorIndex]
                colorIndex++
              pixelIndex++

            #   ( e )
            ctContext.putImageData(selection, selectionX, selectionY)
            tH.pop()
            drawToolbars()
            $('#menuDiv').css('top',(window.innerHeight).toString())
            normalCircumstance = true
            menuUp = false
          #   ( D )
          else
            #   ( a )
            tWidth = ctContext.canvas.width
            tHeight = ctContext.canvas.height
            canvasAsWeFoundIt = ctContext.getImageData(0, 0, tWidth, tHeight)
            canvasData = canvasAsWeFoundIt.data
            canvasInPixels = []

            #   ( b )
            canvasIndex = 0
            colorAtDatum = []
            while canvasIndex < canvasData.length
              colorAtDatum.push canvasData[canvasIndex]
              if canvasIndex % 4 is 3
                canvasInPixels.push colorAtDatum
                colorAtDatum = []
              canvasIndex++

            #   ( c )
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

            #   ( d )
            pixelIndex = 0
            while pixelIndex < canvasInPixels.length
              colorIndex = 0
              while colorIndex < 4
                datumIndex = pixelIndex * 4
                canvasAsWeFoundIt.data[datumIndex + colorIndex] = 
                  flippedCanvas[pixelIndex][colorIndex]
                colorIndex++
              pixelIndex++

            #   ( e )
            ctContext.putImageData(canvasAsWeFoundIt, 0, 0)
            cH.push ctCanvas.toDataURL()
            cH.shift()
            cF = []
            tH.pop()
            drawToolbars()
            $('#menuDiv').css('top',(window.innerHeight).toString())
            normalCircumstance = true
            menuUp = false


rotateAction = ->
  menuUp = true
  normalCircumstance = false
  $('#menuDiv').css('top', (window.innerHeight - toolbarHeight - 45).toString())
  $('#menuDiv').css('left', (toolbarWidth + 10).toString())

  menuContext.canvas.width = 313
  menuContext.canvas.height = 35

  tH.push ctPaintTools[toolsToNumbers['rotate']]

  menuContext.drawImage(tH[tH.length - 1].menuImage, 0, 0)
  drawToolbars()

  whatSortOfDataSorting = rotateDataSorting

rotateDataSorting = ( inputMaterial) ->
  if inputMaterial isnt undefined
    acceptableKeys = ['9', '1', '2']
    if inputMaterial in acceptableKeys
      if not areaSelected
        sWidth = ctContext.canvas.width
        sHeight = ctContext.canvas.height
        canvasCurrently = ctContext.getImageData(0, 0, sWidth, sHeight)
              
        canvasAsPixels = dataToPixels(canvasCurrently.data)
        switch inputMaterial
          when '9'
            canvasAsPixels = axisFlip(canvasAsPixels, sWidth, sHeight)
            canvasAsPixels = horizontalFlip(canvasAsPixels[0], canvasAsPixels[1], canvasAsPixels[2])
          when '1'
            canvasAsPixels = horizontalFlip(canvasAsPixels, sWidth, sHeight)
            canvasAsPixels = verticalFlip(canvasAsPixels[0], canvasAsPixels[1], canvasAsPixels[2])
          when '2'
            canvasAsPixels = horizontalFlip(canvasAsPixels, sWidth, sHeight)
            canvasAsPixels = axisFlip(canvasAsPixels[0], canvasAsPixels[1], canvasAsPixels[2])

        rotatedData = []
        thisPixelIndex = 0
        while thisPixelIndex < canvasAsPixels[0].length
          colorIndex = 0
          while colorIndex < 4
            rotatedData.push canvasAsPixels[0][thisPixelIndex][colorIndex]
            colorIndex++
          thisPixelIndex++

        rotatedCanvas = document.createElement('canvas')
        rotatedCanvas = rotatedCanvas.getContext('2d')
        rotatedCanvas = rotatedCanvas.createImageData(canvasAsPixels[1], canvasAsPixels[2])

        datumIndex = 0
        while datumIndex < rotatedData.length
          rotatedCanvas.data[datumIndex] = rotatedData[datumIndex]
          datumIndex++

        ctContext.canvas.width = canvasAsPixels[1]
        ctContext.canvas.height = canvasAsPixels[2]
        canvasWidth = ctContext.canvas.width
        canvasHeight = ctContext.canvas.height
        ctCanvas.style.width = (canvasWidth).toString()+'px'
        ctCanvas.style.height = (canvasHeight).toString()+'px'
        ctContext.putImageData(rotatedCanvas, 0, 0)

        cH.push ctCanvas.toDataURL()
        cH.shift()
        cF = []
        tH.pop()
        drawToolbars()
        $('#menuDiv').css('top',(window.innerHeight).toString())
        normalCircumstance = true
        menuUp = false
        positionCorners()

      else
        selectionAsPixels = dataToPixels(selection.data)
        switch inputMaterial
          when '9'
            selectionAsPixels = 
              axisFlip(selectionAsPixels, selectionsWidth, selectionsHeight)
            selectionAsPixels =
              horizontalFlip(selectionAsPixels[0], selectionAsPixels[1], selectionAsPixels[2])
          when '1'
            selectionAsPixels = 
              horizontalFlip(selectionAsPixels, selectionsWidth, selectionsHeight)
            selectionAsPixels = 
              verticalFlip(selectionAsPixels[0], selectionAsPixels[1], selectionAsPixels[2])
          when '2'
            selectionAsPixels = 
              horizontalFlip(selectionAsPixels, selectionsWidth, selectionsHeight)
            selectionAsPixels = 
              axisFlip(selectionAsPixels[0], selectionAsPixels[1], selectionAsPixels[2])

        rotatedData = []
        thisPixelIndex = 0
        while thisPixelIndex < selectionAsPixels[0].length
          colorIndex = 0
          while colorIndex < 4
            rotatedData.push selectionAsPixels[0][thisPixelIndex][colorIndex]
            colorIndex++
          thisPixelIndex++

        rotatedSelection = document.createElement('canvas')
        rotatedSelection = rotatedSelection.getContext('2d')
        rotatedSelection = 
          rotatedSelection.createImageData(selectionAsPixels[1], selectionAsPixels[2])

        datumIndex = 0
        while datumIndex < rotatedData.length
          rotatedSelection.data[datumIndex] = rotatedData[datumIndex]
          datumIndex++

        selection = rotatedSelection

        selectionsWidth = rotatedSelection.width
        selectionsHeight = rotatedSelection.height

        canvasDataAsImage = new Image()
        canvasDataAsImage.onload = ->
          ctContext.drawImage(canvasDataAsImage,0,0)
          cH.push ctCanvas.toDataURL()
          cH.shift()
          cF = []
          ctContext.putImageData(selection, selectionX, selectionY)
          rightEdge = selectionX + selectionsWidth
          bottomEdge = selectionY + selectionsHeight
          drawSelectBox(ctContext, selectionX - 1, selectionY - 1, rightEdge, bottomEdge)
        canvasDataAsImage.src = cH[cH.length - 1]

        tH.pop()
        drawToolbars()
        $('#menuDiv').css('top',(window.innerHeight).toString())
        normalCircumstance = true
        menuUp = false
        positionCorners()

dataToPixels = (imageData) ->
  convertedData = []
  datumIndex = 0
  singlePixel = []
  while datumIndex < imageData.length
    singlePixel.push imageData[datumIndex]
    if datumIndex % 4 is 3
      convertedData.push singlePixel
      singlePixel = []
    datumIndex++
  return convertedData

horizontalFlip = (imageInPixels, itsWidth, itsHeight) ->
  flippedCanvas = []
  pixelIndex = 0
  while pixelIndex < imageInPixels.length
    rowStart = pixelIndex // itsWidth
    inRow = pixelIndex %% itsWidth
    pixelToFlip = rowStart * itsWidth
    pixelToFlip += (itsWidth - inRow - 1)
    flippedCanvas.push imageInPixels[pixelToFlip]
    pixelIndex++
  return [flippedCanvas, itsWidth, itsHeight]

verticalFlip = (imageInPixels, itsWidth, itsHeight) ->
  flippedCanvas = []
  rowIndex = 0
  while rowIndex < (imageInPixels.length // itsWidth)
    thisRow = (imageInPixels.length // itsWidth) - rowIndex - 1
    rowAt = thisRow * itsWidth
    columnIndex = 0
    while columnIndex < itsWidth
      flippedCanvas.push imageInPixels[rowAt + columnIndex]
      columnIndex++
    rowIndex++
  return [flippedCanvas, itsWidth, itsHeight]

axisFlip = (imageInPixels, itsWidth, itsHeight) ->
  flippedCanvas = []
  pixelIndex = 0
  while pixelIndex < imageInPixels.length
    atRow = pixelIndex % itsHeight
    atRow *= itsWidth
    atColumn = pixelIndex // itsHeight
    flippedCanvas.push imageInPixels[atRow + atColumn]
    pixelIndex++
  return [flippedCanvas, itsHeight, itsWidth]


invertAction = () ->
  tH.push ctPaintTools[toolsToNumbers['invert']]
  if not areaSelected
    # Get the canvass data
    tWidth = ctContext.canvas.width
    tHeight = ctContext.canvas.height
    canvasAsWeFoundIt = ctContext.getImageData(0, 0, tWidth, tHeight)
    canvasData = canvasAsWeFoundIt.data
    cH.push canvasAsWeFoundIt.data
    cH.shift()
    cF = []
    canvasInPixels = []

    # Turn it into an array of pixels instead of canvas data
    canvasIndex = 0
    colorAtDatum = []
    while canvasIndex < canvasData.length
      colorAtDatum.push canvasData[canvasIndex]
      if canvasIndex % 4 is 3
        canvasInPixels.push colorAtDatum
        colorAtDatum = []
      canvasIndex++

    # Take each pixel, and invert the color
    pixelIndex = 0
    while pixelIndex < canvasInPixels.length
      red = canvasInPixels[pixelIndex][0]
      green = canvasInPixels[pixelIndex][1]
      blue = canvasInPixels[pixelIndex][2]
      canvasInPixels[pixelIndex] = [ 255 - red, 255 - green, 255 - blue, 255]
      pixelIndex++

    # Turn it back into data
    pixelIndex = 0
    while pixelIndex < canvasInPixels.length
      colorIndex = 0
      while colorIndex < 4
        datumIndex = pixelIndex * 4
        canvasAsWeFoundIt.data[datumIndex + colorIndex] = 
        canvasInPixels[pixelIndex][colorIndex]
        colorIndex++
      pixelIndex++

    # Paste it back onto the canvas
    ctContext.putImageData(canvasAsWeFoundIt, 0, 0)
    cH.push ctCanvas.toDataURL()
    cH.shift()
    cF = []

  else
    selectionData = selection.data
    selectionInPixels = []

    selectionIndex = 0
    colorInDatum = []
    while selectionIndex <  selectionData.length
      colorInDatum.push selectionData[selectionIndex]
      if selectionIndex % 4 is 3
        selectionInPixels.push colorInDatum
        colorInDatum = []
      selectionIndex++

    pixelIndex = 0
    while pixelIndex < selectionInPixels.length
      red = selectionInPixels[pixelIndex][0]
      green = selectionInPixels[pixelIndex][1]
      blue = selectionInPixels[pixelIndex][2]
      selectionInPixels[pixelIndex] = [ 255 - red, 255 - green, 255 - blue, 255]
      pixelIndex++

    pixelIndex = 0
    while pixelIndex < selectionInPixels.length
      colorIndex = 0
      while colorIndex < 4
        datumIndex = pixelIndex * 4
        selection.data[datumIndex + colorIndex] = selectionInPixels[pixelIndex][colorIndex]
        colorIndex++
      pixelIndex++

    ctContext.putImageData(selection, selectionX, selectionY)

  setTimeout( ()->
    tH.pop()
    drawToolbars()
  ,20)

  
###
  Replace will replace a given color with another within.
###
replaceAction = () ->
  menuUp = true
  normalCircumstance = false
  $('#menuDiv').css('top', (window.innerHeight - toolbarHeight - 45).toString())
  $('#menuDiv').css('left', (toolbarWidth + 10).toString())

  menuContext.canvas.width = 524
  menuContext.canvas.height = 35

  tH.push ctPaintTools[toolsToNumbers['replace']]

  menuContext.drawImage(tH[tH.length - 1].menuImage, 0, 0)
  drawToolbars()

  replaceDataSortingInitialize()
  whatSortOfDataSorting = replaceDataSorting

replaceDataSortingInitialize = () ->
  menuDatum = rgbToHex(colorSwatches[0]).substr(1,6) + rgbToHex(colorSwatches[1]).substr(1,6)
  spotInMenuDatum = 0
  drawReplaceMenu()

replaceDataSorting = ( inputMaterial ) ->
  if inputMaterial isnt undefined
    keysThatDontAddData = ['backspace', 'left', 'right', 'enter']
    if not (inputMaterial in keysThatDontAddData)
      menuDatum = replaceAt(menuDatum, inputMaterial, spotInMenuDatum )
      if spotInMenuDatum < 11
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
          if spotInMenuDatum < 11
            spotInMenuDatum++
        when 'enter'
          if not areaSelected
            colorToReplace = hexToRGB(menuDatum.substr(0,6))
            replacement = hexToRGB(menuDatum.substr(6,6))
            replacement.push 255

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
                if sameColorCheck(colorAtDatum, colorToReplace)
                  canvasInPixels.push replacement
                else
                  canvasInPixels.push colorAtDatum
                colorAtDatum = []
              canvasIndex++

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
            cH.push ctCanvas.toDataURL()
            cH.shift()
            cF = []

            $('#menuDiv').css('top',(window.innerHeight).toString())
            normalCircumstance = true
            menuUp = false
            tH.pop()
            drawToolbars()
          else
            colorToReplace = hexToRGB(menuDatum.substr(0,6))
            replacement = hexToRGB(menuDatum.substr(6,6))
            replacement.push 255

            selectionData = selection.data
            selectionInPixels = []

            selectionIndex = 0
            colorAtDatum = []
            while selectionIndex < selectionData.length
              colorAtDatum.push selectionData[selectionIndex]
              if selectionIndex % 4 is 3
                if sameColorCheck(colorAtDatum, colorToReplace)
                  selectionInPixels.push replacement
                else
                  selectionInPixels.push colorAtDatum
                colorAtDatum = []
              selectionIndex++

            pixelIndex = 0
            while pixelIndex < selectionInPixels.length
              colorIndex = 0
              while colorIndex < 4
                datumIndex = pixelIndex * 4
                selection.data[datumIndex + colorIndex] = 
                  selectionInPixels[pixelIndex][colorIndex]
                colorIndex++
              pixelIndex++

            canvasDataAsImage = new Image()
            canvasDataAsImage.onload = ->
              ctContext.drawImage(canvasDataAsImage,0,0)
              cH.push ctCanvas.toDataURL()
              cH.shift()
              cF = []
              ctContext.putImageData(selection, selectionX, selectionY)
              rightEdge = selectionX + selectionsWidth
              bottomEdge = selectionY + selectionsHeight
              drawSelectBox(ctContext, selectionX - 1, selectionY - 1, rightEdge, bottomEdge)
            canvasDataAsImage.src = cH[cH.length - 1]

            $('#menuDiv').css('top',(window.innerHeight).toString())
            normalCircumstance = true
            menuUp = false
            tH.pop()
            drawToolbars()
    drawReplaceMenu()

drawReplaceMenu = () ->
  drawStringAsCommandPrompt( menuContext, menuDatum.substr(0,6).toUpperCase(), 1, 116, 10 )
  drawStringAsCommandPrompt( menuContext, menuDatum.substr(6,6).toUpperCase(), 1, 276, 10 )
  xPos = 116 + ((spotInMenuDatum // 6) * 160) + ( 12 * ( spotInMenuDatum %% 6 ) )
  drawStringAsCommandPrompt( menuContext, menuDatum[spotInMenuDatum].toUpperCase(), 2, xPos, 10 )


###
  These are the functions relevant to flipping images, whether that
  image be the canvas itself, or a selection of the canvas. 
###
scaleAction = () ->
  menuUp = true
  normalCircumstance = false
  $('#menuDiv').css('top', (window.innerHeight - toolbarHeight - 45).toString())
  $('#menuDiv').css('left', (toolbarWidth + 10).toString())

  menuContext.canvas.width = 416
  menuContext.canvas.height = 35

  tH.push ctPaintTools[toolsToNumbers['scale']]

  menuContext.drawImage(tH[tH.length - 1].menuImage, 0, 0)
  drawToolbars()

  scaleDataSortingInitialize()
  whatSortOfDataSorting = scaleDataSorting

scaleDataSortingInitialize = () ->
  menuDatum = zeroPadder(100, 3) + zeroPadder(100, 3)
  spotInMenuDatum = 0
  drawScaleMenu()

scaleDataSorting = ( inputMaterial ) ->
  if inputMaterial isnt undefined
    keysThatDontAddData = ['backspace', 'left', 'right', 'enter']
    if inputMaterial in acceptableKeys
      switch inputMaterial
        when 'x'
          console.log 'A'


drawScaleMenu = () ->
  drawStringAsCommandPrompt( menuContext, menuDatum.substr(0,4), 1, 116, 10 )
  drawStringAsCommandPrompt( menuContext, menuDatum.substr(4,4), 1, 228, 10 )
  xPos = 116 + ((spotInMenuDatum // 4) * 112) + ( 12 * ( spotInMenuDatum %% 4 ) )
  drawStringAsCommandPrompt( menuContext, menuDatum[spotInMenuDatum], 2, xPos, 10 )

resizeAction = () ->
  menuUp = true
  normalCircumstance = false
  $('#menuDiv').css('top', (window.innerHeight - toolbarHeight - 45).toString())
  $('#menuDiv').css('left', (toolbarWidth + 10).toString())

  menuContext.canvas.width = 475
  menuContext.canvas.height = 35

  tH.push ctPaintTools[toolsToNumbers['resize']]
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
            cH.push ctCanvas.toDataURL()
            cH.shift()
            cF = []
          canvasDataAsImage.src = cH[cH.length - 1]
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
  tH.push ctPaintTools[toolsToNumbers['horizontalSwap']]
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
  tH.push ctPaintTools[toolsToNumbers['verticalSwap']]
  drawToolbars()

  rearrangedSwatches = [ colorSwatches[2], colorSwatches[3], colorSwatches[0], colorSwatches[1] ]
  colorSwatches = rearrangedSwatches

  setTimeout( ()->
    tH.pop()
    drawToolbars()
  ,20)


###
  copy either saves the selections data, or if there is no selection the whole canvas,
  into what people normally understand as the clipboard.

  The time out at the end, is to ensure that for at least some duration the copy icon
  is lit up.
###
copyAction = ->
  tH.push ctPaintTools[toolsToNumbers['copy']]
  drawToolbars()

  if areaSelected
    copyMemory = selection
  else
    tCanvasWidth = ctContext.canvas.width
    tCanvasHeight = ctContext.canvas.height
    copyMemory = ctContext.getImageData(0, 0, tCanvasWidth, tCanvasHeight)
  copyExists = true

  setTimeout( ()->
    tH.pop()
    drawToolbars()
  ,20)


pasteAction = ->
  tH.push ctPaintTools[toolsToNumbers['paste']]
  drawToolbars()
  
  # Only paste if there is something in the clipboard
  if copyExists
    # If area is selected, we need to ditch the selection
    # Before pasting (A)
    if areaSelected
      areaSelected = false
      canvasDataAsImage = new Image()
      canvasDataAsImage.onload = ->
        ctContext.drawImage(canvasDataAsImage, 0, 0)
        ctContext.putImageData(selection, selectionX, selectionY)
        cH.push ctCanvas.toDataURL()
        cH.shift()
        cF = []
        # (A)
        pasteTheSelection()
      canvasDataAsImage.src = cH[cH.length - 1]
    else
      # (A)
      pasteTheSelection()

  # Put a little delay so the user has a visual impression
  # that the tool was used
  setTimeout( ()->
    tH.pop()
    drawToolbars()
    tH.push ctPaintTools[toolsToNumbers['select']]
    tH.shift()
  ,20)

pasteTheSelection = ->
  # Set the selection to what was in the clipboard
  selection = copyMemory
  selectionX = 0
  selectionY = 0
  selectionsWidth = selection.width
  selectionsHeight = selection.height
  canvasDataAsImage = new Image()
  canvasDataAsImage.onload = ->
    # Draw the canvas as we know it to be
    ctContext.drawImage(canvasDataAsImage,0,0)
    # Then draw the selection
    ctContext.putImageData(selection, selectionX, selectionY)
    # Then draw that little box around the selection
    drawSelectBox(ctContext, -1, -1, selectionsWidth + 1, selectionsHeight + 1)
    # Note that none of this is saved, its merely drawn.
    # These drawings are not incorporated into the data
    # of the canvas.
    # It gets incorporated upon 'exit' from selection.
  canvasDataAsImage.src = cH[cH.length - 1]
  areaSelected = true

  
###
  If there is a region selects, saves the data into the clip board,
  then draws a square filled with the secondary color (colorSwatches[1])
  and terminates the selection. 

  Cut does exactly what a normal computer user would expect.
###
cutAction = ->
  tH.push ctPaintTools[toolsToNumbers['cut']]
  drawToolbars()

  if areaSelected
    copyMemory = selection
    copeWithSelection()
    tRightEdge = selectionX + selectionsWidth
    tBottomEdge = selectionY + selectionsHeight
    areaSelected = false
    canvasDataAsImage = new Image()
    canvasDataAsImage.onload = ->
      ctContext.drawImage(canvasDataAsImage, 0, 0)
      sX = selectionX
      sY = selectionY
      squareAction(ctContext, colorSwatches[1], sX, sY, tRightEdge, tBottomEdge, true)
      cH.push ctCanvas.toDataURL()
      cH.shift()
      cF = []
    canvasDataAsImage.src = cH[cH.length - 1]
  else
    tCanvasWidth = ctContext.canvas.width
    tCanvasHeight = ctContext.canvas.height
    copyMemory = ctContext.getImageData(0, 0, tCanvasWidth, tCanvasHeight)
    squareAction(ctContext, colorSwatches[1], 0, 0, tCanvasWidth, tCanvasHeight, true)
    cH.push ctCanvas.toDataURL()
    cH.shift()
    cF = []
  copyExists = true

  setTimeout( ()->
    tH.pop()
    drawToolbars()
  ,20)

  
cursorColorAction = ->
  tH.push ctPaintTools[toolsToNumbers['cursorColor']]
  drawToolbars()

  indexOfCursorColors++
  indexOfCursorColors = indexOfCursorColors % cursorColors.length
  colorOfCursorPixel = cursorColors[indexOfCursorColors]
  refreshCursor()

  setTimeout( ()->
    tH.pop()
    drawToolbars()
  ,20)

  
undoAction = ->
  tH.push ctPaintTools[toolsToNumbers['undo']]
  drawToolbars()

  cF.push cH.pop()
  cH.unshift(cH[0])
  canvasDataAsImage = new Image()
  canvasDataAsImage.onload = ->
    undoAndRedoSizeComparison(canvasDataAsImage)
    ctContext.drawImage(canvasDataAsImage,0,0)
  canvasDataAsImage.src = cH[cH.length - 1]

  setTimeout( ()->
    tH.pop()
    drawToolbars()
  ,20)

undoAndRedoSizeComparison = (pastCanvas) ->
  widthIsntSame = pastCanvas.width isnt canvasWidth
  heightIsntSame = pastCanvas.height isnt canvasHeight
  if widthIsntSame or heightIsntSame
    newWidth = pastCanvas.width
    newHeight = pastCanvas.height
    ctContext.canvas.width = parseInt(newWidth)
    ctContext.canvas.height = parseInt(newHeight)
    canvasWidth = ctContext.canvas.width
    canvasHeight = ctContext.canvas.height
    ctCanvas.style.width = (canvasWidth).toString()+'px'
    ctCanvas.style.height = (canvasHeight).toString()+'px'
    positionCorners()

    
redoAction = ->
  # Update the tool history and draw the toolbars to reflect
  # What tool is in use.
  tH.push ctPaintTools[toolsToNumbers['redo']]
  drawToolbars()

  # If there is actually a canvas in the 'future canvas'
  # queue, replace our current canvas with it.
  if cF.length > 0
    cH.push cF.pop()
    canvasDataAsImage = new Image()
    canvasDataAsImage.onload = ->
      # Figure out what to do if the replacing canvas
      # Isnt the same size as our current canvas
      undoAndRedoSizeComparison(canvasDataAsImage)
      ctContext.drawImage(canvasDataAsImage,0,0)
    canvasDataAsImage.src = cH[cH.length - 1]

  # Go back to the previous tool, but put a little delay on it
  # So the user gets the visual impresssion that the redo
  # Actually occured.
  setTimeout( ()->
    tH.pop()
    drawToolbars()
  ,20)

  
###
  PositionCorners figures out where to put the little corner divs at the edges
  of the canvas. Three of the four corners are just for appearance. Clicking
  on the lower right one will actually resize the canvas.

  Currently I am debating whether its worth having these at all.
  They act more like needless decoration than actual visual ques.

  Would a use not actually know they can resize without them?
  After all, arent modern computer users familiar with clicking 
  dragging? Dont they have a sense of that capacity?
###
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

###
  Figure out where to put the canvas
###
positionCanvas = ->
  $('#ctpaintDiv').css('top', (canvasYPos+canvasYOffset).toString())
  $('#ctpaintDiv').css('left',(canvasXPos+canvasXOffset).toString())

###
  Only done at the very initialization of CtPaint.
###
prepareCanvas = ->
  ctContext.canvas.width = canvasWidth
  ctContext.canvas.height = canvasHeight

  ctContext.fillStyle = '#000000'
  ctContext.fillRect(0,0,canvasWidth,canvasHeight)

  positionCanvas()
  positionCorners()

###
  Position the menu div. The menu is un-(de?)-initialized
  by just putting the menu off screen and switching tools
  (ending the menus functionality)
###
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
  toolbar0Context.fillRect(0, 0, toolbarWidth, window.innerHeight - toolbarHeight)
  toolbar0Context.drawImage(toolbar0sImages[toolViewMode], 0, 0)
  almostWindowHeight =  window.innerHeight - toolbarHeight
  drawLine(toolbar0Context, [16, 20, 8], toolbarWidth - 1, 0, toolbarWidth - 1, almostWindowHeight)
  toolbar0Context.drawImage(
    tH[tH.length - 1].pressedImage[toolViewMode]
    tH[tH.length - 1].clickRegion[0],
    tH[tH.length - 1].clickRegion[1])

  ###
    The following code looks at the condition of the state-sensitive tool icons (fancy and 
    solid-capable tools). The relevant tools are square, circle, line, and point.

    Each section, for square, circle, line and point, is identical. So I have therefore
    only commented the square section. The comments should be equally explainatory for the 
    other tools.
  ###

  # Only if the view mode is pictoral, and...
  if toolViewMode is 0
    # If the current tool is the square tool
    if tH[tH.length - 1].name is 'square'
      # and its not in fill mode
      if not tH[tH.length - 1].mode
        # draw the icon reflecting its current magnitude and selection state
        theImage = fancyResponsiveIcons['square'][1][tH[tH.length - 1].magnitude - 1]
        iconX = tH[tH.length - 1].clickRegion[0]
        iconY = tH[tH.length - 1].clickRegion[1]
        toolbar0Context.drawImage( theImage, iconX, iconY)
      # and it is in fill mode
      else
        # draw the icon reflecting that its filled and selected
        theImage = solidIcons['square'][1]
        iconX = tH[tH.length - 1].clickRegion[0]
        iconY = tH[tH.length - 1].clickRegion[1]
        toolbar0Context.drawImage( theImage, iconX, iconY)
    # If the current tool is not square  
    else
      # and sqaure isnt in fill mode
      if not ctPaintTools[toolsToNumbers['square']].mode
        # but square's mangitude is still greater than one
        if ctPaintTools[toolsToNumbers['square']].magnitude > 1
          # draw its unselected icon in that magnitude
          theImage = 
            fancyResponsiveIcons['square'][0][ctPaintTools[toolsToNumbers['square']].magnitude - 1]
          iconX = ctPaintTools[toolsToNumbers['square']].clickRegion[0]
          iconY = ctPaintTools[toolsToNumbers['square']].clickRegion[1]
          toolbar0Context.drawImage( theImage, iconX, iconY)
      # and square is in fill mode
      else
        theImage = solidIcons['square'][0]
        iconX = ctPaintTools[toolsToNumbers['square']].clickRegion[0]
        iconY = ctPaintTools[toolsToNumbers['square']].clickRegion[1]
        toolbar0Context.drawImage( theImage, iconX, iconY)

    # If the current tool is the circle tool ...
    if tH[tH.length - 1].name is 'circle'
      if not tH[tH.length - 1].mode
        theImage = fancyResponsiveIcons['circle'][1][tH[tH.length - 1].magnitude - 1]
        iconX = tH[tH.length - 1].clickRegion[0]
        iconY = tH[tH.length - 1].clickRegion[1]
        toolbar0Context.drawImage( theImage, iconX, iconY )
      else
        theImage = solidIcons['circle'][1]
        iconX = tH[tH.length - 1].clickRegion[0]
        iconY = tH[tH.length - 1].clickRegion[1]
        toolbar0Context.drawImage( theImage, iconX, iconY)
    else
      if not ctPaintTools[toolsToNumbers['circle']].mode
        if ctPaintTools[toolsToNumbers['circle']].magnitude > 1
          theImage = 
            fancyResponsiveIcons['circle'][0][ctPaintTools[toolsToNumbers['circle']].magnitude - 1]
          iconX = ctPaintTools[toolsToNumbers['circle']].clickRegion[0]
          iconY = ctPaintTools[toolsToNumbers['circle']].clickRegion[1]
          toolbar0Context.drawImage( theImage, iconX, iconY)
      else
        theImage = solidIcons['circle'][0]
        iconX = ctPaintTools[toolsToNumbers['circle']].clickRegion[0]
        iconY = ctPaintTools[toolsToNumbers['circle']].clickRegion[1]
        toolbar0Context.drawImage( theImage, iconX, iconY)

    if tH[tH.length - 1].name is 'zoom'
      theImage = fancyResponsiveIcons['zoom'][1][tH[tH.length - 1].magnitude - 1]
      iconX = tH[tH.length - 1].clickRegion[0]
      iconY = tH[tH.length - 1].clickRegion[1]
      toolbar0Context.drawImage( theImage, iconX, iconY )
    else
      if ctPaintTools[toolsToNumbers['zoom']].magnitude > 1
        theImage = 
          fancyResponsiveIcons['zoom'][0][ctPaintTools[toolsToNumbers['zoom']].magnitude - 1]
        iconX = ctPaintTools[toolsToNumbers['zoom']].clickRegion[0]
        iconY = ctPaintTools[toolsToNumbers['zoom']].clickRegion[1]
        toolbar0Context.drawImage( theImage, iconX, iconY)

    if tH[tH.length - 1].name is 'line'
      theImage = fancyResponsiveIcons['line'][1][tH[tH.length - 1].magnitude - 1]
      iconX = tH[tH.length - 1].clickRegion[0]
      iconY = tH[tH.length - 1].clickRegion[1]
      toolbar0Context.drawImage( theImage, iconX, iconY )
    else
      if ctPaintTools[toolsToNumbers['line']].magnitude > 1
        theImage = 
          fancyResponsiveIcons['line'][0][ctPaintTools[toolsToNumbers['line']].magnitude - 1]
        iconX = ctPaintTools[toolsToNumbers['line']].clickRegion[0]
        iconY = ctPaintTools[toolsToNumbers['line']].clickRegion[1]
        toolbar0Context.drawImage( theImage, iconX, iconY)

    if tH[tH.length - 1].name is 'point'
      theImage = fancyResponsiveIcons['point'][1][tH[tH.length - 1].magnitude - 1]
      iconX = tH[tH.length - 1].clickRegion[0]
      iconY = tH[tH.length - 1].clickRegion[1]
      toolbar0Context.drawImage( theImage, iconX, iconY )
    else
      if ctPaintTools[toolsToNumbers['point']].magnitude > 1
        theImage = 
          fancyResponsiveIcons['point'][0][ctPaintTools[toolsToNumbers['point']].magnitude - 1]
        iconX = ctPaintTools[toolsToNumbers['point']].clickRegion[0]
        iconY = ctPaintTools[toolsToNumbers['point']].clickRegion[1]
        toolbar0Context.drawImage( theImage, iconX, iconY)


  toolbar1Context.fillStyle = '#202020'
  toolbar1Context.fillRect(0,0,window.innerWidth,toolbarHeight)

  toolbar1Context.drawImage(toolbar1sImage0, 3, 2)
  drawLine(toolbar1Context, [16, 20, 8], toolbarWidth - 1, 0, window.innerWidth, 0)
  toolbar1Context.drawImage(toolbar1sImage1, 188, 3)
  toolbar1Context.drawImage(toolbar1sImage1, 458, 3)
  drawLine(toolbar1Context, [16, 20, 8], toolbarWidth - 1, 0, window.innerWidth, 0)

  toolbar1Context.fillStyle = rgbToHex(colorSwatches[0])
  toolbar1Context.fillRect(7, 4, 14, 14)

  toolbar1Context.fillStyle = rgbToHex(colorSwatches[1])
  toolbar1Context.fillRect(24, 4, 14, 14)

  toolbar1Context.fillStyle = rgbToHex(colorSwatches[2])
  toolbar1Context.fillRect(16, 21, 14, 14)

  toolbar1Context.fillStyle = rgbToHex(colorSwatches[3])
  toolbar1Context.fillRect(33, 21, 14, 14)

  paletteIndex = 0
  while paletteIndex < colorPalette.length
    toolbar1Context.fillStyle = rgbToHex(colorPalette[paletteIndex])
    toolbar1Context.fillRect(52 + (17 * (paletteIndex // 2)), 4 + (17 * (paletteIndex % 2)), 14, 14)
    paletteIndex++

  drawInformationToolbar0()

updateCursor = ->
  coverUpOldCursor()
  cursorX = event.clientX - (toolbarWidth + 5 - canvasXOffset)
  cursorY = event.clientY - 5 - canvasYOffset
  updateOldCursor()
  oldCursorX = cursorX
  oldCursorY = cursorY
  putPixel( ctContext, colorOfCursorPixel, cursorX, cursorY)

coverUpOldCursor = ->
  if oldCursorsColor isnt undefined
    putPixel( ctContext, oldCursorsColor.data, oldCursorX, oldCursorY )

updateOldCursor = ->
  oldCursorsColor = ctContext.getImageData(cursorX, cursorY, 1, 1)

refreshCursor = ( particularColor ) ->
  if particularColor isnt undefined
    putPixel( ctContext, particularColor, cursorX, cursorY )
  else
    putPixel( ctContext, colorOfCursorPixel, cursorX, cursorY )

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

drawInformation = ( extraInformation ) ->
  toolbar1Context.drawImage(toolbar1sImage1,188,3)   
  drawInformationToolbar0()
  drawInformationToolbar1( extraInformation )

drawInformationToolbar1 = ( extraInformation ) ->
  if extraInformation is undefined
    extraInformation = ''
  toolbar1Context.drawImage(toolbar1sImage1, 188, 3)   
  toolbar1Context.drawImage(toolbar1sImage1, 458, 3)   
  xPos = event.clientX - (toolbarWidth + 5) - canvasXOffset
  yPos = event.clientY - 5 - canvasYOffset
  colorValue = getColorValue(ctContext, xPos, yPos).toUpperCase()
  coordinates = ', (' + xPos.toString() + ', ' + yPos.toString() + ')'
  colorAndCoordinates = colorValue + coordinates
  drawStringAsCommandPrompt(toolbar1Context, colorAndCoordinates, 0, 191, 12)
  drawStringAsCommandPrompt(toolbar1Context, extraInformation, 0, 461, 12)

drawInformationToolbar0 = ->
  #toolbarInformation = magnitudeToGlyph() + modeToGlyph()
  #drawStringAsCommandPrompt(toolbar0Context, toolbarInformation, 0, 6, 104)

getMousePositionOnCanvas = (event) ->
  xSpot = event.clientX - (toolbarWidth + 5) - canvasXOffset
  ySpot = event.clientY - 5 - canvasYOffset

getMousePositionOnZoom = (event) ->
  xSpotZoom = event.clientX - (toolbarWidth)
  ySpotZoom = event.clientY - (toolbarHeight)

scaleCanvasBigger = ( factor ) ->
  ctCanvas.style.width = (factor * ctCanvas.width).toString()+'px'
  ctCanvas.style.height = (factor * ctCanvas.height).toString()+'px'

historyUpdate = ->
  coverUpOldCursor()
  cH.push ctCanvas.toDataURL()
  cH.shift()
  cF = []
  updateCursor()

copeWithSelection = (atZeroZero)->
  copeX = selectionX
  copeY = selectionY
  if atZeroZero is undefined
    atZeroZero = false
  if areaSelected
    areaSelected = false
    canvasDataAsImage = new Image()
    canvasDataAsImage.onload = ->
      ctContext.drawImage(canvasDataAsImage, 0, 0)
      ctContext.putImageData(selection, copeX, copeY)
      cH.push ctCanvas.toDataURL()
      cH.shift()
      cF = []
    canvasDataAsImage.src = cH[cH.length - 1]


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
  if event.keyCode is keysToKeyCodes['w']
    scaleAction()
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


zoomPosture = [
  () ->
    updateCursor()
    drawInformation()
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
  () ->
]


selectPosture = [
  # Mouse Move
  () ->
    if not areaSelected
      if mousePressed
        getMousePositionOnCanvas(event)
        sortedXs = [ Math.min(xSpot, oldX), Math.max(xSpot, oldX) ]
        sortedYs = [ Math.min(ySpot, oldY), Math.max(ySpot, oldY) ]

        boxInformation = (Math.abs(xSpot - oldX) + 1).toString() 
        boxInformation += 'px x '
        boxInformation += (Math.abs(ySpot - oldY) + 1).toString()
        boxInformation += 'px'
        drawInformation( boxInformation )

        originX = sortedXs[0] - 1
        originY = sortedYs[0] - 1
        otherSideX = sortedXs[1] + 1
        otherSideY = sortedYs[1] + 1
        canvasDataAsImage = new Image()
        canvasDataAsImage.onload = ->
          ctContext.drawImage(canvasDataAsImage,0,0)
          drawSelectBox(ctContext, originX, originY, otherSideX, otherSideY)
        canvasDataAsImage.src = cH[cH.length - 1]
      else
        updateCursor()
    else
      if mousePressed
        getMousePositionOnCanvas(event)
        xOffset = xSpot - oldX
        yOffset = ySpot - oldY
        gripX = selectionX + xOffset
        gripY = selectionY + yOffset
        rightEdge = gripX + selectionsWidth
        bottomEdge = gripY + selectionsHeight

        boxInformation = selectionX.toString() 
        boxInformation += 'px x '
        boxInformation += selectionY.toString()
        boxInformation += 'px'
        drawInformation( boxInformation )

        canvasDataAsImage = new Image()
        canvasDataAsImage.onload = ->
          ctContext.drawImage(canvasDataAsImage,0,0)
          console.log event
          historyUpdate()
          ctContext.putImageData(selection, gripX, gripY)
          drawSelectBox(ctContext, gripX - 1, gripY - 1, rightEdge, bottomEdge)
        canvasDataAsImage.src = cH[cH.length - 1]
      else
        updateCursor()

  # Mouse down
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
          console.log event
          historyUpdate()
        canvasDataAsImage.src = cH[cH.length - 1]

  # Mouse up
  () ->
    mousePressed = false
    if not areaSelected
      sortedXs = [ Math.min(xSpot, oldX), Math.max(xSpot, oldX) ]
      sortedYs = [ Math.min(ySpot, oldY), Math.max(ySpot, oldY) ]
      selectionsWidth = Math.abs(xSpot - oldX)
      selectionsHeight = Math.abs(ySpot - oldY)
      selectionX = sortedXs[0]
      selectionY = sortedYs[0]
      originX = selectionX - 1
      originY = selectionY - 1
      otherSideX = selectionX + selectionsWidth + 1
      otherSideY = selectionY + selectionsHeight + 1
      if 0 < selectionsWidth and 0 < selectionsHeight
        selection = 
          ctContext.getImageData( sortedXs[0], sortedYs[0], selectionsWidth, selectionsHeight)
        canvasDataAsImage = new Image()
        canvasDataAsImage.onload = ->
          ctContext.drawImage(canvasDataAsImage,0,0)
          squareAction(ctContext, colorSwatches[1], oldX, oldY, xSpot - 1, ySpot - 1, true)
          console.log event
          historyUpdate()
          ctContext.putImageData(selection, selectionX, selectionY)
          drawSelectBox(ctContext, originX, originY, otherSideX, otherSideY)
        canvasDataAsImage.src = cH[cH.length - 1]
        areaSelected = true
    else
      selectionX = gripX
      selectionY = gripY
  () ->
]


samplePosture = [
  () ->
    updateCursor()
    drawInformation()
  () ->
    mousePressed = true
  () ->
    mousePressed = false
    getMousePositionOnCanvas(event)
    colorSwatches[0] = hexToRGB(getColorValue(ctContext, xSpot, ySpot).substr(1))
    tH.pop()
    tH.push tH[tH.length - 1]
    drawToolbars()
  () ->
]


fillPosture = [
  () ->
    updateCursor()
    drawInformation()
  () ->
    mousePressed = true
    getMousePositionOnCanvas(event)
    coverUpOldCursor()
    floodFill(ctCanvas, ctContext, colorSwatches[0], xSpot, ySpot)
    updateOldCursor()
  () ->
    mousePressed = false
    historyUpdate()
  () ->
]


squarePosture = [
  () ->
    if mousePressed
      getMousePositionOnCanvas(event)

      boxInformation = (Math.abs(xSpot - oldX) + 1).toString() 
      boxInformation += 'px x '
      boxInformation += (Math.abs(ySpot - oldY) + 1).toString()
      boxInformation += 'px'
      drawInformation( boxInformation )

      canvasDataAsImage = new Image()
      canvasDataAsImage.onload = ->
        ctContext.drawImage(canvasDataAsImage,0,0)
        squareAction(ctContext, colorSwatches[0], oldX, oldY, xSpot, ySpot)
      canvasDataAsImage.src = cH[cH.length - 1]
    else
      drawInformation()
      updateCursor()
  () ->
    mousePressed = true
    getMousePositionOnCanvas(event)
    oldX = xSpot
    oldY = ySpot
  () ->
    mousePressed = false
    updateOldCursor()
    historyUpdate()
  () ->
]


circlePosture = [
  () ->
    if mousePressed
      calculatedRadius = Math.pow(Math.pow(xSpot - oldX, 2) + Math.pow(ySpot - oldY, 2), 0.5)
      calculatedRadius = Math.round(calculatedRadius)
      circleInformation = 'radius = ' + (calculatedRadius + 2).toString()
      drawInformation( circleInformation )
      getMousePositionOnCanvas(event)
      canvasDataAsImage = new Image()
      canvasDataAsImage.onload = ->
        ctContext.drawImage(canvasDataAsImage, 0, 0)
        circleAction(ctContext, colorSwatches[0], calculatedRadius)
      canvasDataAsImage.src = cH[cH.length - 1]
    else
      updateCursor()
      drawInformation()
  () ->
    mousePressed = true
    getMousePositionOnCanvas(event)
    oldX = xSpot
    oldY = ySpot
  () ->
    updateOldCursor()
    mousePressed = false
    historyUpdate()
  () ->
]


linePosture = [
  () ->
    if mousePressed
      getMousePositionOnCanvas(event)
      widthToShow = (Math.abs(oldX - xSpot) + 1).toString()
      heightToShow = (Math.abs(oldY - ySpot) + 1).toString()
      lineInformation = widthToShow + 'px x ' + heightToShow + 'px'
      drawInformation( lineInformation )
      canvasDataAsImage = new Image()
      canvasDataAsImage.onload = ->
        ctContext.drawImage(canvasDataAsImage,0,0)
        lineAction(ctContext, colorSwatches[0], oldX, oldY, xSpot, ySpot)
      canvasDataAsImage.src = cH[cH.length - 1]
    else
      updateCursor()
      drawInformation()
  () ->
    mousePressed = true
    getMousePositionOnCanvas(event)
    oldX = xSpot
    oldY = ySpot
  () ->
    mousePressed = false
    updateOldCursor()
    historyUpdate()
  () ->
]


pointPosture = [
  () ->
    drawInformation()
    if mousePressed
      oldX = xSpot
      oldY = ySpot
      getMousePositionOnCanvas(event)
      pointAction(ctContext, colorSwatches[0], xSpot, ySpot, oldX, oldY)
    else
      updateCursor()
  () ->
    if not mousePressed
      getMousePositionOnCanvas(event)
      pointAction(ctContext, colorSwatches[0], xSpot, ySpot, xSpot, ySpot)
    mousePressed = true
  () ->
    if mousePressed
      updateOldCursor()
      historyUpdate()
    mousePressed = false
  () ->
    if mousePressed
      oldX = xSpot
      oldY = ySpot
      getMousePositionOnCanvas(event)
      pointAction(ctContext, colorSwatches[0], xSpot, ySpot, oldX, oldY)
      historyUpdate()
      mousePressed = false
]


emptyPosture = [
  () ->
    drawInformation()
  () ->
    mousePressed = true
  () ->
    mousePressed = false
  () ->
]


horizontalColorSwapPosture = [
  () ->
    drawInformation()
  () ->
    mousePressed = true
  () ->
    mousePressed = false
    drawToolbars()
  () ->
]


verticalColorSwapPosture = [
  () ->
    drawInformation()
  () ->
    mousePressed = true
  () ->
    mousePressed = false
    drawToolbars()
  () ->
]


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
  'cut', 'cursorColor'
  'undo', 'redo'
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
  ctPaintTools[iteration].pressedImage[0].src = 'assets\\u'+zeroPadder(iteration,2)+'000.PNG'
  ctPaintTools[iteration].pressedImage[1].src = 'assets\\v'+zeroPadder(iteration,2)+'000.PNG'
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
ctPaintTools[19].toolsAction = cursorColorAction
ctPaintTools[20].toolsAction = undoAction
ctPaintTools[21].toolsAction = redoAction

ctPaintTools[8].menuImage.src = 'assets\\t01.png'
ctPaintTools[11].menuImage.src = 'assets\\t02.png'
ctPaintTools[9].menuImage.src = 'assets\\t04.png'
ctPaintTools[12].menuImage.src = 'assets\\t05.png'
ctPaintTools[13].menuImage.src = 'assets\\t03.png'

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
  'cursorColor':19
  'undo':20
  'redo':21

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
    imageSource = 'assets\\u' + zeroPadder(toolsToNumbers[fancyResponsiveTools[fancyToolIndex]], 2)
    imageSource += '00' + fancyIconIndex.toString() + '.PNG'
    fancyResponsiveIcons[fancyResponsiveTools[fancyToolIndex]][0][fancyIconIndex].src =
      imageSource

    # source the icon for selected tool fancyToolIndex of magnitude fancyIconIndex
    imageSource = 'assets\\u'+zeroPadder(toolsToNumbers[fancyResponsiveTools[fancyToolIndex]], 2)
    imageSource += '0' + fancyIconIndex.toString() + '0.PNG'
    fancyResponsiveIcons[fancyResponsiveTools[fancyToolIndex]][1][fancyIconIndex].src =
      imageSource

    fancyIconIndex++
  fancyToolIndex++

# toolsWhichCanBeSolid are tools that when their mode is true, draw a filled version
# instead of an outline.
toolsWhichCanBeSolid = ['square', 'circle']

solidIcons =
  'square': [ new Image(), new Image() ]
  'circle': [ new Image(), new Image() ]

solidToolIndex = 0
while solidToolIndex < toolsWhichCanBeSolid.length
  imageSource = 'assets\\u' + zeroPadder(toolsToNumbers[ toolsWhichCanBeSolid[solidToolIndex] ], 2)
  imageSource += '100.PNG'
  solidIcons[toolsWhichCanBeSolid[solidToolIndex]][0].src = imageSource

  imageSource = 'assets\\u' + zeroPadder(toolsToNumbers[ toolsWhichCanBeSolid[solidToolIndex] ], 2)
  imageSource += '200.PNG'
  solidIcons[toolsWhichCanBeSolid[solidToolIndex]][1].src = imageSource

  solidToolIndex++


$(document).ready ()->
  setTimeout( ()->
    setCanvasSizes()
    prepareCanvas()
    placeToolbars()
    tH.push ctPaintTools[toolsToNumbers['point']]
    tH.shift()
    tH.push ctPaintTools[toolsToNumbers['point']]
    tH.shift()
    drawToolbars()
    positionMenu()
    clearOutCanvasHistoryIndex = 0
    while clearOutCanvasHistoryIndex < 10
      cH.push ctCanvas.toDataURL()
      cH.shift()
      clearOutCanvasHistoryIndex++
  , 2000)

  $('body').keydown (event) ->
    event.preventDefault()
    if normalCircumstance
      keyListeningUnderNormalCircumstance(event)
    else
      whatSortOfDataSorting( keyListeningUnderAbnormalCircumstance(event) )

    if event.keyCode is keysToKeyCodes['up']
      if canvasHeight > (window.innerHeight - toolbarHeight - 5)
        if canvasYOffset < 0 
          canvasYOffset += 3
          positionCanvas()
          positionCorners()

    if event.keyCode is keysToKeyCodes['down']
      if canvasHeight > (window.innerHeight - toolbarHeight - 5)
        if (-1 * canvasYOffset) < ((canvasHeight + 10) - (window.innerHeight - toolbarHeight))
          canvasYOffset-=3
          positionCanvas()
          positionCorners()

    if event.keyCode is keysToKeyCodes['alt']
      toolViewMode++
      toolViewMode = toolViewMode%2
      drawToolbars()

    if event.keyCode is keysToKeyCodes['space']
      if tH[tH.length - 1].mode
        tH[tH.length - 1].mode = false
      else
        tH[tH.length - 1].mode = true
      drawToolbars()

    if event.keyCode is keysToKeyCodes['equals']
      if tH[tH.length - 1].magnitude < tH[tH.length - 1].maxMagnitude
        tH[tH.length - 1].magnitude++
      drawToolbars()

    if event.keyCode is keysToKeyCodes['minus']
      if tH[tH.length - 1].magnitude > 1
        tH[tH.length - 1].magnitude--
      drawToolbars()

    if event.keyCode is keysToKeyCodes['shift']
      colorModify = true

  $('body').keyup (event) ->
    event.preventDefault()
    if event.keyCode is keysToKeyCodes['shift']
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
        cH.push ctCanvas.toDataURL()
        cH.shift()
        cF = []
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
        cH.push ctCanvas.toDataURL()
        cH.shift()
      canvasDataAsImage.src = cH[cH.length - 1]
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

  $('#CtPaint').mousemove (event)->
    tH[tH.length - 1].posture[0]()

  $('#CtPaint').mousedown (event)->
    tH[tH.length - 1].posture[1]()

  $('#CtPaint').mouseup (event)->
    tH[tH.length - 1].posture[2]()

  $('#CtPaint').mouseleave ()->
    coverUpOldCursor() 
    tH[tH.length - 1].posture[3]() 
    toolbar1Context.drawImage(toolbar1sImage1,188,3)  

  $('#toolbar0').mousedown (event)->
    toolIndex = 0
    while toolIndex < numberOfTools
      leftBoundary = ctPaintTools[toolIndex].clickRegion[0] < event.clientX
      rightBoundary = event.clientX < (ctPaintTools[toolIndex].clickRegion[0] + buttonWidth)
      if leftBoundary and rightBoundary
        topBoundary = ctPaintTools[toolIndex].clickRegion[1] < event.clientY 
        bottomBoundary = event.clientY < (ctPaintTools[toolIndex].clickRegion[1] + buttonHeight)
        if topBoundary and bottomBoundary
          if toolIndex < 8
            copeWithSelection()
            tH.push ctPaintTools[toolIndex]
            tH.shift()
          else
            ctPaintTools[toolIndex].toolsAction()
      toolIndex++
    drawToolbars()

  $('#toolbar1').mousemove (event)->
    tXSpot = event.clientX
    tYSpot = event.clientY - window.innerHeight + toolbarHeight
    information = getColorValue(toolbar1Context, tXSpot, tYSpot).toUpperCase() + ', (#,#) '
    drawStringAsCommandPrompt(toolbar1Context, information, 0, 191, 12)

  $('#toolbar1').mouseleave ()->  
    toolbar1Context.drawImage(toolbar1sImage1,188,3)  

  $('#toolbar1').mousedown (event)->
    toolbar1X = event.clientX
    toolbar1Y = event.clientY - (window.innerHeight - toolbarHeight)
    if 52 < toolbar1X and toolbar1X < 188
      if 4 < toolbar1Y and toolbar1Y < 35
        if colorModify
          spotInColorPalette = (((toolbar1X - 52 ) // 17) * 2) + ((toolbar1Y - 4) // 16)
          colorMenu()
        else
          colorSwatches[0] = colorPalette[(((toolbar1X - 52 ) // 17) * 2) + ((toolbar1Y - 4) // 16)]
        drawToolbars()

  $('#dragAndDrop').on('dragenter', (event)->
    event.stopPropagation()
    event.preventDefault()
    return false
  )

  $('#dragAndDrop').on('dragover', (event)->
    event.stopPropagation()
    return false
  )

  $('#dragAndDrop').on('drop', (event)->
    event.stopPropagation()
    event.preventDefault()
    filesType = event.originalEvent.dataTransfer.files[0].type.substr(0,5)
    if filesType is 'image'
      imageLoaded = new FileReader()
      theFile = event.originalEvent.dataTransfer.files[0]
      imageLoaded.onload = ->
        imageToOpen = new Image()
        imageToOpen.onload = ->
          widthExceedsCanvas = canvasWidth < imageToOpen.width
          heightExceedsCanvas = canvasHeight < imageToOpen.height
          if not widthExceedsCanvas and not heightExceedsCanvas
            ctContext.drawImage(imageToOpen, 0, 0)
            copyMemory = ctContext.getImageData(0, 0, imageToOpen.width, imageToOpen.height)
            canvasDataAsImage = new Image()
            canvasDataAsImage.onload = ->
              ctContext.drawImage(canvasDataAsImage, 0, 0)
              copyExists = true
              pasteAction()
            canvasDataAsImage.src = cH[cH.length - 1]
          else
            newWidth = imageToOpen.width
            newHeight = imageToOpen.height
            ctContext.canvas.width = parseInt(newWidth)
            ctContext.canvas.height = parseInt(newHeight)
            canvasWidth = ctContext.canvas.width
            canvasHeight = ctContext.canvas.height
            ctCanvas.style.width = (canvasWidth).toString()+'px'
            ctCanvas.style.height = (canvasHeight).toString()+'px'
            ctContext.drawImage(imageToOpen, 0, 0)
            cH.push ctCanvas.toDataURL()
            cH.shift()
            positionCorners()
        imageToOpen.src = imageLoaded.result
      imageLoaded.readAsDataURL(theFile)
      console.log 'C'
    return false
  )

        