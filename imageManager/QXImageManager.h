//
//  QXImageManager.h
//  QXHTTP
//
//  Created by 新然 on 2017/3/31.
//  Copyright © 2017年 com.wrqx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
typedef void(^CompletionFinishBlock)(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL);


@interface QXImageManager : NSObject


/**
 1.可以显示下载进度条
 2.SDWebImage的默认缓存时间是一周
 3.最大并发数量 == 6
 4.缓存文件的保存名称如何处理? 拿到图片的URL路径,对该路径进行MD5加密
 5.该框架内部对内存警告的处理方式? 内部通过监听通知的方式请你缓存
 6.该框架进行缓存处理的方式:可变字典--->NSCache
 7.如何判断图片的类型: 在判断图片类型的时候，只匹配第一个字节
 8.队列中任务的处理方式:FIFO
 9.如何下载图片的? 发送网络请求下载图片,NSURLConnection
 10.请求超时的时间 15秒

 
 */

+(void)setImage:(UIImageView*) imageView withUrl:(NSString*)url placeHonderImage:(UIImage*)img options:(SDWebImageOptions) options progress:(void (^)(NSInteger receiveSize,NSInteger expectedSize))progressBlock completed:(void (^)(UIImage* img,NSError* error,SDImageCacheType cacheType,NSURL* url))completedBlock;
/*
 第一个参数：要下载图片的url地址
 第二个参数：设置该imageView的占位图片
 第三个参数：传一个枚举值，告诉程序你下载图片的策略是什么
 第一个block块：获取当前图片数据的下载进度
      receivedSize：已经下载完成的数据大小
      expectedSize：该文件的数据总大小
 第二个block块：当图片下载完成之后执行该block中的代码
     image:下载得到的图片数据
     error:下载出现的错误信息
     SDImageCacheType：图片的缓存策略（不缓存，内存缓存，沙盒缓存）
     imageURL：下载的图片的url地址
 */
+(void)setImageWithUrl:(NSString*)url  options:(SDWebImageOptions) options progress:(void (^)(NSInteger receiveSize,NSInteger expectedSize))progressBlock completed:(CompletionFinishBlock)completedBlock;

+(void)setImage:(UIImageView*) imageView  withUrl:(NSString*)url placeHonderImage:(UIImage*)img completed:(void (^)(UIImage* img,NSError* error,SDImageCacheType cacheType,NSURL* url))completedBlock;

+(void)setImage:(UIImageView*) imageView withUrl:(NSString*)url  completed:(void (^)(UIImage* img,NSError* error,SDImageCacheType cacheType,NSURL* url))completedBlock;

+(void)setImage:(UIImageView*) imageView withUrl:(NSString*)url placeHonderImage:(UIImage*)img;

+(void)setImage:(UIImageView*) imgView gifName:(NSString*)gifName;
/**
 取消当前正在进行的所有下载操作
 [[SDWebImageManager sharedManager] cancelAll];
 */

+(void)cancellAllImgLoader;


/**
    cleanDisk:删除过期的文件数据，计算当前未过期的已经下载的文件数据的大小，如果发现该数据大小大于我们设置的最大缓存数据大小，
     那么程序内部会按照按文件数据缓存的时间从远到近删除，知道小于最大缓存数据为止。
     [[SDWebImageManager sharedManager].imageCache cleanDisk];
 */

+(void)cleanPastOrOverSizeFile;//cleanDisk

+(void)clearDiskFile;//clearDisk
+(void)cleanPastOrOverSizeFileWithCompletion:(void (^)())com;//cleanDisk

+(void)clearDiskFileWithCompletion:(void (^)())com;//clearDisk

/**
   clearMemory:直接删除文件，重新创建新的文件夹
 [[SDWebImageManager sharedManager].imageCache clearMemory];
 
 */

+(void)clearNowAndCreatNew;//clearMemory

@end
