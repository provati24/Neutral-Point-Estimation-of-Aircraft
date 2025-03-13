Cltrim1=[0.5619 0.4643 0.3902 0.3324 0.2866];
deltrim1=[0.0348 0.0439 0.0509 0.0563 0.0606];
A= polyfit(Cltrim1,deltrim1,1);
Slope1=A(1);

Cltrim2=[0.5619 0.4643 0.3902 0.3324 0.2866];
deltrim2=[0.01674 0.0290 0.0383 0.0456 0.0513];
B= polyfit(Cltrim2,deltrim2,1);
Slope2=B(1);

Cltrim3=[0.5619 0.4643 0.3902 0.3324 0.2866];
deltrim3=[-0.0013 0.0140 0.0258 0.0349 0.0421];
C= polyfit(Cltrim3,deltrim3,1);
Slope3=C(1);

Cltrim4=[0.5619 0.4643 0.3902 0.3324 0.2866];
deltrim4=[-0.0194 -0.0008 0.0132 0.0242 0.0329];
D= polyfit(Cltrim4,deltrim4,1);
Slope4=D(1);

slope=[Slope1 Slope2 Slope3 Slope4]
xcg=[1.2061 1.1698 1.1335 1.0972];
final= polyfit(xcg,slope,1);

Xnp=-final(2)/final(1)
line(xcg,slope)
xlim([-2,2])
ylim([-0.4,0.4])
set(gca,'XaxisLocation','origin','YaxisLocation','origin')
final= polyfit(xcg,slope,1);
N_P=-1*final(2)/final(1)
hold on
plot(xcg,slope)
plot([xcg(1) N_P],[slope(1) 0])
for i=1:length(xcg)
    plot(xcg(i),slope(i),"*")
end
plot(N_P,0,"hexagram")
xlim([-0.35 1.95])
ylim([-0.235 0.044])
title("Slope vs Xcg")
xlabel("Xcg")
ylabel("slope")
