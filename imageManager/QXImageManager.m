//
//  QXImageManager.m
//  QXHTTP
//
//  Created by 新然 on 2017/3/31.
//  Copyright © 2017年 com.wrqx. All rights reserved.
//

#import "QXImageManager.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation QXImageManager

+(void)setImageWithUrl:(NSString *)url options:(SDWebImageOptions)options progress:(void (^)(NSInteger, NSInteger))progressBlock completed:(CompletionFinishBlock)completedBlock{
    [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:url] options:options progress:progressBlock completed:completedBlock];
}

+(void)setImage:(UIImageView *)imageView withUrl:(NSString *)url placeHonderImage:(UIImage *)img{

    [imageView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:img];
}

//+(void)setImage:(UIImageView *)imgView gifName:(NSString *)gifName{
//    UIImage* img=[UIImage animatedImageWithImages:(nonnull NSArray<UIImage *> *) duration:<#(NSTimeInterval)#>];
//
//}

+(void)setImage:(UIImageView *)imageView withUrl:(NSString *)url completed:(void (^)(UIImage *, NSError *, SDImageCacheType, NSURL *))completedBlock

{

    [imageView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:nil completed:completedBlock];

}

+(void)setImage:(UIImageView *)imageView withUrl:(NSString *)url placeHonderImage:(UIImage *)img options:(SDWebImageOptions)options progress:(void (^)(NSInteger, NSInteger))progressBlock completed:(void (^)(UIImage *, NSError *, SDImageCacheType, NSURL *))completedBlock{
    [imageView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:img options:options progress:progressBlock completed:completedBlock];

}

+(void)cancellAllImgLoader{
    [[SDWebImageManager sharedManager] cancelAll];
}

+(void)cleanPastOrOverSizeFile{
    [[SDWebImageManager sharedManager].imageCache cleanDisk];

}

+(void)cleanPastOrOverSizeFileWithCompletion:(void (^)())com{
    [[SDWebImageManager sharedManager].imageCache cleanDiskWithCompletionBlock:com];
}

+(void)clearDiskFile{
    [[SDWebImageManager sharedManager].imageCache clearDisk];

}

+(void)clearDiskFileWithCompletion:(void (^)())com{

    [[SDWebImageManager sharedManager].imageCache clearDiskOnCompletion:com];
}

+(void)clearNowAndCreatNew{
    [[SDWebImageManager sharedManager].imageCache clearMemory];
}


@end
