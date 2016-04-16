# LC-Visuals

Version 1.1.0 - This library provides realtime generated blinky JS visuals originally for the Lost Children live show in late ~ 2014.  Low tech!  Open this file in your browser and have a seizure.

## Keyboard Controls

### Colors

* `Q` - random solid color red, blue, or green
*	`E` - rainbow

### Screen Behaviors

* `Z` clear - clears the screen
* `X` - 1x1
* `C` - 2x1
* `S` - 2x2
* `B` - 1 x random 10 to 200 height
* `V`	- random width 10 to 200 x 1
* `R` - 1 x random 4 to 20 and go to `hcycler` mode
* `T` - random 4 to 20 x 1 and go to `vcycler` mode

### Framerates

 * `ONE` - 1000 / 200 ms
 * `TWO` 1000 / 100 ms
 * `THREE` - 1000 / 50 ms
 * `FOUR` - 1000 / 30 ms
 * `FIVE` - 1000 / 15 ms
 * `SIX` - 125ms
 * `SEVEN` - 250ms
 * `EIGHT` - 500ms
 * `NINE` - 1000ms
* `ENTER` - toggle fullscreen

## Questions

Why isn't this an AMD or split into separate source files or something more useful?  Why is this just  a single stupid HTML file with inline javascript and CSS?  

The reason for working that way in this case was to be able to serve client-side JS and run it without browser complaints, by opening a single HTML file on a laptop.  The use case was feeding colors to a projector in a very haphazard way, so it needed to be simple.

## License

Released under the [MIT License](LICENSE.md).
