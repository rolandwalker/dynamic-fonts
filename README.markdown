Overview
========
Set Emacs faces based on available fonts.

dynamic-fonts
-------------
Dynamic-fonts.el makes font configuration more portable between
machines.  When Emacs is starting up, dynamic-fonts chooses fonts
for your basic faces based on which fonts are actually available.

You may set a list of fonts in order of preference using customize.

To use dynamic-fonts, place the dynamic-fonts.el file somewhere
Emacs can find it, and add the following to your ~/.emacs file:

	(require 'dynamic-fonts)
	(dynamic-fonts-setup)

See Also
--------
M-x customize-group RET dynamic-fonts RET

Notes
-----
The secondary purpose of this library is to provide some font
utility functions to be called from Lisp.  See in particular
`dynamic-fonts-font-exists-p`, which tests font availability.

Compatibility and Requirements
------------------------------

Tested on GNU Emacs versions 23.3 and 24.1

Requires [persistent-soft.el](http://github.com/rolandwalker/persistent-soft)

Uses if present: [memoize.el](http://github.com/skeeto/emacs-memoize)
