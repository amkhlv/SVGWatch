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

Using BystroTeX to prefabricate formulas
----------------------------------------

When giving a talk, it is useful to have prefab formulas. 
Since our format is `SVG`, we need `SVG` formulas.
They can be prepared by [BystroTeX](http://andreimikhailov.com/slides/bystroTeX/slides-manual/index.html).
Prepare a ``skeleton'' BystroTeX slide containing main formulas of the talk.
Then, in Firefox, right click on the formula, "Copy Image" and then paste in Inkscape.


Inkscape hints
--------------

I prefer, for drawing formulas, the calligraphic tool (keyboard shortcut `c`).
I find it __crucial to use zoom-in of Inkscape__ ; when drawing a formula I typically set zoom
to about 300% . You can zoom to a region by marking rectangle with pressed `Shift` and
lower button of e-pen, together. Just pressing lower button of e-pen moves the whiteboard.
Of course, your audience does not see that you zoom. __This is the main advantage over sharing the Inkscape window directly.__
On the other hand, when zoomed-out, the drawn lines become thicker. If you need to highlight
a formula, just zoom out and then draw a red circle around it. 

## Setting SVG size

[Setting image size](inkscape_set-image-size.png?raw=true)

## Zooms

    1	zoom 1:1
    2	zoom 1:2
    3	zoom to selection
    4	zoom to drawing
    5	zoom to page

Zoom history:

    `	(back quote) previous zoom
    Shift+`	next zoom

(it is stacked!)

## Tools

### Calligraphy

can be choosen by pressing `c`

## Colors

### Color bar

Cross  at the left end of the __color bar__ means "make invisible"

Click on a color to set fill, `shift`-click to set stroke

## Complete list of keyboard shortcuts

Can be found [here](http://www-mdp.eng.cam.ac.uk/web/CD/deskapps/inkscape/keyshortcuts.html)
