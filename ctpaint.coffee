toolbarHeight = 36
toolbarWidth = 52

canvasWidth = 128
canvasHeight = 128

ctCanvas = document.getElementById('CtPaint')
ctContext = ctCanvas.getContext('2d')
toolbar0Canvas = document.getElementById('toolbar0')
toolbar0Context = toolbar0Canvas.getContext('2d')
toolbar1Canvas = document.getElementById('toolbar1')
toolbar1Context = toolbar1Canvas.getContext('2d')
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
  console.log 'THE ARGUMENTS', beginX, beginY, endX, endY
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
    console.log 'HEY', beginX, endX, 'YS', beginY, endY
    putPixel(canvas,color,beginX,beginY)
    console.log 'OUR TWO CONDITIONS', beginX == endX, beginY == endY
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

  $('#border2Div').css('top',(4+canvasHeight).toString())
  $('#border2Div').css('left',(toolbarWidth+canvasWidth+5).toString())

  $('#border3Div').css('top',(4+canvasHeight).toString())
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
  toolbar0Context.fillStyle = '#202818'
  toolbar0Context.fillRect(0,0,toolbarWidth,window.innerHeight-toolbarHeight)

  #drawLine(toolbar0Context,[255,0,0],0,0,21,100)

  toolbar1Context.fillStyle = '#202818'
  toolbar1Context.fillRect(0,0,window.innerWidth,toolbarHeight)
  ###
  toolbarContext.beginPath()
  toolbarContext.moveTo(toolbarWidth-0.5,0)
  toolbarContext.lineTo(toolbarWidth-0.5,window.innerHeight-toolbarHeight)
  toolbarContext.lineWidth = 1
  toolbarContext.strokeStyle = '#101010'
  toolbarContext.stroke()
  toolbarContext.closePath()
  ###

getMousePosition = (event) ->
  'x':event.clientX
  'y':event.clientY

$(document).ready ()->

  $(window).resize ()->
    setCanvasSizes()
    placeToolbars()
    drawToolbars()

  $('#CtPaint').mousemove (event)->
    console.log getMousePosition(event)

  $('#CtPaint').mousedown (event)->
    xSpot = getMousePosition(event)['x'] - toolbarWidth
    ySpot = getMousePosition(event)['y']



  $('#toolbar').mousemove (event)->
    console.log getMousePosition(event)

setTimeout( ()->
  setCanvasSizes()
  prepareCanvas()
  placeToolbars()
  drawToolbars()

  drawLine(ctContext,[255,0,0],64,64,96,64)
  drawLine(ctContext,[255,255,0],64,64,96,96)
  drawLine(ctContext,[0,255,0],64,64,64,96)
  drawLine(ctContext,[0,255,255],64,64,32,96)
  drawLine(ctContext,[0,0,255],64,64,32,64)
  drawLine(ctContext,[255,0,255],64,64,32,32)
  drawLine(ctContext,[255,0,0],64,64,64,32)
  drawLine(ctContext,[255,255,0],64,64,96,32)
  #drawLine(ctContext,[255,0,0],16,16,64,32)

,250)






