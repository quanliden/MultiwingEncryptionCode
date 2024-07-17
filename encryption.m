function C = encryption(P,K1,K2,K3,par)
    [M,N] = size(P);
    MN = M*N;
    D1 = Diff1(P,K1,par,MN);
    D2 = shuff(D1,K2);
    C = Diff2(D2,K3,par,MN);
end

