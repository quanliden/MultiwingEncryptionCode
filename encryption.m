function C = encryption(im,s1,s2,s3)
im = double(im);

[M,N] = size(im);

A = im;
for i = 1:M
    tmp = A(i,:);
    A(i,:) = A(s1(i),:);
    A(s1(i),:) = tmp;
end
B = A;
for j = 1:N
    tmp = B(:,j);
    B(:,j) = B(:,s2(j));
    B(:,s2(j)) = tmp;
end
C = bitxor(B,s3);
end