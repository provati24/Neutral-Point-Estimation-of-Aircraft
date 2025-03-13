
g0=9.8;
W=input("Enter Weight=");
v=input("Enter velocity=");
Cl0=input("Enter Cl0=");
Clalpha=input("Enter Clalpha=");
Cldel=input("Enter Cldel=");
Cmo=input("Enter Cmo=");
Cmdel=input("Enter Cmdel=");
Cmalpha=input("Enter Cmalpha=");
S=input("Enter S=");
h=input("Enter altitude=");

%%altitudecalculation

t0=288.16;
a1= -6.5;
a2= 3;
a3= -4.5;
a4= 4;
R=.287;
r=6378;

h1=0;
h11=11;
h25=25;
h47=47;
h53=53;
h79=79;
h90=90;
h105=105;

p1=101325;
d1=1.225;

t11=t0+a1*11;
p11=p1*(t11/t0)^(-g0/(a1*R));
d11=d1*((t11/t0)^((-g0/(a1*R))-1));

p25=p11*exp((-g0*14)/(R*t11));
d25=d11*(p25/p11);

t47=t11+a2*22;
p47=p25*(t47/t11)^((-g0)/(a2*R));
d47=d25*(t47/t11)^((-g0)/(a2*R)-1);

p53=p47*exp((-g0*6)/(R*t47));
d53=d47*(p53/p47);

t79=t47+a3*26;
p79=p53*(t79/t47)^((-g0)/(a3*R));
d79=d53*(t79/t47)^((-g0)/(a3*R)-1);

p90=p79*exp((-g0*11)/(R*t79));
d90=d79*(p90/p79);

t105=t79+a4*18;
p105=p90*(t105/t47)^((-g0)/(a4*R));
d105=d90*(t105/t47)^((-g0)/(a4*R)-1);
if h==0;
    d2=d1;

elseif 0<h && h<=11
    t= t0+a1*(h-h1);
    d2=d1*(t/t0)^((-g0/(a1*R))-1);

elseif h>11 && h<=25
     t=t11;
  d2=d11*exp((-g0*(h-h11))/(R*t11));

elseif h>25 && h<=47
    t25=t11;
    t= t25+a2*(h-h25);
    
    d2=d25*(t/t25)^((-g0/(a2*R))-1);

elseif h>47 && h<=53
     t=t47;
   d2=d47*exp((-g0*(h-h47))/(R*t47));

 elseif h>53 && h<=79
     t53=t47;
    t= t53+a3*(h-53);
 d2=d53*(t/t53)^((-g0/(a3*R))+1);

elseif h>79 && h<=90
     t=t79;
    d2=d79*exp((-g0*(h-h79))/(R*t79));

elseif h>90 && h<=105
    t90=t79;
    t= t90+a4*(h-h90);
    d2=d90*(t/t90)^((-g0/(a4*R))+1);

end

Cltrim=(2*((W*g0)/S))/(d2*(v^2))
Alphatrim=((Cltrim-Cl0)*Cmdel+(Cldel*Cmo))/((Clalpha*Cmdel)-(Cmalpha*Cldel));
deltrim=-((Cltrim-Cl0)*Cmalpha+(Cmo*Clalpha))/((Clalpha*Cmdel)-(Cmalpha*Cldel));

%disp function
Alphatrim= ['Alphatrim =',num2str(Alphatrim)];
disp (Alphatrim)
deltrim= ['deltrim =',num2str(deltrim)];
disp (deltrim)




