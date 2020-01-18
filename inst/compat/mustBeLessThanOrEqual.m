## -*- texinfo -*-
## @deftypefn {Function File} {@code{x} =} mustBeLessThanOrEqual (@code{x}, @code{c}, @code{label})
##
## Requires that input is less than or equal to a given value.
##
## Raises an error if any element of the input @code{x} is not less than or equal to @code{c}, as determined by
## @code{x <= c}.
##
## @code{label} is an optional input that determines how the input will be described in
## error messages. If not supplied, @code{inputname (1)} is used, and if that is
## empty, it falls back to "input".
##
## @end deftypefn

function x = mustBeLessThanOrEqual (x, c, label)
  if nargin < 2; label = []; endif
  tf = x <= c;
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
      errmsg = sprintf ("%s must be less than or equal to %f; got %d elements that were not: values %s", ...
        label, c, numel (ix_bad), mat2str (bad));
    catch err
      errmsg = sprintf ("%s must be less than or equal to %f; got %d elements that were not: indexes %s", ...
        label, c, numel (ix_bad), mat2str (ix_bad));
    end
    error (errmsg);
  endif
endfunction
