clc; clear all; close all;

P = imread("Starfish.png");
[M,N] = size(P);
P = double(P);
ini = [0.1,0.1,0.1];
par = 1;
P = reshape(P,1,[]);

%% encryption process
[K1,K2,K3] = ChaoticGen(ini,M,N);
C = encryption(P,K1,K2,K3,par);
Cp = reshape(uint8(C),M,N);

figure(1)
imshow(Cp)
title("encrypted image")


%% decryption process

ini = [0.1,0.1,0.1];
par = 1;
[K1,K2,K3] = ChaoticGen(ini,M,N);
D = decryption(C,K1,K2,K3,par);
Dp = reshape(uint8(D),M,N);
figure(2)
imshow(Dp)
title("decrypted image")
