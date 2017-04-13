#include <iostream>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <stdio.h>//标准输入输出头文件，编写C语言中，常用到printf()和scanf()函数.
#include <string.h>//是C版本的头文件，包含比如strcpy、strcat之类的字符串处理函数。

#define TRUE 1//define 用于简单的字符替换

extern "C"{
#include <vl/generic.h>
#include <vl/sift.h>
}

using namespace cv;
using namespace std;

int main(int argc, char* argv[])
{

	cout << "SIFT特征提取演示程序" << endl;
	VL_PRINT("Hello world!\n");

	Mat img_1 = imread("1.jpg", 0);
	int noctaves = 4, nlevels = 2, o_min = 0;

	// noctaves=(int)(log(min)/log(2));  
	//在sift.h头文件中有 typedef float vl_sift_pix 声明

	vl_sift_pix *ImageData = new vl_sift_pix[img_1.cols*img_1.rows];
	for (int i = 0; i < img_1.rows; i++)
	{
		uchar *Pixel = img_1.ptr<uchar>(i);
		for (int j = 0; j < img_1.cols; j++)
		{
			ImageData[i*img_1.cols + j] = Pixel[j];
		}
	}
	// 定义VlSiftFilt结构体指针
	VlSiftFilt *SiftFilt = NULL;
	// 创建一个新的sift滤波器
	SiftFilt = vl_sift_new(img_1.cols, img_1.rows, noctaves, nlevels, o_min);

	int KeyPoint = 0;
	int idx = 0;
	if (vl_sift_process_first_octave(SiftFilt, ImageData) != VL_ERR_EOF)
	{
		while (TRUE)
		{
			//计算每组中的关键点  
			vl_sift_detect(SiftFilt);
			//遍历并绘制每个点  
			KeyPoint += SiftFilt->nkeys;//检测到的关键点的数目
			cout << "关键点数目：" << endl << KeyPoint << endl;
			VlSiftKeypoint *pKeyPoint = SiftFilt->keys;//检测到的关键点
			for (int i = 0; i<SiftFilt->nkeys; i++)
			{
				VlSiftKeypoint TemptKeyPoint = *pKeyPoint;
				pKeyPoint++;
				circle(img_1, cvPoint(TemptKeyPoint.x, TemptKeyPoint.y), TemptKeyPoint.sigma / 2, CV_RGB(255, 0, 0));

				idx++;
				//计算并遍历每个点的方向  
				double angles[4];
				int angleCount = vl_sift_calc_keypoint_orientations(SiftFilt, angles, &TemptKeyPoint);//计算关键点的方向
				for (int j = 0; j<angleCount; j++)
				{
					double TemptAngle = angles[j];
					printf("%d: %f\n", j, TemptAngle);
					//计算每个方向的描述  
					float *Descriptors = new float[128];
					vl_sift_calc_keypoint_descriptor(SiftFilt, Descriptors, &TemptKeyPoint, TemptAngle);
					int k = 0;
					while (k<128)
					{
						printf("%d: %f", k, Descriptors[k]);
						printf("; ");
						k++;
					}

					printf("\n");
					delete[]Descriptors;
					Descriptors = NULL;
				}
			}
			//下一阶  
			if (vl_sift_process_next_octave(SiftFilt) == VL_ERR_EOF)
			{
				break;
			}
			//free(pKeyPoint);  
			KeyPoint = NULL;
		}
	}
	vl_sift_delete(SiftFilt);
	delete[]ImageData;
	ImageData = NULL;
	namedWindow("Source Image", 1);
	imshow("Source Image", img_1);

	waitKey(0);

	return 0;
}
