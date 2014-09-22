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
colorMenuImage.src = 'assets\\t00.png'

###
  defined as an index number once a color has been shift clicked
###
spotInColorPallete = undefined

###
  The color pallete. Even numbered pallete elements are on the top row,
  odds on the bottom row. That aside the colors ascend from left to right

  The colors were largely ripped out of the youtube video of Tom Sach's
  video 'colors'. Some minor adjustments.
###
colorPallete = [
  [ 0, 0, 0 ] 
  [ 64, 64, 64 ] 
  [ 128, 128, 128 ] 
  [ 192, 192, 192 ] 
  [ 255, 255, 255 ] 
  [ 50, 54, 128 ] 
  [ 85, 96, 45 ] 
  [ 0, 47, 167 ] 
  [ 221, 201, 142 ] 
  [ 10, 186, 181 ] 
  [ 243, 211, 27 ] 
  [ 159, 170, 210 ]
  [ 255, 91, 49 ] 
  [ 157, 212, 147 ] 
  [ 212, 51, 29 ] 
  [ 10, 202, 26 ] 
]
