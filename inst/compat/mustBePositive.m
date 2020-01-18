## -*- texinfo -*-
## @deftypefn {Function File} {@code{x} =} mustBePositive (@code{x}, @code{label})
##
## Requires that input is positive.
##
## Raises an error if any element of the input @code{x} is not positive, as determined by
## @code{x > 0}.
##
## @code{label} is an optional input that determines how the input will be described in
## error messages. If not supplied, @code{inputname (1)} is used, and if that is
## empty, it falls back to "input".
##
## @end deftypefn

function x = mustBePositive (x, label)
  if nargin < 2; label = []; endif
  tf = x > 0;
  tf = tf(:);
  if ! all (tf)
    if isempty (label)
      label = inputname (1);
    endif
    if isempty (label)
      label = "input";
    endif
    ix_bad = find (!tf);
    try
      bad = x(ix_bad);
      errmsg = sprintf ("%s must be positive; got %d elements that were not: values %s", ...
        label, numel (ix_bad), mat2str (bad));
    catch err
      errmsg = sprintf ("%s must be positive; got %d elements that were not: indexes %s", ...
        label, numel (ix_bad), mat2str (ix_bad));
    end
    error (errmsg);
  endif
endfunction
