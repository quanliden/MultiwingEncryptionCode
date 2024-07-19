clc; clear all; close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This code is designed to compare the encryption and ecryption speed based
% on manually implemented AES-128, AES-192, and AES-256 in MATLAB. 
% The AES encryption and decryption code utilizes open-source code as its
% foundation, which is from
% https://github.com/sunnyrithvik/aes-image-encryption.git.
% Here, only the main program that invokes this open-source code for
% encrypting and decrypting a 256*256 image is presented.

Key = uint8(randi([0,255],1,32));
aeskey = KeyPadding(Key);
img = imread('Starfish.png');

img_length = size(img,1);
img_depth = size(img,3);
img_size = size(img);
img = double(reshape(img,1,[]));
total_length = numel(img);
rem = mod(total_length,16);
if rem ~= 0
    img = [img zeros(1,16-rem)];
    total_length = numel(img);
end

encdata = zeros(1,total_length);
decdata =zeros(1,total_length);


%% encryption process
tic
for n = 1:16:total_length-15
    aes_in = img(n:n+15);
    encdata(n:n+15) = Cipher(aeskey,aes_in);
end
toc
%% decryption porcess

tic
for n = 1:16:total_length-15
    dec_in = encdata(n:n+15);
    decdata(n:n+15) = InverseCipher(aeskey,dec_in);
end
toc
%% post-process of data 
if rem ~=0
    encdata(end-15+rem:end) = [];
    decdata(end-15+rem:end) = [];
end
encimg = uint8(reshape(encdata,img_size));
decimg = uint8(reshape(decdata,img_size));

figure
imshow(encimg)
figure
imshow(decimg)