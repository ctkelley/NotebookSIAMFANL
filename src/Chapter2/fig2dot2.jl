"""
fig2dot2(inbook=false)
Draw Fig 2.2 in the print book.
"""
function fig2dot2(inbook=false)
n=100;
c=.9
FS = ones(n,)
x0 = ones(n,)
hdata = heqinit(x0, c)
FPS = ones(n, n)
nsolout=nsold(heqf!, x0, FS, FPS; rtol=1.e-10, atol=1.e-10, pdata=hdata);
axis([0,1.0,1.0,1.9])
xlabel(L"\mu")
ylabel(L"H(\mu)")
if ~inbook
title("Fig 2.2 from print book")
end
end
