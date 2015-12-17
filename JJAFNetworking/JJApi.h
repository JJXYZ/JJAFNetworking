//
//  JJApi.h
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/17.
//  Copyright © 2015年 JJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "JJAFN_ENUM.h"

@class JJApi;

typedef void(^JJApiBlock)(JJApi *api);
typedef void(^JJApiSuccessBlock)(JJApi *api);
typedef void(^JJApiFailureBlock)(JJApi *api);


@protocol JJApiDeleage <NSObject>

- (void)apiSuccess:(JJApi *)api;
- (void)apiFailed:(JJApi *)api;

@end

@interface JJApi : NSObject

/** 代理 */
@property (nonatomic, weak) id<JJApiDeleage> delegate;

/** SuccessBlock */
@property (nonatomic, copy) JJApiSuccessBlock apiSuccessBlock;

/** FailureBlock */
@property (nonatomic, copy) JJApiFailureBlock apiFailureBlock;

/** AFN的operation */
@property (nonatomic, strong) AFHTTPRequestOperation *requestOperation;

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
