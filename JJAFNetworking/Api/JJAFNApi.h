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

@protocol JJApiDeleage <NSObject>

@optional

/** 请求成功 */
- (void)apiSuccess:(JJAFNApi *)api;

/** 请求失败 */
- (void)apiFailed:(JJAFNApi *)api;

/** 将要发起请求 */
- (void)apiWillstart:(JJAFNApi *)api;

/** 已经发起请求 */
- (void)apiDidstart:(JJAFNApi *)api;

/** 将要开始处理数据(成功) */
- (void)apiWillHandleSuccess:(JJAFNApi *)api;

/** 结束处理数据(成功),回调之后调用 */
- (void)apiDidHandleSuccess:(JJAFNApi *)api;

/** 将要开始处理数据(失败) */
- (void)apiWillHandleFailure:(JJAFNApi *)api;

/** 结束处理数据(失败) */
- (void)apiDidHandleFailure:(JJAFNApi *)api;

/** 将要取消 */
- (void)apiWillCancel:(JJAFNApi *)api;

/** 已经取消 */
- (void)apiDidCancel:(JJAFNApi *)api;

@end


#pragma mark

@interface JJAFNApi : NSObject

#pragma mark Property

/** 请求的索引,区分相同Api的赋值 */
@property (nonatomic, assign) NSUInteger index;

/** 代理 */
@property (nonatomic, weak) id<JJApiDeleage> delegate;

/** Block */
@property (nonatomic, copy) JJApiBlock apiSuccessBlock;
@property (nonatomic, copy) JJApiBlock apiFailureBlock;

/** Block,需要使用到的就赋值 */
@property (nonatomic, copy) JJApiBlock apiWillstartBlock;
@property (nonatomic, copy) JJApiBlock apiDidstartBlock;
@property (nonatomic, copy) JJApiBlock apiWillHandleSuccessBlock;
@property (nonatomic, copy) JJApiBlock apiDidHandleSuccessBlock;
@property (nonatomic, copy) JJApiBlock apiWillHandleFailureBlock;
@property (nonatomic, copy) JJApiBlock apiDidHandleFailureBlock;
@property (nonatomic, copy) JJApiBlock apiWillCancelBlock;
@property (nonatomic, copy) JJApiBlock apiDidCancelBlock;

/** AFN的operation */
@property (nonatomic, strong) AFHTTPRequestOperation *requestOperation;

/** 服务端返回的responseObject */
@property (nonatomic, strong, readonly) id responseObject;

/** 服务端返回的状态码,例:404 */
@property (nonatomic, assign, readonly) NSInteger responseStatusCode;

/** 服务端返回的header字段 */
@property (nonatomic, strong, readonly) NSDictionary *responseAllHeaderFields;

/** 输入的参数,网络请求前赋值,会转成parameters */
@property (nonatomic, strong) JJAFNInput *input;

/** 输出的参数,重写reformData方法给其赋值 */
@property (nonatomic, strong) id output;

#pragma mark Public Methods

/** 发起请求,代理方式 */
- (void)start;

/** 发起请求,Block方式 */
- (void)startWithSuccess:(JJApiBlock)success failure:(JJApiBlock)failure;

/** 取消请求 */
- (void)cancel;

/** 把block置nil来打破循环引用 */
- (void)clearBlock;

@end
