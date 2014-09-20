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
selectionX = 0
selectionY = 0
gripX = 0
gripY = 0
selectionsWidth = 0
selectionsHeight = 0

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

