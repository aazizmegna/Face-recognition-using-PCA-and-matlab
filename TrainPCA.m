%% implement face recognition using PCA
n=input('Enter number of Images for training: '); 
L=input('Enter number of Dominant Eigen Values to keep: ');
M=100; N=90; % Required image dimentions
X=zeros(n,(N*M));%Initiale data set matrix [X]=300*9000
T=zeros(n,L); %Initialize Transformed data set [T]=300*50

for count=1:n
    I=imread(sprintf('%d.jpg',count)); %Reading images
    I=rgb2gray(I);
    I=imresize(I,[M,N]);
    
    Reshaping images as 1D vector
end
Xb=X; %Copy database for further use


m=mean(X); %Mean of all Images
for i=1:n
    X(i,:)=X(i,:)-m; %Substraction Mean from each 1D image
end
Q=(X'*X)/(n-1); %Finding Covariance Matrix
[Evecm,Evalm]=eig(Q); %Getting Eigen values and Eign vectors COV matrix [Q]
Eval=diag(Evalm); %Extracting all eigen values
[Evalsorted,Index]=sort(Eval,'descend');%Sorting Eigen Values
Evecsorted=Evecm(:,Index);
Ppca=Evecsorted(:,1:L); %Reduced Transformation matrix [Ppca]
for i=1:n
    T(i,:)=(Xb(i,:)-m)*Ppca; %Projecting each image to PCA space
end