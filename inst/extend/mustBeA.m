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
