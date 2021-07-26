function determine(img)
    A=imread(img);
    [x,y]=size(A);
    I=zeros(x,y);
    %%prepare image digit_index=1 ground=0
    for i=1:x
        for j=1:y
            if A(i,j)==0
                I(i,j)=1;
            end
        end
    end
    
    Q=I;
    sayi=5;

    %%fill blanks
    for i=1:x
        min_y=999;
        max_y=-1;
        for j=1:y
            if I(i,j)==1 && j<min_y
                min_y=j;
            end
            if I(i,j)==1 && j>max_y
                max_y=j;
            end
        end
        for l=min_y:max_y
            x1=i-1;
            x2=i;
            x3=i+1;
            y1=l-1;
            y2=l;
            y3=l+1;
            if x1<1
                x1=1;
            end
            if x3>x
                x3=x;
            end
            if y1<1
                y1=1; 
            end
            if y3>y
                y3=y;
            end
            a=I(x1,y1);
            b=I(x1,y2);
            c=I(x1,y3);
            d=I(x2,y1);
            e=I(x2,y2);
            f=I(x2,y3);
            g=I(x3,y1);
            h=I(x3,y2);
            k=I(x3,y3);
            if I(i,l)==0 
                if a<5 && b<5 && c<5 && d<5 && f<5 && g<5 && h<5 && k<5 
                    I(i,l)=sayi;
                    sayi=sayi+1;
                else
                    max=-1;
                    if a>max
                        max=a;
                    end
                    if b>max
                        max=b;
                    end
                    if c>max
                        max=c;
                    end
                    if d>max
                        max=d;
                    end
                    if e>max
                        max=e;
                    end
                    if f>max
                        max=f;
                    end
                    if g>max
                        max=g;
                    end
                    if h>max
                        max=h;
                    end
                    if k>max
                        max=k;
                    end
                    I(i,l)=max;
                end
            end
        end
    end

    e_max=0;
    for i=1:x
        for j=1:y
            x1=i-1;
            x2=i;
            x3=i+1;
            y1=j-1;
            y2=j;
            y3=j+1;
            if x1<1
                x1=1;
            end
            if x3>x
                x3=x;
            end
            if y1<1
                y1=1; 
            end
            if y3>y
                y3=y;
            end
            a=I(x1,y1);
            b=I(x1,y2);
            c=I(x1,y3);
            d=I(x2,y1);
            e=I(x2,y2);
            f=I(x2,y3);
            g=I(x3,y1);
            h=I(x3,y2);
            k=I(x3,y3);
            if e>e_max
                e_max=e;
            end
            if e>=5 && ( (a>1 && a~=e) || (b>1 && b~=e) || (c>1 && c~=e) || (d>1 && d~=e) || (f>1 && f~=e) || (g>1 && g~=e) || (h>1 && h~=e) ||(k>1 && k~=e))
                for m=1:x
                    for n=1:y
                        if (I(m,n)==a && a>1) || (I(m,n)==b && b>1) || (I(m,n)==c && c>1) || (I(m,n)==d && d>1) || (I(m,n)==f && f>1) || (I(m,n)==g && g>1) || (I(m,n)==h && h>1) || (I(m,n)==k && k>1)
                            I(m,n)=e;
                        end
                    end
                end
            end
            if e>=5 && (a==0 || b==0 || c==0 || d==0 || f==0 || g==0 || h==0 || k==0)
                for m=1:x
                    for n=1:y
                        if I(m,n)==e
                            I(m,n)=0;
                        end
                    end
                end
            end
        end
    end

    %add Z to here

    arr=zeros(e_max,1);
    for s=2:e_max
        syc=0;
        for i=1:x
            for j=1:y
                if I(i,j)==s
                    syc=syc+1;
                end
            end
        end
        arr(s,1)=syc;
    end

    area=0;
    for i=1:e_max
        if arr(i,1)>0
            area=area+1;
        end
    end
    if area==2
        fprintf("the number is 8\n");
    else
        if area==1
            for i=1:x
                for j=1:y
                    if I(i,j)<5
                        I(i,j)=0;
                    else 
                        I(i,j)=1;
                    end
                end
            end
            figure 
            imshow(I);
            figure 
            imshow(Q);
            [ort1,ort2]=find_center(I);
            [o1,o2]=find_center(Q);
            is0=0;
            if abs(ort1-o1)<2 && abs(ort2-o2)<2
                is0=1;
            end
            if is0==1
               fprintf("the number can be 0\n");
            else
                px=ort1;
                py=ort2;
                u=0;
                for i=1:x
                    for j=1:y
                        if Q(i,j)==1
                            s1=abs(ort1-i);
                            s2=abs(ort2-j);
                            length = sqrt(s1*s1+s2*s2);
                            if length>u
                                px=i;
                                py=j;
                                u=length;
                            end
                        end
                    end
                end
                if px<=ort1
                    fprintf("the number can be 6\n");
                else
                    fprintf("the number can be 9\n");
                end

            end

        end
    end
end
