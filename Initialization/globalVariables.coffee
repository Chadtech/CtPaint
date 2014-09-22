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

#selectedTool = undefined
#previouslySelectedTool = undefined
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
menuDatumZero = undefined
spotInMenuZeroDatum = 0

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

