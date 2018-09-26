clc;clear;close all; 
vid=VideoReader('video.mp4'); 
count = 0; 
while hasFrame(vid) 
    readFrame(vid); 
    count = count+1; 
 end 
 %disp(count); 
% vid.CurrentTime = 0; 
% i = 1; 
%  all = zeros(vid.Height, vid.Width, count); 
%  while hasFrame(vid) 
%      img = readFrame(vid); 
%      B = rgb2gray(img);  
%      all(:,:,i) = B(:,:); 
%      i = i+1; 
%  end 
 %BG = median(all,3);
 BG=imread('image19.jpg');
 BG = rgb2gray(BG);
 %figure,imshow(BG);

 i=0; %for img
 flag=0; %for flag
 while(true) 
    i=i+1;
    if(i==count) break;
    end
    str=strcat('image',num2str(i));
    str=strcat(str,'.jpg');
    img=imread(str);
    I0=img;
    imshow(I0);
    img=rgb2gray(img);
    %imshow(img);
    %Back Ground Subtraction
    img=abs(BG-img);
    %imshow(img);
    image_thresholded=zeros(size(img));
    image_thresholded(img>0.1)=255;%black and white image
    %imshow(image_thresholded);
    I = image_thresholded;
    %imshow(I);
    I = imfill(I,'holes');
    I = imfill(I);%black and white matrix
    %imshow(I);
    Iy=(I0(:,:,1)/2+I0(:,:,2)/2-I0(:,:,3))>70;
    %imshow(Iy);
    I=I.*Iy; %binary multiplication(pixel by pixel)
    imshow(I);
    [x,y]=size(I);
    %disp(x);
    sum=0;
    c=0;
    for m=1:1:x
        for n=1:1:y
            if (I(m,n)==255)
                sum=sum+m;
                c=c+1;
            end
        end
    end
    %disp(sum);
    %disp(c);
    sum=sum/c;
    disp(sum);
    if(sum>(y-200))
        flag=1;
        disp('lemon fall');
        break;
    end
 end
 if flag==0
     disp('lemon not fall');
 end
