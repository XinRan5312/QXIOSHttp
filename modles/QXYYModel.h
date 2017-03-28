//
//  QXYYModel.h
//  QXHTTP
//
//  Created by 新然 on 2017/3/27.
//  Copyright © 2017年 com.wrqx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QXYYModel : NSObject
+(BOOL) json2Model:(NSDictionary*)jsonString model:(id) model;
+(NSString*) model2JSONString:(id) model;
+(NSDictionary*) modle2JSONObject:(id) model;
@end
