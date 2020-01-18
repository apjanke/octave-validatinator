## -*- texinfo -*-
## @deftypefn {Function File} {@code{x} =} mustBeInteger (@code{x}, @code{label})
##
## Requires that input is integer-valued (but not necessarily integer-typed).
##
## Raises an error if any element of the input @code{x} is not a finite,
## real, integer-valued numeric value, as determined by various checks.
##
## @code{label} is an optional input that determines how the input will be described in
## error messages. If not supplied, @code{inputname (1)} is used, and if that is
## empty, it falls back to "input".
##
## @end deftypefn

function x = mustBeInteger (x, label)
  if nargin < 2; label = []; endif
  if isinteger (x) || islogical (x)
    return
  endif
  but = [];
  if ! isnumeric (x)
    but = sprintf ("it was non-numeric (got a %s)", class (x));
  elseif any (! isfinite (x))
    but = "there were Inf values";
  elseif ! isreal (x)
    but = "it was complex";
  elseif ! all (floor (x) == x)
    but = "it had fractional values in some elements";
  end
  if ! isempty (but)
    if isempty (label)
      label = inputname (1);
    endif
    if isempty (label)
      label = "input";
    endif
    error ("%s must be integer-valued; but %s", ...
      label, but);
  endif
endfunction
