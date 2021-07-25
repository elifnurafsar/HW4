# HW4
Digit Identifying - matlab

Running

1. Download files as zip, form github using green labeled 'Code' button
2. Go to 'Downloads' from your computer
3. Find Bil-467-Odev-3 file and copy it to your Desktop
4. Go to your desktop and right click to Bil-467-Odev-3 then select 'Extract Here'
5. Open matlab
6. Go to browser section and select extracted file.
7. In matlab's current folder section you can see the codes and images. You can open a script by clicking the name of this script.
8. Open command window and run determine.m by writing "determine <input image>".
9. If you want to change the input images, you can change script's A=imread('0.bmp'); to A=imread('<the image you want>');
In this project I use .bmp images. If you want to change the image type you should convert digit pixels as 1 and ground pixels as 0.
Have fun with outputs.
  
!!IMPORTANT!!
This code aims to work for 0,6,8 and 9 only. It can also identifies 5 and 2 if they are not rotated.
  
Main Approach
First of all I seperated the digits which has holes inside such as 0, 4, 6, 8, 9 by writing a code that fills holes with labeled numbers (label numbers starts from 5 because the border pixels are equal 1) inside given shape then counts for labeled components. The number of labels gives us the number of holes inside images.
The code can distinguish 8 from other numbers because 8 has 2 holes inside it.
  
Example:
If we try our code with the input 8.bmp the output will be 
  
![2021-07-25 (2)](https://user-images.githubusercontent.com/60623941/126901696-d11f1fec-9648-4bff-8cda-00e0ce54170c.png)

If we add below code to line 151 in determine.m  we can have outout image which shows us our labeled components.
  
 ``
Z=zeros(x,y);
for i=1:x
    for j=1:y
        if I(i,j)>1
            Z(i,j)=1;
        end
    end
end
figure 
imshow(Z);
 ``
  Output images will be 
  
  ![2021-07-25 (1)](https://user-images.githubusercontent.com/60623941/126901888-01e40fa4-1564-4a65-b34e-19919cf5a6dd.png)

  

 
