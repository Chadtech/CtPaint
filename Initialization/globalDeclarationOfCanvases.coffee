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

