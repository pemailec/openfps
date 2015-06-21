#### NOTE: OpenFPS is alive, however we don't have a working demo. Keep track of this project, you can expect a demo soon - the Developers (11/20/13) ####

# Introduction #

OpenFPS is an open source project to develop a game engine designed for first person shooters. The project is being coded in DarkBASIC Pro, with plugins written in C++ and scripting using Lua. Our goal is to create a complete engine with the following features:
  * WYSIWYG editor
  * Extensive scripting possibilities using Lua
  * 3d Engine with capability for pixel and vertex shaders.
  * Terrain engine with shader capabilities.
  * First person movement with physics, weapons, etc.
  * Physics engine with capability for meshes, ragdolls, and vehicles.
  * Multiplayer engine code integrated with the local engine.
  * A fun experience to play!
As a second part of the project, we are developing a game with the engine. The game being developed alongside the engine will include multiplayer gameplay as well as a (hopefully) fun campaign mode. When finished, the project will include a whole bunch of features. Since the code is open source, it is released for free on this page so that anyone can download, play, modify, or contribute! If you have an idea, don't hesitate to join. If you're not a coder, you can still download the engine and give it a try. Hey, if you've read this far you must be a little interested!

## How to join ##

If you feel like you can contribute, shoot me an email at biostormgame (at) gmail.com. the information below may be outdated.

# Procedure #

## Getting Started ##
  1. Download TortoiseSVN from http://tortoisesvn.net/downloads.
  1. Right-click on your desktop.  Find the "SVN Checkout" option.  Click it.
  1. Paste the "URL of repository" (https://openfps.googlecode.com/svn/trunk/openfps) and type the folder where you want the project to go.  Press OK.
  1. Enter the username and password for OpenFPS.
  1. The files will be downloaded to the selected location.

## Workflow ##
  1. Before editting, download the most recent code with "SVN Update".
  1. Make desired changes.
  1. PLEASE delete the executable and any source temporary files, or simply uncheck them in the Commit dialogue, before Committing changes.
  1. Right-click in the project folder and click "SVN Commit".  Check the boxes next to the files you want to save your changes to.  Click OK.

# Dependancies #

OpenFPS is written in DarkBASIC Professional.  The current version requires [Sparky's collision](http://forum.thegamecreators.com/?m=forum_view&t=74762&b=5), [Advanced Sprites](http://forum.thegamecreators.com/?m=forum_view&t=113378&b=5), and [BlitzTerrain 2.0](http://forum.thegamecreators.com/?m=forum_view&t=145404&b=8).  The physics demo currently included requires the latest DirectX redistributables.

This product includes IP2Location LITE data available from <a href='http://www.ip2location.com'><a href='http://www.ip2location.com'>http://www.ip2location.com</a></a>.

![http://openfps.googlecode.com/svn/trunk/Resources/OpenFPS%20Images/gpl-logo.png](http://openfps.googlecode.com/svn/trunk/Resources/OpenFPS%20Images/gpl-logo.png)