//
//  JJApi.h
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/17.
//  Copyright © 2015年 JJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JJAFN_ENUM.h"

@class JJApi;

typedef void(^JJApiBlock)(JJApi *api);

@interface JJApi : NSObject

/** 发起请求,代理方式 */
- (void)start;

/** 发起请求,Block方式 */
- (void)startWithSuccess:(JJApiBlock)success failure:(JJApiBlock)failure;

/** 取消请求 */
- (void)cancel;

/** 请求方式,默认GET */
- (JJAFNMethodType)AFNMethod;

/** 请求序列化方式,默认HTTP */
- (JJAFNRequestSerializerType)serializerType;

/** 设置授权HTTP Header,例:@{username:@"username", password:@"password"} */
- (NSDictionary *)authorizationHeaderField;

/** 超时时间,默认10秒 */
- (NSTimeInterval)timeoutInterval;

/** 请求URL */
- (NSString *)URLString;

/** 参数 */
- (id)parameters;

@end
