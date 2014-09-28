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

