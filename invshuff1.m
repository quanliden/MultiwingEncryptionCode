function iS = invshuff1(P,K)
    MN = length(P);

    iS = P;

    for i = 1:MN
        tmp = iS(K(i));
        iS(K(i)) = iS(K(MN-i+1));
        iS(K(MN-i+1)) = tmp;
    end
end