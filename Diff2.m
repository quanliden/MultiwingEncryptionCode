function D2 = Diff2(P,K,tmp0,MN)
%% The second round of diffusion of image pixels
% P is input --> shuffled image in uint8 formart
% K1 is input --> the chaotic key for this round diffusion
% tmp0 is input --> initial values for the first pixel diffusion
%                   can be randomly generated or determined by user
% D2 is output --> the resulted image in uint8 fomart
%% 
tmp_p = tmp0; tmp_k = tmp0; tmp_d2 = tmp0;
D2 = NaN(1,MN);
for i = 1:MN
    D2(i) = bitxor(bitxor(P(i),mod(tmp_d2+K(i),256)),mod(tmp_p+tmp_k,256));
    tmp_p = P(i);
    tmp_k = K(i);
    tmp_d2 = D2(i);
end

D2 = uint8(D2);
end