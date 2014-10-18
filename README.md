# CtPaint

CtPaint is basically a clone of MSPaint in browser.

Its not near completion, and I have no releases of it yet.

# Navigating this repo

ctpaint.coffee is the file run in the browser via ctpaint.html. gulpfile.js concatenates the many coffeescript files found in the various folders mainAct, postures, and initialization, into ctpaint.coffee

Initilization contains coffeescript files that mainly define functions and global variables. mainAct.coffee mostly handles user mouse and keyboard input. Postures contains tool-specific user input functions. The basic flow of the CtPaint is the mainAct registering an event, then refering to tool-specific functions (postures), which in turn give information to functions used by those tools.

Assets contain the images of the icons, toolbars, and glyphs

deletedScenes contains images of my notes during this project, as well as images of my MSPaint work environment while drawing the assets.

glyphGeneration contains a python file and some png files. The python file recolors the png files to make many of the assets I use.

spriteGeneration contains a python file and a png file. The python file crops sections out of the png file to make all the icons and toolbar images I use.

# Demos

This is a video of me talking about CtPaint's capacity to change colors in the palette: http://youtu.be/U08Llsl9dMk

Here is an image showing off the square tool:
http://i.imgur.com/5SgwLE9.png

Here is an image showing off the color options:
http://i.imgur.com/iRnMbcg.png

Here is an image showing off various tools:
http://i.imgur.com/UR9H3aE.png

# Feature list

Here is an incomplete list of features, with the ones I have finished checked off:

* X Circle tool
* X Circle fill
* X Circle with border
* X Color Palette with changeable colors
* X Copy
* X Paste
* X Cut
* X Fill tool
* X Flip canvas
* X Flip Selected region
* X Horizontal swap of Color Swatches 
* X Vertical swap of Color Swatches
* X Invert colors of canvas
* X Invert colors of selected region
* X Line Draw tool
* X Undo
* X Redo
* X Open File
* X Replace color
* X Replace color of selected area
* X Resize canvas by click and drag
* X Resize canvas by text field
* X Rotate Canvas
* X Rotate selected area
* X Sample color
* X Select area
* X Square draw tool
* X Tool cursor images
* X Zoom
* Secondary color transparency
* X Arrow key scrolling
* X Scale canvas
* X Scale selected area
* Hue, brightness, and saturation buttons.
* X magnitude/mode buttons
* X Select all tool
* X Drag and drop Color palette/swatch changing (tab key)
* View mode when negate key held down (zoom out)

General to dos and bugs to fix:

* X Mouse canvas exit
* X redo resize memory
* X discriminate between pasting and opening outside image (by canvas and image size)
* X Alternate Cursor colors (replace view mode)
* X Data read out on tool (square size etc)
* X Remove toolbar0 information section, and make icons change with new settings
* X Selection cursor update bug
* Optimize selection moving
* X Menu click region ( or cancel option )
* X Make all menu tools cursor pixel compatible
* X Redraw menu images to highlight the 'n' in 'cancel' since 'c' is not an acceptable short key
* X Draw Selection transparent Icon
* X Custom Cursor when not zoomed in
* X Select area cursor pixel update bug (it reads the pixel of the selected area when updating the old location)
* X Sample cursor bug
* X Open Image bug
* X minus / plus (equals) key triggering zoom in and out (bracket keys?)
* X Tweak zoom button
* X compatibility between all draw informations and cursor pixel
* X Add another 16 Colors
* X When I paste an image, during circle draw, the tool actually is select, though the toolbar still indicates circle ( FIXED THIS BUG )
* X Make Sample automatically go to point tool, not previous
* X zoom into mouse location, not center
* X after replace selection selection box expands


------- LICENSING

ChadTech License (Ct)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software without restriction, including without limitation the rights to use, copy, modify, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is purnished to do so, subject to the following condition:

Involved projects, firms, and persons that utilitze this software be renamed 'Chadtech'