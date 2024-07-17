function D = invPeumu(P,s1,s2,M,N)
    P = reshape(P,M,N);
%     [M,N] = size(P);
    D = P;
    for j = N:-1:1
        tmp = D(:,s2(j));
        D(:,s2(j)) = D(:,j);
        D(:,j) = tmp;
    end
    for i = M:-1:1
        tmp = D(s1(i),:);
        D(s1(i),:) = D(i,:);
        D(i,:) = tmp;
    end
    D = reshape(D,1,M*N);
end