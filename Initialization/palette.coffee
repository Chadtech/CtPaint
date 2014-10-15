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

  The colors were largely ripped out of the youtube video of Tom Sach's
  video 'colors'. Some minor adjustments.
###
topRow = [
  # Default windows light gray / windows command prompt gray
  [192, 192, 192]
  # black
  [0 ,0 ,0]
  # Olive Drab
  [85, 96, 45]
  # Sand / Skin / light brown
  [221, 201, 142]
  # McDonalds Yellow
  [243, 211, 27]
  # An instance of Orange in Sach's video 'color'
  [255, 91, 49]
  # McDonalds Red
  [212, 51, 29]
  # Slightly gray-blue pink
  [230, 121, 166]
]

bottomRow = [
  # Default Windows dark gray
  [64, 64, 64]
  # White
  [255, 255, 255]
  # Lighter and grayer Navy Blue
  [50, 54, 128]
  # Klein Blue
  [0, 47, 167]
  # Tiffany Blue
  [10, 186, 181]
  # 'Oriental Avenue' Blue
  # As in, the color of that property from the game monopoly
  # that I believe is gray and not blue, but apparently
  # most people consider to be blue.
  [159, 170, 210]
  # Green I made up 0
  [157, 212, 147]
  # Green I made up 1
  [10, 202, 26]
]

colorPalette = []
colorPaletteIndex = 0
while colorPaletteIndex < 8
  colorPalette.push topRow[colorPaletteIndex]
  colorPalette.push bottomRow[colorPaletteIndex]
  colorPaletteIndex++

  