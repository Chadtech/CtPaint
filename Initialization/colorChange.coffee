###
  Color menu is the menu that comes up when you shift click
  on any color in the color pallete. The color menu has one input,
  that being a hexidecimal color. When Enter is pressed, that spot 
  in the color pallete becomes that hexidecimal color. 
###
colorMenu = ()->
  menuUp = true
  normalCircumstance = false
  $('#menuDiv').css('top', (window.innerHeight - toolbarHeight - 45).toString())
  $('#menuDiv').css('left', (toolbarWidth + 10).toString())

  menuContext.canvas.width = colorMenuImage.width
  menuContext.canvas.height = colorMenuImage.height

  menuContext.drawImage(colorMenuImage, 0, 0)

  colorDataSortingInitialize()
  whatSortOfDataSorting = colorDataSorting
  whatSortOfMouseListening = colorMouseListening

colorDataSortingInitialize = () ->
  menuDatum = rgbToHex(colorPalette[spotInColorPalette]).substr(1)
  spotInMenuDatum = 0
  drawColorMenu()

finishUp = () ->
  drawToolbars()
  $('#menuDiv').css('top',(window.innerHeight).toString())
  normalCircumstance = true
  menuUp = false

###
  This function takes strings of key names, and decides what to do with them
###
colorDataSorting = ( inputMaterial, eventIsKeyDown ) ->
  if inputMaterial isnt undefined
    keysThatDontAddData = [ 'backspace', 'left', 'right', 'enter', 'n' ]
    keyAddsData = not (inputMaterial in keysThatDontAddData)
    keyIsAcceptableDataFormat = inputMaterial in hexadecimalProper
    if not eventIsKeyDown
      if keyAddsData and keyIsAcceptableDataFormat
        menuDatum = replaceAt(menuDatum, inputMaterial, spotInMenuDatum )
        if spotInMenuDatum < 5
          spotInMenuDatum++
      else
        switch inputMaterial
          when 'backspace'
            menuDatum = replaceAt(menuDatum, '0', spotInMenuDatum)
            if 0 < spotInMenuDatum
              spotInMenuDatum--
          when 'left'
            if 0 < spotInMenuDatum
              spotInMenuDatum--
          when 'right'
            if spotInMenuDatum < 5
              spotInMenuDatum++
          when 'enter'
            colorPalette[spotInColorPalette] = hexToRGB( menuDatum )
            finishUp()
          when 'n'
            finishUp()
    else
      switch inputMaterial
        when 'enter'
          menuContext.drawImage(enterLitUp, colorMenuImage.width - 162, 5)
        when 'n'
          menuContext.drawImage(cancelLitUp, colorMenuImage.width - 89, 5)
    drawColorMenu()

colorMouseListening = ( coordinates, eventIsMouseDown ) ->
  #Check if mouse event was in enter button region
  notTooFarLeft = (colorMenuImage.width - 162) < coordinates[0]
  notTooFarRight = coordinates[0] < ((colorMenuImage.width - 162) + enterLitUp.width)
  withinXBoundaries = notTooFarLeft and notTooFarRight
  notTooHigh = 5 < coordinates[1]
  notTooLow = coordinates[1] < (5 + enterLitUp.height)
  withinYBoundaries = notTooHigh and notTooLow
  if withinXBoundaries and withinYBoundaries
    if eventIsMouseDown
      menuContext.drawImage(enterLitUp, colorMenuImage.width - 162, 5)
    else
      colorPalette[spotInColorPalette] = hexToRGB( menuDatum )
      finishUp()

  #Check if mouse event was in cancel button region
  notTooFarLeft = (colorMenuImage.width - 89) < coordinates[0]
  notTooFarRight = coordinates[0] < ((colorMenuImage.width - 89) + cancelLitUp.width)
  withinXBoundaries = notTooFarLeft and notTooFarRight
  notTooHigh = 5 < coordinates[1]
  notTooLow = coordinates[1] < (5 + cancelLitUp.height)
  withinYBoundaries = notTooHigh and notTooLow
  if withinXBoundaries and withinYBoundaries
    if eventIsMouseDown
      menuContext.drawImage(cancelLitUp, colorMenuImage.width - 89, 5)
    else
      finishUp()

drawColorMenu = () ->
  currentlyHighlighted = menuDatum[spotInMenuDatum].toUpperCase()
  drawStringAsCommandPrompt( menuContext, menuDatum.toUpperCase(), 1, 91, 10 )
  drawStringAsCommandPrompt( menuContext, currentlyHighlighted, 2, 91 + (12 * spotInMenuDatum), 10 )

