[![Build Status](https://secure.travis-ci.org/rolandwalker/dynamic-fonts.png)](http://travis-ci.org/rolandwalker/dynamic-fonts)

Overview
========

Set Emacs faces based on available fonts.

Quickstart
----------

	(require 'dynamic-fonts)

	(dynamic-fonts-setup)     ; finds "best" fonts and sets faces:
	                          ; default, fixed-pitch, variable-pitch


dynamic-fonts
-------------

Dynamic-fonts.el makes font configuration more portable between
machines.  When Emacs is starting up, dynamic-fonts chooses fonts
for your basic faces based on which fonts are actually available
on your system.

You may set a list of fonts in order of preference using customize.

See Also
--------

M-x customize-group RET dynamic-fonts RET
M-x customize-group RET font-utils RET

Compatibility and Requirements
------------------------------

Tested on GNU Emacs versions 23.3 and 24.1

Requires [font-utils.el](http://github.com/rolandwalker/font-utils)
