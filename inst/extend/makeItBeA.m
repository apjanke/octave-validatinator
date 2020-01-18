## -*- texinfo -*-
## @deftypefn {Function File} {@code{out} = } makeItBeA (@code{x}, @code{type})
##
## Converts input to given type if it is not one already.
##
## Ensures that the input @code{x} is of the given type @code{type}. If it is 
## not already that type (as indicated by @code{isa (x, type)}), it is converted
## by calling the one-argument constructor or conversion function for @code{type}.
## (The conversion function is assumed to be the global function with that
## exact name. Callers are responsible for making good choices with @code{type}
## here.)
##
## @end deftypefn

function x = makeItBeA (x, type)
  if ! isa (x, type)
    x = feval (type, x);
  endif
endfunction