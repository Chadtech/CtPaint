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
  # Coolest Safety Glasses Brown
  [101, 92, 77]
  # That sickly brown orange of wood Shelac
  [240, 147, 35]
  # Sand / Skin / light brown
  [221, 201, 142]
  # Bertrand Russell's Skin Color
  [252, 164, 132]
  # McDonalds Yellow
  [243, 211, 27]
  # Syro Album Cover Yellow
  [176, 214, 48]
  # An instance of Orange in Sach's video 'color'
  [255, 91, 49]
  # McDonalds Red
  [212, 51, 29]
  # Red from the red top attractive model 'Elly Tran Ha' was wearing
  [242, 29, 35]
  # Slightly gray-blue pink
  [230, 121, 166]
  # The Rose Pedals in the video of Harry Partch making Rose Pedal Jam
  [80, 0, 87]
  # The dark red in 4chans Yastsuba color scheme
  [240, 224, 214]
  # The light red in 4chans Yatsuba color scheme
  [255, 255, 238]
]

bottomRow = [
  # Default Windows dark gray
  [64, 64, 64]
  # White
  [255, 255, 255]
  # Thom Yorke's outfit color in the music video of 'Ingenue'
  [157, 144, 136]
  # Lighter and grayer Navy Blue
  [50, 54, 128]
  # The wonderful blue from blue white board markers
  [36, 33, 157]
  # Klein Blue
  [0, 47, 167]
  # Blue that I chose to resemble the color of the sky once
  [23, 92, 254]
  # Tiffany Blue
  [10, 186, 181]
  # 'Oriental Avenue' Blue
  # As in, the color of that property from the game monopoly
  # that I believe is gray and not blue, but apparently
  # most people consider to be blue.
  [159, 170, 210]

  # The Dark blue in 4chan's Yastuba B
  [214, 218, 240]
  # The light blue in 4chan's Yatsuba B
  [238, 242, 255]
  # 'Green' from the album cover of 'Amplifier Worship' by Boris
  [157, 212, 147]
  # Green I made up 0
  [170, 211, 13]
  # Greg Saunier from Deerhoof's shirt in Jaun's basement performance
  [60, 182, 99]
  # Green I made up 1
  [10, 202, 26]
  # The snare drums head in the video 'Zach Hill Practicing'
  [201, 207, 215]
]

colorPalette = []
colorPaletteIndex = 0
while colorPaletteIndex < 16
  colorPalette.push topRow[colorPaletteIndex]
  colorPalette.push bottomRow[colorPaletteIndex]
  colorPaletteIndex++

  