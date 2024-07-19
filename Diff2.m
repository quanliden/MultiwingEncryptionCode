function C = Diff2(D2,K,tmp0,MN)
%% The second round of diffusion of image pixels
% P is input --> shuffled image 
% K1 is input --> the chaotic key for this round diffusion
% tmp0 is input --> initial values for the first pixel diffusion
%                   can be randomly generated or determined by user
% D2 is output --> the resulted image 
%% 
tmp_d2 = tmp0; tmp_k = tmp0; tmp_c = tmp0;
C = NaN(1,MN);
for i = 1:MN
    C(i) = bitxor(bitxor(D2(i),mod(tmp_c+K(i),256)),mod(tmp_d2+tmp_k,256));
    tmp_d2 = D2(i);
    tmp_k = K(i);
    tmp_c = C(i);
end
end