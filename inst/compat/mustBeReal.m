## -*- texinfo -*-
## @deftypefn {Function File} {@code{x} =} mustBeReal (@code{x}, @code{label})
##
## Requires that input is finite.
##
## Raises an error if the input @code{x} is not real, as determined by
## @code{isreal (x)}.
##
## @code{label} is an optional input that determines how the input will be described in
## error messages. If not supplied, @code{inputname (1)} is used, and if that is
## empty, it falls back to "input".
##
## @end deftypefn

function x = mustBeReal (x, label)
  if nargin < 2; label = []; endif
  if ! isreal (x)
    if isempty (label)
      label = inputname (1);
    endif
    if isempty (label)
      label = "input";
    endif
    error ("%s must be real; got a complex value", ...
      label);
  endif
endfunction
