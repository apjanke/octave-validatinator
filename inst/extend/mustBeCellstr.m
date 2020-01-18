## -*- texinfo -*-
## @deftypefn {Function File} {@code{x} =} mustBeCellstr (@code{x}, @code{label})
##
## Requires that input is a cellstr.
##
## Raises an error if the input @code{x} is not a cellstr (a cell array
## of @code{char} arrays.
##
## TODO: Decide whether to require the contained char arrays be rowvec/empty.
##
## @code{label} is an optional input that determines how the input will be described in
## error messages. If not supplied, @code{inputname (1)} is used, and if that is
## empty, it falls back to "input".
##
## @end deftypefn

function mustBeCellstr (x, label)
  if nargin < 2; label = []; endif
  if ! iscellstr (x)
    if isempty (label)
      label = inputname (1);
    endif
    if isempty (label)
      label = "input";
    endif
    if iscell (x)
      el_classes = cellfun (@(e) {class (e)}, x);
      type_descr = sprintf ("cell array containing %s", strjoin (el_classes, ", "));
    else
      type_descr = class (x);
    endif
    error ("%s must be a cellstr; got a %s", ...
      label, type_descr);
  endif
endfunction
