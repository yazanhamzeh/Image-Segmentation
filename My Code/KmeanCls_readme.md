* Performs K-means segmentation of an image
* Based on Original Code under [this Mathworks page](https://www.mathworks.com/matlabcentral/answers/382028-image-segmentation-by-k-means-algorithm) 
* [Labels, Centers]=KmeanCls(IMG,Nc,<options>), where
  * Labels: list of segment labels
  * Centers: cluster centroid locations
  * IMG: image to be segmented
  * Nc: number of clusters
* The following name-value pairs are available arguments to control aspects of the k-means clustering algorithm:
  * options(1): Number of times to repeat the clustering process. Enter
    *  NaN for default
  * options(2): Maximum number of iterations. Enter NaN for default
  * options(3): Accuracy threshold.Enter NaN for default
