clc;clear;close all;
vid=VideoReader('fall.mp4'); 
while hasFrame(vid)
     img = (readFrame(vid));
     saveas(imshow(img),sprintf('image%d.jpg',j));
     j = j + 1;
end
