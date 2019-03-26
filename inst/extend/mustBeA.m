## Copyright (C) 2019 Andrew Janke
##
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {Function File} {@code{x} =} mustBeA (@code{x}, @code{type}, @code{label})
##
## Requires that input is of a given type.
##
## Raises an error if the input @code{x} is not of the specified @code{type}
## or a subclass, as determined by @code{isa (x, type)}.
##
## @code{label} is an optional input that determines how the input will be described in
## error messages. If not supplied, @code{inputname (1)} is used, and if that is
## empty, it falls back to "input".
##
## @end deftypefn

function mustBeA (x, type, label)
  if nargin < 3; label = []; endif
  if ! isa (x, type)
    if isempty (label)
      label = inputlabel (1);
    endif
    if isempty (label)
      label = "input";
    endif
    error ("%s must be of type %s; got a %s", ...
      label, type, class (x));
  endif
endfunction
