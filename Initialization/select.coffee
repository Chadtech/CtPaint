###
  When a region is selected, it is outlined by a box. The outline
  has a very particular pattern, and the declaration of the
  relevant program components is very complicated. The pattern
  is four pixels long. The variable dataToGive contains the color
  pattern along the outline. 

  selectLinesOfLengthX contains four canvas elements, each 1 pixel
  tall. Each canvas element is its index number + 1 wide. When the
  outline is drawn, a the canvas of length 4 (index 3) is repeatedly
  pasted until there is less than four pixels left. At which point,
  a canvas of the remaining length is pasted (1, 2 or 3). 
  selectLinesOfLengthY is the vertical version of this technique.
###
selectLinesOfLengthX = []
selectLinesOfLengthY = []

dataToGive = [
  [52, 110, 192, 255]
  [52, 110, 192, 255]
  [220, 196, 85, 255]
  [220, 196, 85, 255]
]

lineIndex = 0
while lineIndex < dataToGive.length

  horizontalCanvasElement = document.createElement('canvas')
  horizontalCanvasElement = horizontalCanvasElement.getContext('2d').createImageData(lineIndex+1, 1)
  selectLinesOfLengthX.push horizontalCanvasElement

  verticalCanvasElement = document.createElement('canvas')
  verticalCanvasElement = verticalCanvasElement.getContext('2d').createImageData(1, lineIndex+1)
  selectLinesOfLengthY.push verticalCanvasElement

  dataIndex = 0
  while dataIndex < (lineIndex+1)
    eachColorIndex = 0
    while eachColorIndex < dataToGive.length
      colorIndexOfDatum = eachColorIndex + (dataIndex * 4)
      selectLinesOfLengthX[selectLinesOfLengthX.length - 1].data[colorIndexOfDatum] = 
        dataToGive[dataIndex][eachColorIndex]
      selectLinesOfLengthY[selectLinesOfLengthY.length - 1].data[colorIndexOfDatum] = 
        dataToGive[dataIndex][eachColorIndex]
      eachColorIndex++
    dataIndex++
  lineIndex++

drawSelectBox = (canvas, beginX, beginY, endX, endY) ->
  if beginX > endX
    swapStorage = beginX
    beginX = endX
    endX = swapStorage
  if beginY > endY
    swapStorage = beginY
    beginY = endY
    endY = swapStorage
  distanceX = endX - beginX
  distanceY = endY - beginY
  while distanceX > 0
    if distanceX > 3
      canvas.putImageData(selectLinesOfLengthX[3],endX - distanceX, beginY)
      canvas.putImageData(selectLinesOfLengthX[3],endX - distanceX, endY)
      distanceX-=3
    else
      canvas.putImageData(selectLinesOfLengthX[distanceX],endX - distanceX, beginY)
      canvas.putImageData(selectLinesOfLengthX[distanceX],endX - distanceX, endY)
      distanceX-=distanceX
  while distanceY > 0
    if distanceY > 3
      canvas.putImageData(selectLinesOfLengthY[3], beginX, endY - distanceY)
      canvas.putImageData(selectLinesOfLengthY[3], endX, endY - distanceY)
      distanceY-=3
    else
      canvas.putImageData(selectLinesOfLengthY[distanceY], beginX, endY - distanceY)
      canvas.putImageData(selectLinesOfLengthY[distanceY], endX, endY - distanceY)
      distanceY-=distanceY

