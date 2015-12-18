//
//  JJApi.h
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/17.
//  Copyright © 2015年 JJ. All rights reserved.
//



/**
 *  该类用于封装一个api请求相关的各种处理，包括发起请求，处理请求返回数据等
 */



#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "JJAFN_ENUM.h"


@class JJAFNApi;
@class JJAFNInput;

typedef void(^JJApiBlock)(JJAFNApi *api);
typedef void(^JJApiSuccessBlock)(JJAFNApi *api);
typedef void(^JJApiFailureBlock)(JJAFNApi *api);


@protocol JJApiDeleage <NSObject>

- (void)apiSuccess:(JJAFNApi *)api;
- (void)apiFailed:(JJAFNApi *)api;

@end

@interface JJAFNApi : NSObject

/** 代理 */
@property (nonatomic, weak) id<JJApiDeleage> delegate;

/** SuccessBlock */
@property (nonatomic, copy) JJApiSuccessBlock apiSuccessBlock;

/** FailureBlock */
@property (nonatomic, copy) JJApiFailureBlock apiFailureBlock;

/** AFN的operation */
@property (nonatomic, strong) AFHTTPRequestOperation *requestOperation;

/** 服务端返回的responseObject */
@property (nonatomic, strong, readonly) id responseObject;

/** 服务端返回的状态码,例:404 */
@property (nonatomic, assign, readonly) NSInteger responseStatusCode;

/** 服务端返回的header字段 */
@property (nonatomic, strong, readonly) NSDictionary *responseAllHeaderFields;


/** 输入的参数,网络请求前赋值,会自动转成parameters */
@property (nonatomic, strong) JJAFNInput *input;

/** 输出的参数 */
@property (nonatomic, strong) id output;

#pragma mark - Public Methods

/** 发起请求,代理方式 */
- (void)start;

/** 发起请求,Block方式 */
- (void)startWithSuccess:(JJApiBlock)success failure:(JJApiBlock)failure;

/** 取消请求 */
- (void)cancel;

/** 把block置nil来打破循环引用 */
- (void)clearBlock;

@end
