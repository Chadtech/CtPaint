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
  spotInMenuZeroDatum = 0
  drawColorMenu()

colorDataSorting = ( inputMaterial ) ->
  if inputMaterial isnt undefined
    keysThatDontAddData = ['backspace', 'left', 'right', 'enter']
    if not inputMaterial in keysThatDontAddData
      menuDatumZero = replaceAt(menuDatumZero, inputMaterial, spotInMenuZeroDatum )
      if spotInMenuZeroDatum < 5
        spotInMenuZeroDatum++
    else
      switch inputMaterial
        when 'backspace'
          menuDatumZero = replaceAt(menuDatumZero, '0', spotInMenuZeroDatum)
          if 0 < spotInMenuZeroDatum
            spotInMenuZeroDatum--
        when 'left'
          if 0 < spotInMenuZeroDatum
            spotInMenuZeroDatum--
        when 'right'
          if spotInMenuZeroDatum < 5
            spotInMenuZeroDatum++
        when 'enter'
          colorPallete[spotInColorPallete] =  hexToRGB(menuDatumZero)
          drawToolbars()
          $('#menuDiv').css('top',(window.innerHeight).toString())
          normalCircumstance = true
          menuUp = false
    drawColorMenu()

drawColorMenu = () ->
  currentlyHighlighted = menuDatumZero[spotInMenuZeroDatum].toUpperCase()
  drawStringAsCommandPrompt( menuContext, menuDatumZero.toUpperCase(), 1, 91, 10 )
  drawStringAsCommandPrompt( menuContext, currentlyHighlighted, 2, 91+(12*spotInMenuZeroDatum), 10 )
