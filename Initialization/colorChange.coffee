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

  menuContext.canvas.width = 255
  menuContext.canvas.height = 35

  menuContext.drawImage(colorMenuImage, 0, 0)

  colorDataSortingInitialize()
  whatSortOfDataSorting = colorDataSorting

colorDataSortingInitialize = () ->
  menuDatumZero = rgbToHex(colorPallete[spotInColorPallete]).substr(1)
  spotInMenuDatum = 0
  drawColorMenu()

###
  This function takes strings of key names, and decides what to do with them
###
colorDataSorting = ( inputMaterial ) ->
  if inputMaterial isnt undefined
    keysThatDontAddData = ['backspace', 'left', 'right', 'enter']
    if not (inputMaterial in keysThatDontAddData)
      menuDatumZero = replaceAt(menuDatumZero, inputMaterial, spotInMenuDatum )
      if spotInMenuDatum < 5
        spotInMenuDatum++
    else
      switch inputMaterial
        when 'backspace'
          menuDatumZero = replaceAt(menuDatumZero, '0', spotInMenuDatum)
          if 0 < spotInMenuDatum
            spotInMenuDatum--
        when 'left'
          if 0 < spotInMenuDatum
            spotInMenuDatum--
        when 'right'
          if spotInMenuDatum < 5
            spotInMenuDatum++
        when 'enter'
          colorPallete[spotInColorPallete] =  hexToRGB(menuDatumZero)
          drawToolbars()
          $('#menuDiv').css('top',(window.innerHeight).toString())
          normalCircumstance = true
          menuUp = false
    drawColorMenu()

drawColorMenu = () ->
  currentlyHighlighted = menuDatumZero[spotInMenuDatum].toUpperCase()
  drawStringAsCommandPrompt( menuContext, menuDatumZero.toUpperCase(), 1, 91, 10 )
  drawStringAsCommandPrompt( menuContext, currentlyHighlighted, 2, 91+(12*spotInMenuDatum), 10 )

