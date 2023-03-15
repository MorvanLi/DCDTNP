clear all;
close all;
clc;
addpath(genpath(cd));

tic
for num =1:1
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


% tic
% for num =1:21
%     path1 = ['D:/医学图像深度学习对比方法/DTNP-红外和可见光图像融合/IV_images/IR',num2str(num),'.png'];
%     path2 = ['D:/医学图像深度学习对比方法/DTNP-红外和可见光图像融合/IV_images/VIS',num2str(num),'.png'];
%     fused_path = ['./res/IVIF/',num2str(num),'.png'];
%     I=double(imread(path1))/255;
%     V=double(imread(path2))/255;
%     imgf=fuse_NSST_DTNP(I,V);
%     F=uint8(imgf*255);
%     figure,imshow(F);
% %     imwrite(F,fused_path);
% end
% toc


% imagepath1 = 'D:/医学图像深度学习对比方法/DTNP-红外和可见光图像融合/IR2.png';
% imagepath2 = 'D:/医学图像深度学习对比方法/DTNP-红外和可见光图像融合/VIS2.png';
% image1=imread(imagepath1);
% image2=imread(imagepath2);
% if size(image1,3)>1
%     image1 = rgb2gray(image1);
%     image2 = rgb2gray(image2);
% end
% image1 = double(image1)/ 255;
% image2 = double(image2)/ 255;
% imgf=fuse_NSST_DTNP(image1,image2);
% imgf = uint8(imgf *255);
% figure,imshow(imgf);