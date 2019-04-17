function [f ] = fun1( r,w )

syms n;
f=r.^n.*(cos(w.*n)+sin(w.*n).*1j);

end

