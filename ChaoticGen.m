function [K1,K2,K3] = ChaoticGen(ini,M,N,Ns)
cut = 1000;
MN = M * N;
L = MN+cut;
tsp = linspace(0,500,L);
[t,y] = ode45(@odefunc,tsp,ini);
Y = y(cut+1:end,:);

%% generate the key for the first round diffusion
K1 = mod(floor((Y(1:MN,1)+Y(1:MN,2))*10^12),256)+1;
%% generate the number of Ns Sboxes for the pixel shuffling
s2 = reshape(Y(1:Ns*256,1),Ns,256);
[~,K2] = sort(s2,2);
K2 = K2 - 1;
%% generate the key for the second round diffusion
K3 = mod(floor((Y(1:MN,3)+Y(1:MN,1))*10^12),256)+1;
%% convert the data format to uint8
K1 = uint8(K1); K2 = uint8(K2); K3 = uint8(K3);
end

function dX = odefunc(t,X)
x = X(1); y = X(2); z = X(3);
dx = -1.5*x+2.5*tanh(x)+y-3*(z)*x;
dy = -3.5*y-17*tanh(x);
dz = f(x)-0.1*z-1;

dX = [dx;dy;dz];
end

 function y = f(x)

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

    y = f0+f1+f2+f3+f4+f5+f6;
end