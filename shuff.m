function Ped = shuff(P,Sboxes)
%% Shuffling operation
% P is input --> the diffused image operated by the Diff1
% Sboxes is input --> the number Sbox is m in uint8 format
% Ped is output --> restult of the shuffled image
% Note: For the sake of convenience, we choose the case where the number of
% image pixels can be evenly divided by m as an example. If the pixel size
% cannot be evenly divided by m, it can be expanded by padding the number
% of image pixels with 0s or arbitrary pixel values to achieve the purpose
% of being able to be evenly divided by m. This is a commonly used method
% in image encryption, and we do not delve too much into it in this code.

%%
    [m,~] = size(Sboxes);
    P = reshape(P,1,[]);
    MN = length(P);
    Ped = NaN(1,MN);
    rem = MN / m;
    for i = 1:m
        Sbox = reshape(Sboxes(i,:),16,16);
        Ped((i-1)*rem+1:i*rem) = Sbox(P((i-1)*rem+1:i*rem)+1);
    end

    Ped = uint8(Ped);
end