function [Labels, Centers]=KmeanCls(IMG,Nc,options)
%% Performs K-means segmentation of an image
%% Based on Original Code that can be found here: 
% https://www.mathworks.com/matlabcentral/answers/382028-image-segmentation-by-k-means-algorithm by 
% [Labels, Centers]=KmeanCls(IMG,Nc,<options>), where
% Labels: list of segment labels
% Centers: cluster centroid locations
% IMG: image to be segmented
% Nc: number of clusters
% options: name-value arguments to control aspects of the k-means
% clustering algorithm. The following name-value pairs are available:
% options(1): Number of times to repeat the clustering process. Enter
%  NaN for default
% options(2): Maximum number of iterations. Enter NaN for default
% options(3): Accuracy threshold.Enter NaN for default
%% Initialize 
DefOpt=[1 50 1e-4]; % default options fot the fuzzy classifier function
[f,g]=find(isnan(options)); % find where to there is a NaN
for indx=1:length(g)  % replace NaN options witht default
    options(g(indx))=DefOpt(g(indx));
end

NumAttempts = options(1);
MaxIterations = options(2);
Threshold = options(3);
close all;

%% Perform segmentation

% Check if input image is rgb and convert to a gray-level image
if ndims(IMG) == 3
  img = rgb2gray(IMG);
end 
data = im2double(img);
figure(1);
imshow(data);
impixelinfo;
[Irows,Icolumns]=size(data);

for attempts=1:NumAttempts
    iterations=0;
    errmax=1; % initial error
    cents=rand(Nc,1);% Generate rand0m centroids
    Dist=zeros(Irows,Icolumns,Nc); % Initialize distances to centroids
    % calculate distance between image pixels and cluster centroids
    while (iterations <=MaxIterations && errmax > Threshold) 
        pcents= cents; % store old centroids
        iterations = iterations+1; % increment interation number
        for IndxC=1:Nc
            Dist(:,:,IndxC)=(data-cents(IndxC)).^2;
        end
        %assign members (image pixels)to minimum distance clusters
        % mv is the minimum distace matrix and ML is the label of 
        % the cluster centroid closest to the image pixel
          [mv,ML]=min(Dist,[],3); 
        %updat cluster centroid
        ImG=zeros(Irows,Icolumns);
          for clst=1:Nc
              I=(ML==clst); % Indices of pixels in cluster clst
              ImG(I)=1/clst;
              cents(clst)=mean(mean(data(I))); % new centroids
          end
        %find maximum absolute difference between current and previous iteration
        %cluster centroids
      errmax=max(abs(cents-pcents));
    end
    errmax
    figure(2);
    imshow(ImG);
    impixelinfo;
end

