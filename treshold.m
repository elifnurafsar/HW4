function img = treshold(I, num)
    [x,y]=size(I);
    E = zeros(x,y);
    for c = 1:x
        for e = 1:y
            if I(c,e) < num
                E(c,e) = 1;
            end
        end
    end
    img = E;
end