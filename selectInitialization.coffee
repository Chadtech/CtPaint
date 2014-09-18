selectLinesOfLengthX = []
selectLinesOfLengthY = []
dataToGive = [
  [224, 96, 128, 255] 
  [128, 128, 128, 255] 
  [128, 128, 128, 255] 
  [192, 192, 0, 255] 
]

lineIndex = 0
while lineIndex < dataToGive.length
  selectLinesOfLengthX.push document.createElement('canvas').getContext('2d').createImageData(lineIndex+1, 1)
  selectLinesOfLengthY.push document.createElement('canvas').getContext('2d').createImageData(1, lineIndex+1)
  dataIndex = 0
  while dataIndex < (lineIndex+1)
    eachColorIndex = 0
    while eachColorIndex < dataToGive.length
      selectLinesOfLengthX[selectLinesOfLengthX.length-1].data[eachColorIndex + (dataIndex * 4)] = dataToGive[dataIndex][eachColorIndex]
      selectLinesOfLengthY[selectLinesOfLengthY.length-1].data[eachColorIndex + (dataIndex * 4)] = dataToGive[dataIndex][eachColorIndex]
      eachColorIndex++
    dataIndex++
  lineIndex++