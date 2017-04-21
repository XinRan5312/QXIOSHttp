//
//  QXAFNetworkTools.m
//  QXHTTP
//
//  Created by 新然 on 2017/3/28.
//  Copyright © 2017年 com.wrqx. All rights reserved.
//

#import "QXAFNetworkTools.h"
#import <AFNetworking.h>
#import "QXBaseRequest.h"
@interface QXAFNetworkTools()
@property(nonatomic,strong)AFURLSessionManager *urlSessionManager;
@property(nonatomic,strong)NSString *baseUrl;
@end
@implementation QXAFNetworkTools
-(instancetype)init{
    if(self=[super init]){
    NSURLSessionConfiguration *config=[NSURLSessionConfiguration defaultSessionConfiguration];
        //设置Header
    [config setHTTPAdditionalHeaders:@{@"User-Agent":@"qx&wr",@"Deveice":@"Android",@"Version":@"1.1.1"}];
        //设置缓存大小
    NSURLCache *urlCache=[[NSURLCache alloc]initWithMemoryCapacity:16*1024*1024 diskCapacity:60*1024*1024 diskPath:nil];
    [config setURLCache:urlCache];
    
        _urlSessionManager=[[AFURLSessionManager alloc] initWithSessionConfiguration:config];
        //设置返回解析方式有好多种看源码
        _urlSessionManager.responseSerializer=[AFJSONResponseSerializer serializer];
        _baseUrl=@"";
        return self;
    
    }else{
        return nil;
    }
    
}
-(void)startRequest:(QXBaseRequest *)request{
    if(request){
        request.requestStatus=QXHTTPRequestStatusStart;
        NSMutableURLRequest *urlRequest;
            
            if(request.httpMethod){
                
                QXHTTPMethod method=request.httpMethod;
                NSString *reqMethod;
                
                switch (method) {
                    case QXHTTPMethodGet:
                        reqMethod=@"GET";
                        break;
                    case QXHTTPMethodPost:
                        reqMethod=@"POST";
                        break;
                    default:
                        reqMethod=@"GET";
                        break;
                }
                urlRequest=[[AFHTTPRequestSerializer serializer] requestWithMethod:reqMethod URLString:[_baseUrl stringByAppendingPathComponent:request.requestPath] parameters:request.paramsDictionary error:nil];
                NSURLSessionTask *task=[self createURLSessionTask:request nsRequest:urlRequest];
                if(request.requestTag){
//                    [task setTaskDescription:request.requestPath];
//                    [_taskDic setObject:task forKey:request.requestTag];
//                    
//                    [self.requestsDictionary setObject:request forKey:request.requestTag];
                    
                }
                [task resume];
                request.requestStatus=QXHTTPRequestStatusDoing;
            }
            
        }
}

-(NSURLSessionTask*)createURLSessionTask:(QXBaseRequest*)request nsRequest:(NSMutableURLRequest*) nsRequest{
    NSURLSessionTask * task=nil;
    QXHTTPReqeustType requestType=request.requestType;
    if(requestType==QXHTTPReqeustTypeData){
        task=[_urlSessionManager dataTaskWithRequest:nsRequest uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse *response,id responseObject,NSError *error){
        
        }];
        
    }else if(requestType==QXHTTPReqeustTypeUpLoadFiles){
        
        task=[_urlSessionManager uploadTaskWithStreamedRequest:nsRequest progress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
            
        }];
    }else if(requestType==QXHTTPReqeustTypeDownLoadFiles){
        task=[_urlSessionManager downloadTaskWithRequest:nsRequest progress:nil destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
            return targetPath;
        } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
            
        }];
        
    }
    
    return task;
}

@end
