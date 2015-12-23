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
#import "JJApi_ENUM.h"
#import "JJApiInput.h"
#import "JJApiDefine.h"

@class JJApi;
@class JJApiInput;

typedef void(^JJApiBlock)(JJApi *api);

@protocol JJApiDelegate <NSObject>

@optional

/** 请求成功 */
- (void)apiSuccess:(JJApi *)api;

/** 请求失败 */
- (void)apiFailed:(JJApi *)api;

/** 将要发起请求 */
- (void)apiWillstart:(JJApi *)api;

/** 已经发起请求 */
- (void)apiDidstart:(JJApi *)api;

/** 将要开始处理数据(成功) */
- (void)apiWillHandleSuccess:(JJApi *)api;

/** 结束处理数据(成功),回调之后调用 */
- (void)apiDidHandleSuccess:(JJApi *)api;

/** 将要开始处理数据(失败) */
- (void)apiWillHandleFailure:(JJApi *)api;

/** 结束处理数据(失败) */
- (void)apiDidHandleFailure:(JJApi *)api;

/** 将要取消 */
- (void)apiWillCancel:(JJApi *)api;

/** 已经取消 */
- (void)apiDidCancel:(JJApi *)api;

@end


#pragma mark

@interface JJApi : NSObject

#pragma mark Property

/** 请求的索引,区分相同Api的赋值 */
@property (nonatomic, assign) NSUInteger index;

/** 代理 */
@property (nonatomic, weak) id<JJApiDelegate> delegate;

/** Block */
@property (nonatomic, copy) JJApiBlock apiSuccessBlock;
@property (nonatomic, copy) JJApiBlock apiFailureBlock;


/** AFN的operation */
@property (nonatomic, strong) AFHTTPRequestOperation *requestOperation;

/** 服务端返回的responseObject */
@property (nonatomic, strong, readonly) id responseObject;

/** 服务端返回的状态码,例:404 */
@property (nonatomic, assign, readonly) NSInteger responseStatusCode;

/** 服务端返回的header字段 */
@property (nonatomic, strong, readonly) NSDictionary *responseAllHeaderFields;

/** 输入的参数(JJApiInput类或者子类),网络请求前赋值,会转成parameters */
@property (nonatomic, strong) JJApiInput *input;

/** 输出的参数,重写reformData方法给其赋值,默认为responseObject */
@property (nonatomic, strong) id output;

#pragma mark Public Methods

/** 发起请求,代理方式 */
- (void)start;

/** 发起请求,Block方式 */
- (void)startWithSuccess:(JJApiBlock)success failure:(JJApiBlock)failure;

/** 取消请求 */
- (void)cancel;

@end
