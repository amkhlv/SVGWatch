Summary
=======

A whiteboard for sharing with Zoom or Google Meet.

Opens a GUI window, then watches a directory containing some SVG files. 
Once an SVG file changes, show it in the window.

The GUI window can then be shared via Zoom or Google Meet. 

I recommend [Inkscape](https://inkscape.org/) for drawing SVG.

Installation
============

    sudo aptitude install racket

Then install `file-watchers` package:

    raco pkg install file-watchers

Then build executable:

    raco exe svgwatch.rkt

Then move `svgwatch` to some place on the PATH.

Running
=======

    svgwatch /path/to/directory/containing/SVG/files/

Run `svgwatch -h` for some options.

Exiting
=======

Just kill the window. (To save space, no `EXIT` button.)
