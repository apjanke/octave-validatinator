## -*- texinfo -*-
## @deftypefn {Function File} {[@code{a}, @code{b}] =} mustBeSameSize (@code{a}, @code{b}, @code{labelA}, @code{labelB})
##
## Requires that the inputs are the same size.
##
## Raises an error if the inputs @code{a} and @code{b} are not the same size,
## as determined by @code{isequal (size (a), size (b))}.
##
## @code{labelA} and @code{labelB} are optional inputs that determine how 
## the input will be described in error messages. If not supplied, 
## @code{inputname (...)} is used, and if that is empty, it falls back to 
## "input 1" and "input 2".
##
## @end deftypefn

function [a, b] = mustBeSameSize (a, b, labelA, labelB)
  if nargin < 3; labelA = []; endif
  if nargin < 4; labelB = []; endif
  if ! isequal (size (a), size (b))
    if isempty (labelA)
      label = inputname (1);
    endif
    if isempty (labelA)
      label = "input 1";
    endif
    if isempty (labelB)
      label = inputname (2);
    endif
    if isempty (labelB)
      label = "input 2";
    endif
    error ("%s and %s must be the same size; got %s and %s", ...
      labelA, labelB, size2str (size (a)), size2str (size (b)));
  endif
endfunction
