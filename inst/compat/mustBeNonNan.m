## -*- texinfo -*-
## @deftypefn {Function File} {@code{x} =} mustBeNonNan (@code{x}, @code{label})
##
## Requires that input is non-NaN.
##
## Raises an error if any element of the input @code{x} is NaN, as determined by
## @code{isnan(x)}.
##
## @code{label} is an optional input that determines how the input will be described in
## error messages. If not supplied, @code{inputname (1)} is used, and if that is
## empty, it falls back to "input".
##
## @end deftypefn

function x = mustBeNonNan (x, label)
  if nargin < 2; label = []; endif
  tf = ! isnan (x);
  tf = tf(:);
  if ! all (tf)
    if isempty (label)
      label = inputname (1);
    endif
    if isempty (label)
      label = "input";
    endif
    ix_bad = find (!tf);
    errmsg = sprintf ("%s must be non-NaN; got %d elements that were not: indexes %s", ...
      label, numel (ix_bad), mat2str (ix_bad));
    error (errmsg);
  endif
endfunction
