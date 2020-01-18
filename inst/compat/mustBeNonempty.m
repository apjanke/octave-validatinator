## -*- texinfo -*-
## @deftypefn {Function File} {@code{x} =} mustBeNonempty (@code{x}, @code{label})
##
## Requires that input is nonempty.
##
## Raises an error if the input @code{x} is not empty, as determined by
## @code{! isempty (x)}.
##
## @code{label} is an optional input that determines how the input will be described in
## error messages. If not supplied, @code{inputname (1)} is used, and if that is
## empty, it falls back to "input".
##
## @end deftypefn

function x = mustBeNonempty (x, label)
  if nargin < 2; label = []; endif
  if isempty (x)
    if isempty (label)
      label = inputname (1);
    endif
    if isempty (label)
      label = "input";
    endif
    error ("%s must be nonempty; got a %s empty", ...
      label, size2str (size (x)));
  endif
endfunction
