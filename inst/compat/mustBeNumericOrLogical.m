## -*- texinfo -*-
## @deftypefn {Function File} {@code{x} =} mustBeNumericOrLogical (@code{x}, @code{label})
##
## Requires that input is numeric or logical.
##
## Raises an error if the input @code{x} is not numeric or logical, as determined by
## @code{isnumeric (x) || islogical (x)}.
##
## @code{label} is an optional input that determines how the input will be described in
## error messages. If not supplied, @code{inputname (1)} is used, and if that is
## empty, it falls back to "input".
##
## @end deftypefn

function x = mustBeNumericOrLogical (x, label)
  if nargin < 2; label = []; endif
  if ! (isnumeric (x) || islogical (x))
    if isempty (label)
      label = inputname (1);
    endif
    if isempty (label)
      label = "input";
    endif
    error ("%s must be numeric or logical; got a %s", ...
      label, class (x));
  endif
endfunction
