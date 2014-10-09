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

  whatSortOfDataSorting = scaleDataSorting

scaleDataSorting = ( inputMaterial ) ->
  if inputMaterial isnt undefined
    acceptableKeys = ['x','y']
    if inputMaterial in acceptableKeys
      switch inputMaterial
        when 'x'
          console.log 'A'