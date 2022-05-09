"""
TwoDexample(printlable=true)
Draw Fig 2.1 in the print book.
"""
function TwoDexample(printlabel=true)
x0a=[2.0, .5];
x0b=[3.0, 5.0];
# Allocate some room for the resdiual and Jacobian
FS=zeros(2,);
FPS=zeros(2,2);
nouta=nsol(simple!, x0a, FS, FPS; keepsolhist=true, sham=1);
xa=nouta.solhist[1,:];
ya=nouta.solhist[2,:];
noutb=nsol(simple!, x0b, FS, FPS; keepsolhist=true, sham=1);
xb=noutb.solhist[1,:];
yb=noutb.solhist[2,:];
#
# Some plotting commands you may not want to look at are here.
#
plot(xa,ya,"k-*")
plot(xb,yb,"k-",xb,yb,"ko")
contourch2()
~printlabel || title("Fig 2.1 from print book")
end

"""
contourch2()

Makes contour plot in Chapter 2
"""
function contourch2()
yr=-5:.01:5
xr=0:.01:5
y=range(-5.0, step=.01, stop=5.0)
x=range(0.0, step=.01, stop=5.0)'
z = @. f21(x,y)
la=0:.25:.5;
lc=.6:.4:1;
lb=2:4:50;
levels=[la;lc;lb]
contour(x,y,z,levels;colors=["black"])
xlabel(L"x_1")
ylabel(L"x_2")
end


"""
function norm for contour plot
"""
function f21(x,y)
zx=x*x+y*y-2.0
zy=exp(x-1.0) + y*y - 2.0
z=sqrt(zx*zx+zy*zy)
end
