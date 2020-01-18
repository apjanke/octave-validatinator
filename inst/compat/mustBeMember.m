## -*- texinfo -*-
## @deftypefn {Function File} {@code{x} =} mustBeMember (@code{x}, @code{valid}, @code{label})
##
## Requires that input is a member of a set of given valid values.
##
## Raises an error if any element of the input @code{x} is not a member 
## of @code{valid}, as determined by @code{ismember (x)}.
##
## Note that char inputs may behave weirdly, because of the interaction between
## chars and cellstrs when calling ismember() on them. But it will probably
## "do what you mean" if you just use it naturally.
##
## @code{label} is an optional input that determines how the input will be described in
## error messages. If not supplied, @code{inputname (1)} is used, and if that is
## empty, it falls back to "input".
##
## @end deftypefn

function x = mustBeMember (x, valid, label)
  if nargin < 2; label = []; endif
  tf = ismember (x, valid);
  if ! all (tf)
    if isempty (label)
      label = inputname (1);
    endif
    if isempty (label)
      label = "input";
    endif
    n_bad = numel (find (! tf));
    # TODO: Fancy inclusion of bad & valid values in the error message.
    # Probably need dispstrs() for that.
    error ("%s must be one of the specified valid values; got %d elements that weren't", ...
      label, n_bad);
  endif
endfunction
