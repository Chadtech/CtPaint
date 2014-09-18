horizontalColorSwap = () ->
  previouslySelectedTool = selectedTool
  selectedTool = ctPaintTools[16]
  drawToolbars()

  rearrangedSwatches = [ colorSwatches[1], colorSwatches[0], colorSwatches[3], colorSwatches[2] ]
  colorSwatches = rearrangedSwatches

  setTimeout( ()->
    selectedTool = previouslySelectedTool
    drawToolbars()
  ,20)
