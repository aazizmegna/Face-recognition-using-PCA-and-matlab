%First load Required Variables in workspace for testing
clc;
load PCA_Train_Variables; %Loading PCA_Train_Variables.mat file

% PCA_Train_Variables loads followings in worksplace
% Image size [M=100, N=90]
% Mean Image[m]
% Reduced Eigen vectors transformaton matrix [Ppca]
% Transformed dataset matrix [T]

[filename,pathname]=uigetfile('*.*','Select the Test Image');
filewithpath=strcat(pathname,filename);
img=imread(filewithpath);
imgo=img;
img=rgb2gray(img); %100*90
img=imresize(img,[M,N]);
img=double(reshape(img,[1,M*N]));1*9000
imgpca=(img-m)*Ppca;%Projecting query image to PCA space 1*50
distarray=zeros(n,1); %Initialize different array

for i=1:n
    distarray(i)=sum(abs(T(i,:)-imgpca)); % Finding L1 distance
end

[result,indx]=min(distarray); % Getting best match
resulting=imread(sprintf('%d.jpg',indx)); % Getting best match image
%plotting Images
subplot(121)
imshow(imgo);
title('Query Face');
subplot(122)
imshow(resulting);
title('Recongnized Face');