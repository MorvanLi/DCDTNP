clear all;
close all;
clc;
%% NSST tool box
addpath(genpath(cd));
tic
for num =1:10
    path1 = ['./dataset/SPECT-MRI/MRI/',num2str(num),'.png'];
    path2 = ['./dataset/SPECT-MRI/SPECT/',num2str(num),'.png'];
    path_temp = './results/MRI-SPECT/';
    if exist(path_temp,'dir')==0
        mkdir(path_temp);
    end
    fused_path = [path_temp,num2str(num),'.png'];
    img1 =double(imread(path1))/255;
    img2 =double(imread(path2))/255;
    img2_YUV=ConvertRGBtoYUV(img2);
    img2_Y=img2_YUV(:,:,1);
    [hei, wid] = size(img1);
    imgf_Y=Fuse_DCDTNP(img1,img2_Y);
    imgf_YUV=zeros(hei,wid,3);
    imgf_YUV(:,:,1)=imgf_Y;
    imgf_YUV(:,:,2)=img2_YUV(:,:,2);
    imgf_YUV(:,:,3)=img2_YUV(:,:,3);
    imgf=ConvertYUVtoRGB(imgf_YUV);
    F=uint8(imgf*255);
    imwrite(F,fused_path);  
end
toc







