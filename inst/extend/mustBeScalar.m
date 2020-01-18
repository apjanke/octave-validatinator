## -*- texinfo -*-
## @deftypefn {Function File} {@code{x} =} mustBeScalar (@code{x}, @code{label})
##
## Requires that input is scalar.
##
## Raises an error if the input @code{x} is not scalar, as determined by
## @code{isscalar (x)}.
##
## @code{label} is an optional input that determines how the input will be described in
## error messages. If not supplied, @code{inputname (1)} is used, and if that is
## empty, it falls back to "input".
##
## @end deftypefn

function x = mustBeScalar (x, label)
  if nargin < 2; label = []; endif
  if ! isscalar (x)
    if isempty (label)
      label = inputname (1);
    endif
    if isempty (label)
      label = "input";
    endif
    error ("%s must be scalar; got a %s", ...
      label, size2str (size (x)));
  endif
endfunction
