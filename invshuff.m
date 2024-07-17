function iPed = invshuff(P,Sboxes)
%% generate the inverse Sboxes
    [m,n] = size(Sboxes);
    invSboxes = NaN(size(Sboxes));
    for j = 1:16
        for i = 1:256
            invSboxes(j,Sboxes(j,i)+1) = i-1;
        end
    end
%% inverse pixel shuffling
    P = reshape(P,1,[]);
    MN = length(P);
    rem = MN / m;
    for i = 1:m
       
        invSbox = reshape(invSboxes(i,:),16,16);
        iPed((i-1)*rem+1:i*rem) = invSbox(P((i-1)*rem+1:i*rem)+1);
    end

    iPed = uint8(iPed);
end