[![Build Status](https://secure.travis-ci.org/rolandwalker/dynamic-fonts.png?branch=master)](http://travis-ci.org/rolandwalker/dynamic-fonts)

# Overview

Set Emacs faces based on available fonts.

## Quickstart

```elisp
(require 'dynamic-fonts)
 
(dynamic-fonts-setup)     ; finds "best" fonts and sets faces:
                          ; default, fixed-pitch, variable-pitch
```

## Explanation

Dynamic-fonts.el makes font configuration more portable between
machines.  When Emacs is starting up, dynamic-fonts chooses fonts
for your basic faces based on which fonts are actually available
on your system.

You may set a list of fonts in order of preference using customize.

## See Also

* <kbd>M-x</kbd> <kbd>customize-group</kbd> <kbd>RET</kbd> <kbd>dynamic-fonts</kbd> <kbd>RET</kbd>
* <kbd>M-x</kbd> <kbd>customize-group</kbd> <kbd>RET</kbd> <kbd>font-utils</kbd> <kbd>RET</kbd>

## Compatibility and Requirements

	GNU Emacs version 24.4-devel     : yes, at the time of writing
	GNU Emacs version 24.3           : yes
	GNU Emacs version 23.3           : yes
	GNU Emacs version 22.3 and lower : no

Requires [font-utils.el](http://github.com/rolandwalker/font-utils)
