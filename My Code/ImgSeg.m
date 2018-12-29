function ImgSeg(Img, Method,NClasses)
%% Segment image using the sepecified segmantation technique.
%  ImgSeg(Img, Method,NClasses), where
%  Img: Image to be segmented
%  NClasses: number of segmentation classes
%  Method: Segmentation techniques, which can be any of the following:
%   1. OTSU for Global image thresholding/segmentation using Otsu's method.
%      "https://en.wikipedia.org/wiki/Otsu%27s_method"
%   2. MNTH for image threshold value using preservation of image moments using
%      Tsai method.
%      "https://people.cs.nctu.edu.tw/~whtsai/Journal%20Paper%20PDFs/Tsai_CVGIP(journal)_1985.pdf"
%   3. FCMN for Fuzzy C-Means technique
%      "https://en.wikipedia.org/wiki/Fuzzy_clustering"
%%
ImgIn=imread(Img);
if Method=='OTSU'
    %n=input('Enter the number of Classes  ');
    [IDX,sep] = otsu(ImgIn,NClasses);
    figure(1);
    %ShowReslts([2,1,1],Img_in,IDX,Img3,Img4,(['n = ' int2str(n)],'FontWeight','bold'),'gray'),;
    subplot(211)
    imshow(ImgIn);
    subplot(212);
    imagesc(IDX), axis image off
    colormap(gray);
else
    if Method=='MNTH'
        
        Img_MOMENTSTHRESH = rgb2gray(ImgIn);
        threshold =256* momentsthresh(Img_MOMENTSTHRESH);
        Img_MOMENTSTHRESH(Img_MOMENTSTHRESH<threshold)=0;
        Img_MOMENTSTHRESH(Img_MOMENTSTHRESH>threshold)=255;
        figure(2);
        subplot(211)
        imshow(ImgIn);
        subplot(211)
        imshow(ImgIn);
        subplot(212);
        imshow(Img_MOMENTSTHRESH,gray), axis image off
        %colormap(gray);
    elseif Method=='FCMN'
       FuzCls(ImgIn,NClasses,[NaN 50 NaN false]);
    end
end



%% Dispaly Results
% ShowReslts(SPlots,Img1,Imge2,Img3,Img4,title,map);
% N=4;
% if isempty('Img2')
%     N=1;
% else
%     if isempty('Img3')
%         N=2;
%     else
%         if isempty('Img4')
%         N=3;
%         end
%     end
% end
% for indx=1:N
%     if N>2
%         subplot(2,2,indx);
%         imshow(
    