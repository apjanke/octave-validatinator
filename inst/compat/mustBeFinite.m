## -*- texinfo -*-
## @deftypefn {Function File} {@code{x} =} mustBeFinite (@code{x}, @code{label})
##
## Requires that input is finite.
##
## Raises an error if the input @code{x} is not finite, as determined by
## @code{isfinite (x)}.
##
## @code{label} is an optional input that determines how the input will be described in
## error messages. If not supplied, @code{inputname (1)} is used, and if that is
## empty, it falls back to "input".
##
## @end deftypefn

function x = mustBeFinite (x, label)
  if nargin < 2; label = []; endif
  tf = isfinite (x);
  if ! all (tf)
    if isempty (label)
      label = inputname (1);
    endif
    if isempty (label)
      label = "input";
    endif
    ix_bad = find (!tf);
    error ("%s must be finite; got Infs in %d elements: %s", ...
      label, numel (ix_bad), mat2str (ix_bad));
  endif
endfunction
