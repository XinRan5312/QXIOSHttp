//
//  QXYYModel.m
//  QXHTTP
//
//  Created by 新然 on 2017/3/27.
//  Copyright © 2017年 com.wrqx. All rights reserved.
//

#import "QXYYModel.h"
#import <YYModel.h>
@implementation QXYYModel
+(BOOL) json2Model:(NSDictionary *)jsonString model:(id) modle{
 
    return [modle yy_modelSetWithDictionary:jsonString];

}

+(NSString*)model2JSONString:(id)model{

   return  [model yy_modelToJSONString];
}

+(NSDictionary*)modle2JSONObject:(id)model{

    return [model yy_modelToJSONObject];
}
@end
