toolbarHeight = 36
toolbarWidth = 52

canvasWidth = 256
canvasHeight = 256

selectedTool = undefined
numberOfTools = 22
toolViewMode = 0

mousePressed = false

zeroPadder = (number,zerosToFill) ->
  numberAsString = number+''
  while numberAsString.length < zerosToFill
    numberAsString = '0'+numberAsString
  return numberAsString

rgbToHex = (rgb) ->
  return '#' + rgb[0].toString(16) + rgb[1].toString(16) + rgb[2].toString(16)

ctCanvas = document.getElementById('CtPaint')
ctContext = ctCanvas.getContext('2d')

toolbar0Canvas = document.getElementById('toolbar0')
toolbar0Context = toolbar0Canvas.getContext('2d')
toolbar0sImage0 = new Image()
toolbar0sImage0.src = 'toolbar0v.PNG'
toolbar0sImage1 = new Image()
toolbar0sImage1.src = 'toolbar0u.PNG'

buttonWidth = 24
buttonHeight = 24

toolNames = ['zoom','select','sample','fill','square','circle','line','point']

zoomAction = ->
  console.log '0'

selectAction = ->
  console.log '1'

sampleAction = ->
  console.log '2'

fillAction = ->
  console.log '3'

squareAction = ->
  console.log '4'

circleAction = ->
  console.log '5'

lineAction = ->
  console.log '6'

pointAction = (canvas, color, beginX, beginY, endX, endY) ->
  drawLine(canvas, color, beginX, beginY, endX, endY)

ctPaintTools = {}

iteration = 0
while iteration < numberOfTools
  thisIteration = iteration
  ctPaintTools[iteration] =
    number: iteration
    name: toolNames[iteration]
    clickRegion: [((iteration%2)*25),(Math.floor(iteration/2))*25]
    pressedImage: [new Image(), new Image()]
    toolsAction: ->
      console.log toolNames, iteration, thisIteration
      console.log 'did a '+toolNames[@number]
  ctPaintTools[iteration].pressedImage[0].src = 'u'+zeroPadder(iteration,2)+'.PNG'
  ctPaintTools[iteration].pressedImage[1].src = 'v'+zeroPadder(iteration,2)+'.PNG'
  iteration++

ctPaintTools[7].toolsAction = pointAction

toolbar1Canvas = document.getElementById('toolbar1')
toolbar1Context = toolbar1Canvas.getContext('2d')
toolbar1sImage = new Image()
toolbar1sImage.src = 'toolbar10.png'
backgroundCanvas = document.getElementById('background')
backgroundContext = backgroundCanvas.getContext('2d')

border0Canvas = document.getElementById('border0')
border0Context = border0Canvas.getContext('2d')
border1Canvas = document.getElementById('border1')
border1Context = border1Canvas.getContext('2d')
border2Canvas = document.getElementById('border2')
border2Context = border2Canvas.getContext('2d')
border3Canvas = document.getElementById('border3')
border3Context = border3Canvas.getContext('2d')

border0Context.canvas.width = 1
border0Context.canvas.height = 1
border1Context.canvas.width = 1
border1Context.canvas.height = 1
border2Context.canvas.width = 1
border2Context.canvas.height = 1
border3Context.canvas.width = 1
border3Context.canvas.height = 1

colorsAtHand = [[192,192,192],[0,0,0],[255,255,255],[0,0,0]]

xSpot = undefined
ySpot = undefined

putPixel = (canvas, color, whereAtX, whereAtY) ->
  newPixel = canvas.createImageData(1,1)
  newPixelsColor = newPixel.data
  newPixelsColor[0] = color[0]
  newPixelsColor[1] = color[1]
  newPixelsColor[2] = color[2]
  newPixelsColor[3] = 255
  canvas.putImageData(newPixel,whereAtX,whereAtY)

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
  
