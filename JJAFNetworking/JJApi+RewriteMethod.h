//
//  JJApi+RewriteMethod.h
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/17.
//  Copyright © 2015年 JJ. All rights reserved.
//

#import "JJApi.h"

@interface JJApi (RewriteMethod)

#pragma mark - Inherit

/** 请求方式,默认GET */
- (JJAFNMethodType)AFNMethod;

/** 请求序列化方式,默认HTTP */
- (JJAFNRequestSerializerType)serializerType;

/** 设置HTTP Header */
- (NSDictionary *)headerField;

/** 设置授权HTTP Header,例:@{username:@"username", password:@"password"} */
- (NSDictionary *)authorizationHeaderField;

/** 超时时间,默认10秒 */
- (NSTimeInterval)timeoutInterval;

/** 请求URL */
- (NSString *)URLString;

/** 自定义的请求URL,先使用该值,不存在再使用URLString */
- (NSString *)customURLString;

/** 上传的参数 */
- (id)parameters;


@end
