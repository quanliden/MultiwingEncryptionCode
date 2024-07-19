function D1 = Diff1(P,K1,tmp0,MN)
%% The first round of diffusion of image pixels
% P is input --> original image
% K1 is input --> the chaotic key for this round diffusion
% tmp0 is input --> initial values for the first pixel diffusion
%                   can be randomly generated or determined by user
% D1 is output --> the resulted image 
%%
D1 = NaN(1,MN);
tmp_p=tmp0;tmp_k=tmp0;tmp_d1=tmp0;

for k = 1:MN
    D1(k) = bitxor(bitxor(P(k),mod(tmp_d1+tmp_p+K1(k),256)),tmp_k);
    tmp_p = P(k);
    tmp_k = K1(k);  
    tmp_d1 = D1(k);
end

end