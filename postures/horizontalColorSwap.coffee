horizontalColorSwapPosture = [
  () ->
    toolbar1Context.drawImage(toolbar1sImage1,188,3)   
    drawInformationToolbar0()
    drawInformationToolbar1()
  () ->
    mousePressed = true
  () ->
    mousePressed = false
    drawToolbars()
]