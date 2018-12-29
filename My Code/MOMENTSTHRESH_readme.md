MOMENTSTHRESH Compute an image threshold value using preservation of image moments, as proposed by Tsai. MOMENTSTHRESH returns an integer
between 0 and 1 that represents a normalized image threshold value that segments the input image, according to Tsai's  moment-preservation
algorithm (see reference).
###  Synopsis: 
* threshold = momentsthresh(img)

###  Input: 
* img = input image to be segmented (required)

###  Output: 
* threshold = value between 0 and 1 representing the threshold.
###  Reference: 
 *Tsai W. (1985) Moment-preserving thresholding: a new approach, Computer Vision, Graphics, and Image Processing, vol. 29, pp. 377-393*
 
### Author: 
**Daniel Martín**
