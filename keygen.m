function key = keygen(P)
K = DataHash(P,'SHA-256','uint8');

key = zeros(1,8);
for i = 1:8
    key(i) = bitxor(K(4*(i-1)+1),bitxor(K(4*(i-1)+2),bitxor(K(4*(i-1)+3),K(4*(i-1)+4))));
end
for i = 1:3
    key(i) = mod(key(i),key(8)) /256;
end
for j = 4:6
    key(j) = 0.01*key(j)/256;
end
key(7) = mod(key(7),6);
end