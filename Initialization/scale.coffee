###
  These are the functions relevant to flipping images, whether that
  image be the canvas itself, or a selection of the canvas. 
###
scaleAction = () ->
  menuUp = true
  normalCircumstance = false
  $('#menuDiv').css('top', (window.innerHeight - toolbarHeight - 45).toString())
  $('#menuDiv').css('left', (toolbarWidth + 10).toString())

  menuContext.canvas.width = tH[tH.length - 1].menuImage.width
  menuContext.canvas.height = tH[tH.length - 1].menuImage.height

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
