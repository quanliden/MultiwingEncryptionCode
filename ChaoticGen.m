function [s1,s2,s3] = ChaoticGen(ini,TT,M,N)
cut = 1000;
global c d k NN

c = TT(1); d= TT(2); k = TT(3); NN = TT(4);
L = M*N+cut;
tsp = linspace(0,500,L);
[t,y] = ode45(@odefunc,tsp,ini);
Y = y(cut+1:end,:);
s1 = mod(floor((Y(1:M,1)+Y(1:M,2))*10^12),M)+1;
s2 = mod(floor((Y(1:N,3)+Y(1:N,1))*10^12),N)+1;
s3 = mod(floor((Y(:,1)+Y(:,2)+Y(:,3))*10^12),256)+1;
s3 = reshape(s3,M,N);

end

function dX = odefunc(t,X)
x = X(1); y = X(2); z = X(3);
global c d k
dx = -1.5*x+2.5*tanh(x)+y-k*(z)*x;
dy = -c*y-d*tanh(x);
dz = f(x)-0.1*z-1;

dX = [dx;dy;dz];
end

 function y = f(x)
 global NN
%  N = 6;
    F0=1.0;F1=3.0;F2=4.0;F3=5.0;F4=6.0;F5 = 7.0;F6=8;
    E1=2.0;E2=3.0;E3=4.0;E4=5.0;E5 = 6.0; E6=7;
    f0 = F0*(x)^2;
    a=1.5;b = 0.75;
    f1 = -F1*(a+b*(sign(x-E1)-sign(x+E1)));
    f2 = -F2*(a+b*(sign(x-E2)-sign(x+E2)));
    f3 = -F3*(a+b*(sign(x-E3)-sign(x+E3)));
    f4 = -F4*(a+b*(sign(x-E4)-sign(x+E4)));
    f5 = -F5*(a+b*(sign(x-E5)-sign(x+E5)));
    f6 = -F6*(a+b*(sign(x-E6)-sign(x+E6)));
    switch NN
        case 0
            y = f0;
        case 1
            y = f0+f1;
        case 2
            y = f0+f1+f2;
        case 3
            y = f0+f1+f2+f3;
        case 4
            y = f0+f1+f2+f3+f4;
        case 5
            y = f0+f1+f2+f3+f4+f5;
        case 6
            y = f0+f1+f2+f3+f4+f5+f6;
    end
end