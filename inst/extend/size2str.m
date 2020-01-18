## -*- texinfo -*-
## @deftypefn {Function File} {@code{out} =} size2str (@code{sz})
##
## Format an array size for display.
##
## sz is an array of dimension sizes, in the format returned by @code{size}.
##
## Returns a char row vector.
##
## @end deftypefn

function out = size2str (sz)
  strs = cell (size (sz));
  for i = 1:numel (sz)
    strs{i} = sprintf ('%d', sz(i));
  endfor
  out = strjoin (strs, '-by-');
endfunction
