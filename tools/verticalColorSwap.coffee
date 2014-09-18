verticalColorSwap = () ->
  previouslySelectedTool = selectedTool
  selectedTool = ctPaintTools[17]
  drawToolbars()

  rearrangedSwatches = [ colorSwatches[2], colorSwatches[3], colorSwatches[0], colorSwatches[1] ]
  colorSwatches = rearrangedSwatches

  setTimeout( ()->
    selectedTool = previouslySelectedTool
    drawToolbars()
  ,20)
