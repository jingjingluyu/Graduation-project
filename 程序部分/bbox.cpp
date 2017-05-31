    #include <opencv2/core/core.hpp>  
    #include <opencv2/highgui/highgui.hpp>  
    #include <math.h>  
    #include <string.h>  
    #include <opencv/cv.h>  
    #include <stdio.h>
    #include "opencv2/imgproc/imgproc.hpp"  
    using namespace cv;   
    int main(int argc,char *argv[]){  
        Mat img = cv::imread("Black_Footed_Albatross_0009_34.jpg");  
        Mat imageROI;  
       
        imageROI = img(cv::Rect(139,30,153,264));  
        rectangle(imageROI,cvPoint(0,0),cvPoint(153,264),cvScalar(255,0,0),2);  
       
        namedWindow("test");  
        imshow("test",img);  
        waitKey(0);  
        return 0;  
    }  
