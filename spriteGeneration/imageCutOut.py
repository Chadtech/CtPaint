import PIL
from PIL import Image
import os

sheet = Image.open('toolbar0Sheet.png')
sheetWidth, sheetHeight = sheet.size

numberOfRows = 13

# The sprite sheet toolbar0Sheet.png is cropped and saved
# into 104 icons.

# The name of each icon image is very specific. The numbers
# and letters in the name conveys information about what
# tool, tool magnitude, and tool mode the icon corresponds to
# The appropritate icon is then selected in ctpaint.coffee
# when drawing the tool bars. Below is an example file name
# with an explaination of the naming code.

# u04050.PNG

# 'u'
# If the icon is to be displayed during view mode 0, 
# it begins with the letter 'u'. For view mode 1, 'v'.
# View mode 0 depicts the pictoral icon of the tool, 
# in view  mode 1 an icon of the shortkey of the tool
# is depicted.

# '04'
# The first two digits are the tool. There are 22 tools.
# '04' is the square tool.

# '0'
# 0 in index 3 signifies that the tool is not filled.
# Should the character in index 3 be a 1 the tool is filled
# Should the character in index 3 be a 2 the tool is also filled
# aswell as selected

# '5'
# 5 in index 4 signifies that the tool has a magnitude of
# 5. Index 4 will only be greater than 0 if the tool is selected

# '0'
# Though the magnitude is 5, designated by index 4, index 5
# remains 0. Should this icon reflect that the tool is selected
# this character would be 5.

# '.PNG'
# The PNG file format, written in all caps which keeps in 
# tradition with the file naming schema of MSPaint for windows XP.

#####################################
###   selected icons ('lit up' icons)
#####################################

# The left most block of dark buttons acts as the back drop
# For the buttons.

# The lit up block of buttons to its right is cut up into
# icons to paste over the left most block

# The blocks on the right are to show the square, circle
# line, and point tools at various 'magnitudes' and fill
# states

# First column of lit up icons
for iteration in range(numberOfRows):
  icon = sheet.crop((98,(iteration*25),98+24, 24+(iteration*25)))
  icon.save('v'+str(iteration*2).zfill(2)+'000.PNG','png')

# Second column of lit up icons
for iteration in range(numberOfRows):
  icon = sheet.crop((123,(iteration*25),123+24, 24+(iteration*25)))
  icon.save('v'+str((iteration*2)+1).zfill(2)+'000.PNG','png')

# Third Column of lit up buttons
for iteration in range(numberOfRows):
  icon = sheet.crop((147,(iteration*25),147+24, 24+(iteration*25)))
  icon.save('u'+str(iteration*2).zfill(2)+'000.PNG','png')

# Fourth column of lit up buttons
for iteration in range(numberOfRows):
  icon = sheet.crop((172,(iteration*25),172+24, 24+(iteration*25)))
  icon.save('u'+str((iteration*2)+1).zfill(2)+'000.PNG','png')

#########################################
### unselected icons tools with magnitude
#########################################

# Square tool icon in various magnitudes of thickness
for iteration in range(7):
  icon = sheet.crop((196,(iteration*25),196+24, 24+(iteration*25)))
  icon.save('u'+'0400'+str(iteration)+'.PNG','png')

# Circle tool icon in various magnitudes of thickness
for iteration in range(7):
  icon = sheet.crop((221,(iteration*25),221+24, 24+(iteration*25)))
  icon.save('u'+'0500'+str(iteration)+'.PNG','png')

# Line tool icon in various magnitudes of thickness
for iteration in range(7):
  icon = sheet.crop((245,(iteration*25),245+24, 24+(iteration*25)))
  icon.save('u'+'0600'+str(iteration)+'.PNG','png')

# Point tool icon in various magnitudes of thickness
for iteration in range(7):
  icon = sheet.crop((270,(iteration*25),270+24, 24+(iteration*25)))
  icon.save('u'+'0700'+str(iteration)+'.PNG','png')

# Square tool icon filled
icon = sheet.crop((294, 0, 294+24, 24))
icon.save('u'+'04100.PNG','png')

# Circle tool icon filled
icon = sheet.crop((319,0,319+24, 24))
icon.save('u'+'05100.PNG','png')

#########################################
###   selected icons tools with magnitude
#########################################

# Square tool icon in various magnitudes of thickness
for iteration in range(7):
  icon = sheet.crop((343,(iteration*25),343+24, 24+(iteration*25)))
  icon.save('u'+'040'+str(iteration)+'0.PNG','png')

# Circle tool icon in various magnitudes of thickness
for iteration in range(7):
  icon = sheet.crop((368,(iteration*25),368+24, 24+(iteration*25)))
  icon.save('u'+'050'+str(iteration)+'0.PNG','png')

# Line tool icon in various magnitudes of thickness
for iteration in range(7):
  icon = sheet.crop((392,(iteration*25),392+24, 24+(iteration*25)))
  icon.save('u'+'060'+str(iteration)+'0.PNG','png')

# Point tool icon in various magnitudes of thickness
for iteration in range(7):
  icon = sheet.crop((417,(iteration*25),417+24, 24+(iteration*25)))
  icon.save('u'+'070'+str(iteration)+'0.PNG','png')

# Square tool icon filled
icon = sheet.crop((441, 0, 441+24, 24))
icon.save('u'+'04200.PNG','png')

# Circle tool icon filled
icon = sheet.crop((466,0,466+24, 24))
icon.save('u'+'05200.PNG','png')

#########################################
###     Zoom magnitudes, lit up and plain
#########################################

# iterations are multiplied by 24 because the icons are 
# arranged on the sprite sheet differently.

# Non - lit up
for iteration in range(4):
  icon = sheet.crop((490,(iteration*24),490+24, 24+(iteration*24)))
  icon.save('u'+'0000'+str(iteration)+'.PNG','png')

# lit up
for iteration in range(4):
  icon = sheet.crop((514,(iteration*24),514+24, 24+(iteration*24)))
  icon.save('u'+'000'+str(iteration)+'0.PNG','png')

#############################################
###     Select transparency, lit up and plain
#############################################

icon = sheet.crop((538, 0, 538+24, 24))
icon.save('u'+'01200.PNG','png')

icon = sheet.crop((562, 0, 562+24, 24))
icon.save('u'+'01100.PNG','png')

# Non lit up menu, not cropped into smaller icons, 
# but pasted as a single image on the tool bar
sheet.crop((0,0,49,sheetHeight)).save('toolbar0u.PNG','png')
sheet.crop((49,0,98,sheetHeight)).save('toolbar0v.PNG','png')