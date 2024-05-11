function D = decryption(im,s1,s2,s3)
    [M,N] = size(im);

    D = bitxor(im,s3);
    
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

end