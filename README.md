# My personal website
This repo hosts my personal website, visible on [codinget.me](https://codinget.me).  
It is meant to be editable easily by changing a few variables, images and JSON files.

## Layout
- Front page
	- card
	- name
	- title
	- programming languages
	- social / professional links
- read more
	- who am I
	- projects
- credits
	- background image
	- profile image
	- repo

## How To
- Content  
  All the textual content is stored in JSON files in the `content` folder.
- Images  
  All the images are stored in the `assets` folder. They are automatically scaled at build time.
- Styles  
  The stylesheets are stored in the `less` folder, and are written in the [`less` language](http://lesscss.org).
- Building  
  To build the website, first install the dependencies with `npm i`, then simply run `make`. You need to have `imagemagick` installed and in your path.

## Usage and modification
This repo is under the AGPL V3 Licence, which means that you can edit this and redistribute it, but you must publish your sources.
