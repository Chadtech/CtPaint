###
  HorizontalColorSwap swaps the 4 swatch colors horizontally.
  Meaning if the swatches are:

      *** ***
      *0* *1*
      *** ***

        *** ***
        *2* *3*
        *** ***

  horizontalColorSwap swaps 0 with 1, and 2 with 3    
###
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
