import PIL
from PIL import Image
import os

sheet = Image.open('toolbar0Sheet.png')
sheetWidth, sheetHeight = sheet.size

numberOfRows = 11

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

for iteration in range(7):
  icon = sheet.crop((196,(iteration*25),196+24, 24+(iteration*25)))
  icon.save('u'+'0400'+str(iteration)+'.PNG','png')

for iteration in range(7):
  icon = sheet.crop((221,(iteration*25),221+24, 24+(iteration*25)))
  icon.save('u'+'0500'+str(iteration)+'.PNG','png')

for iteration in range(7):
  icon = sheet.crop((245,(iteration*25),245+24, 24+(iteration*25)))
  icon.save('u'+'0600'+str(iteration)+'.PNG','png')

for iteration in range(7):
  icon = sheet.crop((270,(iteration*25),270+24, 24+(iteration*25)))
  icon.save('u'+'0700'+str(iteration)+'.PNG','png')

icon = sheet.crop((294, 0, 294+24, 24))
icon.save('u'+'04100.PNG','png')

icon = sheet.crop((319,0,319+24, 24))
icon.save('u'+'05100.PNG','png')

for iteration in range(7):
  icon = sheet.crop((343,(iteration*25),343+24, 24+(iteration*25)))
  icon.save('u'+'040'+str(iteration)+'0.PNG','png')

for iteration in range(7):
  icon = sheet.crop((368,(iteration*25),368+24, 24+(iteration*25)))
  icon.save('u'+'050'+str(iteration)+'0.PNG','png')

for iteration in range(7):
  icon = sheet.crop((392,(iteration*25),392+24, 24+(iteration*25)))
  icon.save('u'+'060'+str(iteration)+'0.PNG','png')

for iteration in range(7):
  icon = sheet.crop((417,(iteration*25),417+24, 24+(iteration*25)))
  icon.save('u'+'070'+str(iteration)+'0.PNG','png')

icon = sheet.crop((441, 0, 441+24, 24))
icon.save('u'+'04200.PNG','png')

icon = sheet.crop((466,0,466+24, 24))
icon.save('u'+'05200.PNG','png')

sheet.crop((0,0,49,sheetHeight)).save('toolbar0u.PNG','png')
sheet.crop((49,0,98,sheetHeight)).save('toolbar0v.PNG','png')