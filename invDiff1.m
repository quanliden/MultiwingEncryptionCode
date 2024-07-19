function iD1 = invDiff1(D1,K1,tmp0,MN)
%% inverse opeartion of Diff1
iD1 = NaN(1,MN);
tmp_ip = tmp0; tmp_ik = tmp0; tmp_id1 = tmp0;
for k = 1:MN
    iD1(k) = bitxor(bitxor(D1(k),mod(tmp_ip+tmp_id1+K1(k),256)),tmp_ik);
    tmp_id1 = iD1(k);
    tmp_ip = D1(k);
    tmp_ik = K1(k);
end

end