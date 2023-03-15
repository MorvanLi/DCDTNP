clear all;
close all;
clc;
addpath(genpath(cd));

tic
for num =1:10
    path1 = ['./dataset/CT-MRI/MRI/',num2str(num),'.png'];
    path2 = ['./dataset/CT-MRI/CT/',num2str(num),'.png'];
    path_temp = './results/MRI-CT/';
    if exist(path_temp,'dir')==0
        mkdir(path_temp);
    end
    fused_path = [path_temp,num2str(num),'.png'];
    A=double(imread(path1))/255;
    B=double(imread(path2))/255;
    imgf=Fuse_DCDTNP(A,B);
    F=uint8(imgf*255);
    figure,imshow(F);
    imwrite(F,fused_path);
end
toc
