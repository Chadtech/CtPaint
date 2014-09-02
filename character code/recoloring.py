import os
import PIL
from PIL import Image

for characterImage in os.listdir(os.getcwd()):
  if characterImage[len(characterImage)-4:len(characterImage)] == '.PNG' and characterImage[0]=='w':
    thisCharacterImage = Image.open(characterImage)
    width, height = thisCharacterImage.size
    for xSpot in range(width):
      for ySpot in range(height):
        if thisCharacterImage.getpixel((xSpot,ySpot)) == (0,0,0):
          thisCharacterImage.putpixel((xSpot,ySpot),(32,32,32))
        elif thisCharacterImage.getpixel((xSpot,ySpot)) == (192,192,192):
          thisCharacterImage.putpixel((xSpot,ySpot),(96,96,96))
    thisCharacterImage.save('m'+characterImage[1:len(characterImage)-4]+'.PNG')

for characterImage in os.listdir(os.getcwd()):
  if characterImage[len(characterImage)-4:len(characterImage)] == '.PNG' and characterImage[0]=='w':
    thisCharacterImage = Image.open(characterImage)
    width, height = thisCharacterImage.size
    for xSpot in range(width):
      for ySpot in range(height):
        if thisCharacterImage.getpixel((xSpot,ySpot)) == (0,0,0):
          thisCharacterImage.putpixel((xSpot,ySpot),(32,32,32))
        elif thisCharacterImage.getpixel((xSpot,ySpot)) == (192,192,192):
          thisCharacterImage.putpixel((xSpot,ySpot),(128,128,128))
    thisCharacterImage.save('n'+characterImage[1:len(characterImage)-4]+'.PNG')

for characterImage in os.listdir(os.getcwd()):
  if characterImage[len(characterImage)-4:len(characterImage)] == '.PNG' and characterImage[0]=='w':
    thisCharacterImage = Image.open(characterImage)
    width, height = thisCharacterImage.size
    for xSpot in range(width):
      for ySpot in range(height):
        if thisCharacterImage.getpixel((xSpot,ySpot)) == (0,0,0):
          thisCharacterImage.putpixel((xSpot,ySpot),(64,64,64))
    thisCharacterImage.save('o'+characterImage[1:len(characterImage)-4]+'.PNG')