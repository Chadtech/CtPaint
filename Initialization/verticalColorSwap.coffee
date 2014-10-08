###
  verticalColorSwap swaps the 4 swatch colors vertically.
  Meaning if the swatches are:

      *** ***
      *0* *1*
      *** ***

        *** *** 
        *2* *3*
        *** ***

  verticalColorSwap swaps 0 with 2, and 1 with 3    
###
verticalColorSwap = () ->
  tH.push ctPaintTools[toolsToNumbers['verticalSwap']]
  drawToolbars()

  rearrangedSwatches = [ colorSwatches[2], colorSwatches[3], colorSwatches[0], colorSwatches[1] ]
  colorSwatches = rearrangedSwatches

  setTimeout( ()->
    tH.pop()
    drawToolbars()
  ,20)

