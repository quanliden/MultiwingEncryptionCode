function S = shuff1(P,K)
    
    MN = length(P);
    S = P;
    for i = 1:MN
        tmp = S(K(i)) ;
        S(K(i)) = S(K(MN-i+1));
        S(K(MN-i+1)) = tmp;
    end

end