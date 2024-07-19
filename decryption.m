function invC = decryption(P,K1,K2,K3,par)
    [M,N] = size(P);
    MN = M*N;
    iD3 = invDiff2(P,K3,par,MN);
    iD2 = invshuff1(iD3,K2);
    invC = invDiff1(iD2,K1,par,MN);

end