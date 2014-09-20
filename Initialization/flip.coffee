flipAction = () ->
  menuUp = true
  normalCircumstance = false
  $('#menuDiv').css('top', (window.innerHeight - toolbarHeight - 45).toString())
  $('#menuDiv').css('left', (toolbarWidth + 10).toString())

  menuContext.canvas.width = 119
  menuContext.canvas.height = 35

  previouslySelectedTool = previouslySelectedTool
  selectedTool = ctPaintTools[10]
  menuContext.drawImage(selectedTool.menuImage, 0, 0)
  drawToolbars()

  whatSortOfDataSorting = flipDataSorting

flipDataSorting = ( inputMaterial ) ->
  if inputMaterial isnt undefined
    acceptableKeys = ['x','y']
    if inputMaterial in acceptableKeys
      switch inputMaterial
        when 'x'
          if areaSelected
            console.log selection.data 
          else
            console.log 'NOPE'
        when 'y'
          if areaSelected
            console.log selection.data 
          else
            console.log 'NOPE'