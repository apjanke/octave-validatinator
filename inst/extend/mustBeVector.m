## -*- texinfo -*-
## @deftypefn {Function File} {@code{x} =} mustBeVector (@code{x}, @code{label})
##
## Requires that input is a vector or empty.
##
## Raises an error if the input @code{x} is not a vector and is not 0-by-0 empty.
##
## @code{label} is an optional input that determines how the input will be described in
## error messages. If not supplied, @code{inputname (1)} is used, and if that is
## empty, it falls back to "input".
##
## @end deftypefn

function mustBeVector (x, label)
  if nargin < 2; label = []; endif
  if ! (isvector (x) || isequal (size (x), [0 0]))
    if isempty (label)
      label = inputname (1);
    endif
    if isempty (label)
      label = "input";
    endif
    error ("%s must be a vector; got a %s", ...
      label, size2str (size (x)));
  endif
endfunction
