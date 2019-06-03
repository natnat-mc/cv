# How To
This website can be easily tinkered with, by editing configuration files and/or assets.

## Creating your own text
The textual content of the website is found in `content`. There is a JSON file for each page.  
The `403.json` and `404.json` are used to render the 403 and 404 error pages, respectively. The `index.json` is more interesting, as it is where the main content is found.

- The `owner` section contains personal information, which will be made available in the OpenGraph.
- The `mainCard` section contains the text that is shown on the front page
	- there can be any number of `items`, but it is best to limit it between 4 and 6
	- you can customize the `readMoreText`
	- there can be any number of `links`, which should have a corresponding asset file
- The `content` section contains the content that is shown when the user clicks the `read more...` link
	- each `section` has a `name` and `items`
	- an `item` can be either a string without HTML or an object which can have a `year` (either a number or a string), a `name`, an `info` and an optional `url`
	- you can create any number of `section`, but it is best to limit it between 3 and 5
- The `credits` section gives credit to the people who worked on the background image, the avatar and the code
	- each section has an `artist` or `author`, and can have a `url` and/or a `character`
	- you can create any number of `sections`, but it is best to limit it between 3 and 5
	- linking to the code is **required**, since this project is released under the AGPL

## Your very own color scheme
The color scheme can be found under `less/variables.less`.

The most basic changes would be to edit the values of `text`, `shadow`, `black`, `white` and `accent`. This should work if you are using a light palette.

For more advanced tinkering, or for a dark palette, you can edit all the values in this file directly.

## Your own assets
The assets are located in `assets` and referenced in the `Makefile`.

You must provide an `avatar.png` (at least 128x) and a `bg.jpg` (at least 1920x).
The remaining files correspond to the names of the links on the main card (with all non-alphanumeric characters replaced with underscores, and lowercase as `.png` files, at least 64x).

You must also update the `Makefile` to match your assets under the section `object list`. The files are listed without extension but must match the required extension.

## Building the website
Now that you have everything in place, you are ready to build the website.
For this, you will need `nodejs`, `make` and `convert` (from `imagemagick`) installed and in your `PATH`.

The first time you'll build the website, you will need to install the dependencies with `npm i`.  
Once you have the dependencies installed, simply build the website with `make` while in the root of the repo. This will create the `out` directory containing the built website.

## Deploying the website
Once you have build the website, you can simply push the `out` directory as the root of your web server and make the error pages `403.html` and `404.html`.

It is also possible to clone your fork on your web server and `git pull && make` when you push to `master`.
