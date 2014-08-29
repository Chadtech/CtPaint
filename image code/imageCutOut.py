import PIL
from PIL import Image
import os

sheet = Image.open('toolbar0Sheet.png')
sheetWidth, sheetHeight = sheet.size

for iteration in range(11):
  sheet.crop((98,(iteration*25),98+24, 24+(iteration*25))).save('v'+str(iteration*2).zfill(2)+'.PNG','png')

for iteration in range(11):
  sheet.crop((123,(iteration*25),123+24, 24+(iteration*25))).save('v'+str((iteration*2)+1).zfill(2)+'.PNG','png')

for iteration in range(11):
  sheet.crop((147,(iteration*25),147+24, 24+(iteration*25))).save('u'+str(iteration*2).zfill(2)+'.PNG','png')

for iteration in range(11):
  sheet.crop((172,(iteration*25),172+24, 24+(iteration*25))).save('u'+str((iteration*2)+1).zfill(2)+'.PNG','png')

sheet.crop((0,0,49,sheetHeight)).save('toolbar0u.PNG','png')
sheet.crop((49,0,98,sheetHeight)).save('toolbar0v.PNG','png')