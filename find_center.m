function [ort1,ort2] = find_center(I)
    [x,y]=size(I);
    minx=999;
    miny=999;
    maxx=0;
    maxy=0;
    for i=1:x
        for j=1:y
            if I(i,j)==1
                if i>maxx
                    maxx=i;
                end
                if i<minx
                    minx=i;
                end
                if j<miny
                    miny=j;
                end
                if j>maxy
                    maxy=j;
                end
            end
        end
    end
    eksen1=maxx-minx;
    eksen2=maxy-miny;
    ort1 = ceil(eksen1/2)+minx;
    ort2 = ceil(eksen2/2)+miny;
end