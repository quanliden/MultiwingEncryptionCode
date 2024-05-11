clc; clear all; close all;
%% load image
P = imread('Data\04.png');
figure
imshow(P)
P = double(P);
[M,N] = size(P);

%% Generating the key
key = keygen(P);

initial = key(1:3);
TT = [0.35+key(4),17+key(5),3+key(6),key(7)];
%% Generating chaotic sequences
[s1,s2,s3] = ChaoticGen(initial,TT,M,N);

%% Chaos-based encryption
C = encryption(P,s1,s2,s3);
figure
imshow(uint8(C))
%% Decryption process
D = decryption(C,s1,s2,s3);
figure
imshow(uint8(D))