positionCorners = ->
  $('#border0Div').css('top','4')
  $('#border0Div').css('left',(toolbarWidth+4).toString())

  $('#border1Div').css('top','4')
  $('#border1Div').css('left',(toolbarWidth+canvasWidth+5).toString())

  $('#border2Div').css('top',(5+canvasHeight).toString())
  $('#border2Div').css('left',(toolbarWidth+canvasWidth+5).toString())

  $('#border3Div').css('top',(5+canvasHeight).toString())
  $('#border3Div').css('left',(toolbarWidth+4).toString())

prepareCanvas = ->
  ctContext.canvas.width = canvasWidth
  ctContext.canvas.height = canvasHeight

  ctContext.fillStyle = '#000000'
  ctContext.fillRect(0,0,canvasWidth,canvasHeight)

  $('#ctpaintDiv').css('top', '5')
  $('#ctpaintDiv').css('left', (toolbarWidth+5).toString())

  positionCorners()

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
  toolbar0Context.drawImage(toolbar0sImage0,0,0)
  drawLine(toolbar0Context,[16,20,8],toolbarWidth-1,0,toolbarWidth-1,window.innerHeight-toolbarHeight)
  if selectedTool
    toolbar0Context.drawImage(selectedTool.pressedImage[toolViewMode],selectedTool.clickRegion[0],selectedTool.clickRegion[1])

  toolbar1Context.fillStyle = '#202020'
  toolbar1Context.fillRect(0,0,window.innerWidth,toolbarHeight)
  toolbar1Context.drawImage(toolbar1sImage,0,1)
  drawLine(toolbar1Context,[16,20,8],toolbarWidth-1,0,window.innerWidth,0)

  toolbar1Context.fillStyle = rgbToHex(colorsAtHand[0])
  toolbar1Context.fillRect(4,3,14,14)

  toolbar1Context.fillStyle = rgbToHex(colorsAtHand[1])
  toolbar1Context.fillRect(21,3,14,14)

  toolbar1Context.fillStyle = rgbToHex(colorsAtHand[2])
  toolbar1Context.fillRect(13,20,14,14)

  toolbar1Context.fillStyle = rgbToHex(colorsAtHand[2])
  toolbar1Context.fillRect(30,20,14,14)

getMousePosition = (event) ->
  xSpot = event.clientX
  ySpot = event.clientY

$(document).ready ()->
  setTimeout( ()->
    setCanvasSizes()
    prepareCanvas()
    placeToolbars()
    selectedTool = ctPaintTools[7]
    drawToolbars()
  ,200)

  $(window).resize ()->
    setCanvasSizes()
    placeToolbars()
    drawToolbars()

  $('#CtPaint').mousemove (event)->
    oldX = xSpot
    oldY = ySpot
    getMousePosition(event)
    switch selectedTool.name
      when 'point'
        if mousePressed
          selectedTool.toolsAction(ctContext, colorsAtHand[0], xSpot-(toolbarWidth+5), ySpot-5, oldX-(toolbarWidth+5), oldY-5)

  $('#CtPaint').mousedown (event)->
    mousePressed = true
    getMousePosition(event)
    switch selectedTool.name
      when 'point'
       selectedTool.toolsAction(ctContext, colorsAtHand[0], xSpot-(toolbarWidth+5), ySpot-5, xSpot-(toolbarWidth+5), ySpot-5)

  $('#CtPaint').mouseup (event)->
    mousePressed = false

  $('#toolbar0').mousedown (event)->
    getMousePosition(event)
    toolIndex = 0
    while toolIndex < numberOfTools
      if ctPaintTools[toolIndex].clickRegion[0]<xSpot and xSpot<(ctPaintTools[toolIndex].clickRegion[0]+buttonWidth)
        if ctPaintTools[toolIndex].clickRegion[1]<ySpot and ySpot<(ctPaintTools[toolIndex].clickRegion[1]+buttonHeight)
          selectedTool = ctPaintTools[toolIndex]
      toolIndex++
    drawToolbars()









