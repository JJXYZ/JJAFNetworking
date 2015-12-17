//
//  JJApiManager.h
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/17.
//  Copyright © 2015年 JJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "JJApi.h"

#define API_MANAGER [JJApiManager sharedInstance]

@interface JJApiManager : NSObject

#pragma mark - Lifecycle

+ (JJApiManager *)sharedInstance;

#pragma mark - Init

/** 设置最大请求队列数 */
- (void)setMaxConcurrentOperationCount:(NSUInteger)count;

/** 增加一个ContentType,例:@"text/plain" */
- (void)addAcceptableContentType:(NSString *)type;

#pragma mark - Public Methods

/** 当前请求队列中的个数 */
- (NSInteger)curOperationCount;

/** 加入API到队列里面,发起请求 */
- (void)addApi:(JJApi *)api;



@end
