clc; clear all; close all;

P = imread("Starfish.png");

[M,N] = size(P);
ini = [0.1,0.1,0.1];

[K1,K2,K3] = ChaoticGen(ini,M,N,16);

par = uint8(5);
tic
C = encryption(P,K1,K2,K3,par);
toc

Cp = reshape(C,M,N);
tic
D = decryption(Cp,K1,K2,K3,par);
toc
Dp = reshape(D,M,N);

figure
imshow(Cp)
title("encrypted image")

figure
imshow(Dp)
title("decrypted image")
