function [centers,U] = FuzCls(IMG,Nc,options)
%% Performs fuzzy c-means clustering on the given data and returns Nc cluster centers.
% "options" specifies additional clustering options, as follows:
% options(1):Exponent for the fuzzy partition matrix
% options(2): Maximum number of iterations, specified as a positive integer.
% options(3): Minimum improvement in objective function between two consecutive iterations, specified as a positive scalar.
% options(3): Information display flag indicating whether to display the objective function 
%%
DefOpt=[2 100 1e-5 true]; % default options fot the fuzzy classifier function
[f,g]=find(isnan(options)); % find where to there is a NaN
for indx=1:length(g)  % replace NaN options witht default
    options(g(indx))=DefOpt(g(indx));
end
%% 
close all;
% Check if input image is rgb and convert to a gray-level image
if ndims(IMG) == 3
  img = rgb2gray(IMG);
end 
data = im2double(img);
figure(1);
imshow(data);
impixelinfo;
[Irows,Icolumns]=size(data);
data=data(:);
[centers,U] = fcm(data,Nc,options); % classify

maxU = max(U);
lvl=1;
fcmImage(1:length(data))=0;
for ix=1:Nc
    index = find(U(ix,:) == maxU);
    fcmImage(index(:))=lvl;
    lvl=max(1-ix/Nc,0);
end
IMGSeg=reshape(fcmImage,Irows,Icolumns);
figure(2);
imshow(IMGSeg);
impixelinfo;


