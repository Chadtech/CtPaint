###
 keysToKeyCodes correlates the keycode of a key, with the keys name.
 That way I can just type in the name of the key to get the key code.
###
keysToKeyCodes = 
  'backspace':8
  'tab':9
  'enter':13
  'shift':16
  'ctrl':17
  'alt':18
  'caps lock':20
  'escape':27
  'space':32
  'left':37
  'up':38
  'right':39
  'down':40
  'delete':46
  '0':48
  '1':49
  '2':50
  '3':51
  '4':52
  '5':53
  '6':54
  '7':55
  '8':56
  '9':57
  'a':65
  'b':66
  'c':67
  'd':68
  'e':69
  'f':70
  'g':71
  'h':72
  'i':73
  'j':74
  'k':75
  'l':76
  'm':77
  'n':78
  'o':79
  'p':80
  'q':81
  'r':82
  's':83
  't':84
  'u':85
  'v':86
  'w':87
  'x':88
  'y':89
  'z':90
  'left command':91
  'right command':93
  'numpad0':96
  'numpad1':97
  'numpad2':98
  'numpad3':99
  'numpad4':100
  'numpad5':101
  'numpad6':102
  'numpad7':103
  'numpad8':104
  'numpad9':105
  'f1':112
  'f2':113
  'f3':114
  'f4':115
  'f5':116
  'f6':117
  'f7':118
  'f8':119
  'f9':120
  'f10':121
  'f11':122
  'f12':123
  'semicolon':186
  'equals':187
  'comma':188
  'minus':189
  'period':190
  'forward slash':191
  'tilda':192
  'left bracket':219
  'back slash':220
  'right bracket':221
  'single quote':222

###
  In this section, I declare an object to connect each character as a string, to 
  an array of images of that character. These images can be drawn onto the canvas.

  (A)
  The letters 'm', 'n', and 'o', are arbitrary codes assigned to three different
  colorations of each character. The files of the images themselves are designated
  with the code. One they are organized into the stringsToGlyph object, they are
  referenced by index of the array element of stringsToGlyph. m is of a dark character
  on a dark background. n is a medium coloration, where the chracter is adequately
  bright. o has a brighter background, and a brighter character, for when a letter
  must be highlighted.
###
stringOfCharacters = 
  'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ `.,;:'+"'"+'"?!0123456789@#$%^&*(){}[]=-'
stringsToGlyphs = {}
stringOfCharactersIndex = 0
# (A)
varietyCodes = [ 'm', 'n', 'o' ]
while stringOfCharactersIndex < stringOfCharacters.length
  stringsToGlyphs[stringOfCharacters[stringOfCharactersIndex]] = [ 
    new Image()
    new Image()
    new Image()]
  imageVariety = 0
  while imageVariety < 3
    asset = 'assets/' + varietyCodes[imageVariety]+zeroPadder(stringOfCharactersIndex,4)+'.PNG'
    stringsToGlyphs[stringOfCharacters[stringOfCharactersIndex]][imageVariety].src = asset
    imageVariety++
  stringOfCharactersIndex++

###
  This function draws the letters onto the canvas.
###
drawStringAsCommandPrompt = (canvas, stringToDraw, coloration, whereAtX, whereAtY) ->
  stringIndex = 0
  while stringIndex < stringToDraw.length
    glyph = stringsToGlyphs[stringToDraw[stringIndex]][coloration]
    canvas.drawImage(glyph, whereAtX + (12 * stringIndex), whereAtY)
    stringIndex++

