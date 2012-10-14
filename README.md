# Geagle

## Information
If you are working on an [CadSoft EAGLE](http://www.cadsoftusa.com/eagle-pcb-design-software/) project with a team and you are tracking your progress with [Git](http://git-scm.com/), this little programm can help you to see what your team has changed. It makes an diff image which shows the changes on the schematics and boards between the commits.

But first some notes:
* My second ruby program! The code is very ugly ...
* The making of the diff image takes some seconds.

You can test it with the [testrepo](https://github.com/hurik/visual-diffs-for-eagle-and-git_testrepo).

This little programm based on [eagle-converter](https://gitorious.org/gitedaous/eagle-converter) by Patrick Franken, he made the countSheets.ulp file and the eagle calls.


## Example image
![Example image](/hurik/geagle/raw/master/example.png)
* Brightened elements were not changed
* Red elements were deleted
* Green elements are new
* Red and green elements which are connected, can be moved elements


## Program screenshot
![Program screenshot](/hurik/geagle/raw/master/screenshot.png)


## Requirements
**grit**
> gem install grit

**oily_png**
> gem install oily_png

**qtbindings**
> gem install qtbindings

**grit and oily_png gems are native extension:**
* Under windows you need the [Development Kit](https://github.com/oneclick/rubyinstaller/wiki/Development-Kit) to install it.
* Under linux you need the ruby-dev package.

**qtbindings gem needs some packages:**
* Under windows you need nothing (binary gem available).
* Under linux you need the cmake, libqt4-dev and the build-essential (gcc) packages. And the compiling takes some minutes ...


## Usage
1. Open the options tab and set the eagle binary option.
1. Enter the command of you image viewer. Under windows you can let this empty and under ubuntu you can enter shotwell.
1. When you working with one repo a lot, you can set it in the repo preset.
1. Go to the create diff image tab an make a diff image!


## TODO
* A lot!


## Changelog
### v1.0.0
* First release