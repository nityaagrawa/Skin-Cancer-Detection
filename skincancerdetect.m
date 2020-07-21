I = imread('2.jpg');
figure,imshow(I);
title('ORIGINAL IMAGE');
I=rgb2gray(a);
%rgb to gray scale image using P=rgb2gray(a); figure,imshow(I);
figure,imshow(I);
%to display the grayscale image
title('GRAYSCALE IMAGE(WITH NOISE)');
s=medfilt2(I);
figure,imshow(s);
%to display filtered noiseless image
title('FILTERED NOISELESS IMAGE');
figure,imshowpair(I,s,'montage');
title('COMPARISON OF NOISE AND NOISELESS IMAGES');
%to threshold image and change background
BW = imbinarize(I);
BW=~BW;
B=logical(1-BW);
figure,imshow(B);
title('ERODED IMAGE');
%erosion
ss=strel('square',3);
n=imerode(BW,ss);
figure,imshow(n);
title('CHANGED BACKGROUND IMAGE');
%filling image with holes
fi=imfill(n,'holes');
figure,imshow(fi);
title('HOLES FILLED');
%remove any blobs on the image
clear=imclearborder(fi);
figure,imshow(clear);
title('REMOVE BLOBS ON BORDER');
%remove smaller blobs on the image
se=strel('disk',7);
open=imopen(fi,se);
figure,imshow(open);
title('REMOVE SMALL BLOBS');
%finding diameter of image
diameter=regionprops(open,'MajorAxisLength')
figure,imshow(open);
title('IMAGE WITH ADJUSTABLE RULER');
%to introduce a ruler to make manual measurements
d=imdistline;