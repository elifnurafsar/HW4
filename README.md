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
This code aims to work for 0,6,8 and 9 only. 
  
Main Approach
First of all I seperated the digits which has holes inside such as 0, 4, 6, 8, 9 by writing a code that fills holes with labeled numbers (label numbers starts from 5 because the border pixels are equal 1) inside given shape then counts for labeled components. The number of labels gives us the number of holes inside images.
The code can distinguish 8 from other numbers because 8 has 2 holes inside it.
  
Example:
If we try our code with the input 8.bmp the output will be 
  
![2021-07-25 (2)](https://user-images.githubusercontent.com/60623941/126901696-d11f1fec-9648-4bff-8cda-00e0ce54170c.png)

If we add below code to line 151 in determine.m we can have outout image which shows us our labeled components.
  
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

  

 Identifying 0:
 If our image has one labeled component the number can be 0, 4, 6 or 9.
 In this situation the code will find the maximum and minimum poins (such as the bottom of 9) of original image and the labeled component. If there is a pixel which equals 0 between these two shapes's maximal and minimal points the output cannot be 0. 
  
  Here is a clear explanation of my idea.
  
  ![Adsız](https://user-images.githubusercontent.com/60623941/126902551-bd45e956-5291-4e4d-a656-7802a7b6a69a.png)

  The colored areas are labels. The blue points are maximal pixels. The green lines are where we search 0 pixels. As shown 4, 9 and 6 has 0's in green lines but 0 has not. 
  
  
  *Distinguish 9 and 6:
  In previous step we found the label's center's and the border's max-min points. By using label's maximal points I found the center of the label. Then I compare border's maximal X axis locations with this label's center. 
  If border's min x axis is greater than the center's x axis the number can be 6 and its rotations (especially works in italic).
  On the other way number can be 9  (especially works in italic).
  
  Here are some outputs for 6:
  
  1-) Straight 6:
  
  ![2021-07-25 (9)](https://user-images.githubusercontent.com/60623941/126962653-a94b61ea-78cb-4560-9fa4-66cc80fa1b40.png)

  -> The first image shows input
  -> Second image shows the labeled component.
  -> Third image shows the input image's constrat version to compare label and border.
  
  The output is:
  
  ![2021-07-25 (4)](https://user-images.githubusercontent.com/60623941/126963460-4d4fd175-ca82-4dee-8352-ef33cc53688b.png)

  
  2-) Rotated 6:
  
  To rotate an image I wrote a in line 14 code as below:
  
  ``
  I=imrotate(I, 17);
  I=imresize(I,[100 100])
    
    for i=1:x
        for j=1:y
            if I(i,j)~=0
                I(i,j)=1;
            end
        end
    end
    figure 
    imshow(I);
  ``
  
  When we rotate 6 for 17 degrees our outputs images will be:
  
  ![2021-07-25 (8)](https://user-images.githubusercontent.com/60623941/126963839-08740746-7ed3-4754-8ef4-dc7605d796c0.png)
  
  -> The first image shows input
  -> Second image shows the labeled component.
  -> Third image shows the input image's constrat version to compare label and border.
  
  And our result is:
  
  ![2021-07-25 (6)](https://user-images.githubusercontent.com/60623941/126963934-ae9370be-8c84-4357-97af-ff8dba7b84a9.png)

  I think the 0's came from imrotate function or imresize function. 
  
  
Here are some outputs for 9:
  
   1-) 90 degrees rotated italic 9:
  
  Images & the console output:
  
  ![2021-07-25 (7)](https://user-images.githubusercontent.com/60623941/126964357-2a0fa582-7494-4efe-9db6-69b93e2c8b95.png)

  -> The first image shows input
  -> Second image shows the labeled component.
  -> Third image shows the input image's constrat version to compare label and border.
  
  2-) Straight 9:
  
  ![2021-07-26](https://user-images.githubusercontent.com/60623941/126966201-6e7301c0-b729-4ee0-bdcf-79ac841d28f4.png)

  The first image shows label and the second image shows boundaries.
  
  
