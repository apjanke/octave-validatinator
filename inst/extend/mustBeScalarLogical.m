## -*- texinfo -*-
## @deftypefn {Function File} {@code{x} =} mustBeScalarLogical (@code{x}, @code{label})
##
## Requires that input is a scalar logical.
##
## Raises an error if the input @code{x} is not scalar, as determined by
## @code{isscalar (x) && islogical (x)}.
##
## @code{label} is an optional input that determines how the input will be described in
## error messages. If not supplied, @code{inputname (1)} is used, and if that is
## empty, it falls back to "input".
##
## @end deftypefn

function x = mustBeScalarLogical (x, label)
  if nargin < 2; label = []; endif
  if ! (isscalar (x) && islogical (x))
    if isempty (label)
      label = inputname (1);
    endif
    if isempty (label)
      label = "input";
    endif
    error ("%s must be a scalar logical; got a %s %s", ...
      label, size2str (size (x), class (x));
  endif
endfunction
