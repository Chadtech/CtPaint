ct = new Image()
ct.src = "assets/ct.png"

instructions = new Image()
instructions.src = 'assets/instructions.png'

# Useful when I want to ensure a datum entry is a hexadecimal value
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
viewMode = false
zoomFactor = 1
zoomRootX = undefined
zoomRootY = undefined
zoomX = undefined
zoomY = undefined

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
selectionImage = undefined
areaSelected = false
selectionX = 0
selectionY = 0
gripX = 0
gripY = 0
selectionsWidth = 0
selectionsHeight = 0
transparent = false
boxInformation = undefined
canvasHoldover = undefined

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
whatSortOfMouseListening = undefined
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

  casualX and casualY are used in instances where the mouse location
  needs to be asertained, but without interference to the xSpot/ySpot
  pair.
###
xSpot = undefined
ySpot = undefined

oldX = undefined
oldY = undefined

casualX = undefined
casualY = undefined

###
  The location of the cursor on the canvas is indicated by a colored pixel
  Since a color might not be visible over certain canvases, the option
  to change the pixel color is available. The array cursorColors is contains
  the full selection of cursor colors.
###
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

###
  The location of the cursor is defined seperately from the other
  cursor location pairs (xSpot, oldX, casualX), to prevent
  interference. The location of the cursor pixel is updated continuously,
  with the old pixel being covered up, and the new one being drawn
###
cursorX = undefined
cursorY = undefined

oldCursorX = undefined
oldCursorY = undefined

oldCursorsColor = undefined

buttonWidth = 24
buttonHeight = 24

###
  The user can click and drag the primary color swatch to the color
  palette. This boolean indicates if the primary color swatch has been
  clicked down on.
###
swatchColorPicked = false

