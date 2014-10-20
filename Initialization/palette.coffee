###
  Color swatches are the four colors in the very lower left corner of the window
  They are the colors you have immediate access to drawing with
###
colorSwatches = [ [192,192,192], [0,0,0], [64,64,64], [255,255,255] ]

###
  True when the menu has popped up to change a color in the color pallete
###
colorModify = false

###
  The static image of the color menu that gives the impression of
  deep functionality
###
colorMenuImage = new Image()
colorMenuImage.src = 'assets/t00.png'

###
  defined as an index number once a color has been shift clicked
###
spotInColorPalette = undefined

###
  The color pallete. Even numbered pallete elements are on the top row,
  odds on the bottom row. That aside the colors ascend from left to right
###
topRow = [
  [192, 192, 192]
  [0 ,0 ,0]
  [101, 92, 77]
  [85, 96, 45]
  [176, 214, 48]
  [221, 201, 142]
  [243, 211, 27]
  [240, 147, 35]
  [255, 91, 49]
  [212, 51, 29]
  [242, 29, 35]
  [252, 164, 132]
  [230, 121, 166]
  [80, 0, 87]
  [240, 224, 214]
  [255, 255, 238]
]

bottomRow = [
  [64, 64, 64]
  [255, 255, 255]
  [157, 144, 136]
  [50, 54, 128]
  [36, 33, 157]
  [0, 47, 167]
  [23, 92, 254]
  [10, 186, 181]
  [159, 170, 210]
  [214, 218, 240]
  [238, 242, 255]
  [157, 212, 147]
  [170, 211, 13]
  [60, 182, 99]
  [10, 202, 26]
  [201, 207, 215]
]

colorPalette = []
colorPaletteIndex = 0
while colorPaletteIndex < 16
  colorPalette.push topRow[colorPaletteIndex]
  colorPalette.push bottomRow[colorPaletteIndex]
  colorPaletteIndex++

  