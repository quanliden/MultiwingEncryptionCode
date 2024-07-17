function iD2 = invDiff2(D2,K,tmp0,MN)
%% inverse opeartion of Diff1
tmp_ip = tmp0;tmp_ik = tmp0;tmp_id2 = tmp0;
iD2 = NaN(1,MN);
for i = 1:MN
    iD2(i) = bitxor(bitxor(D2(i),mod(tmp_ip+K(i),256)),mod(tmp_id2+tmp_ik,256));
    tmp_id2 = iD2(i);
    tmp_ik = K(i); 
    tmp_ip = D2(i);
end
iD2 = uint8(iD2);
end