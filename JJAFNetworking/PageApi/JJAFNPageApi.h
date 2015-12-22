//
//  JJAFNListApi.h
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/21.
//  Copyright © 2015年 JJ. All rights reserved.
//


/**
 *  1.请求分页的基类,VC再也不用维护page和pagename的问题
    2.作为成员变量使用,里面有维护变量page
 */


#import "JJAFNApi.h"

@class JJAFNPageApi;

@protocol JJAFNPageApiDelegate <JJApiDelegate>

@optional

/** 请求更多成功 */
- (void)apiMoreSuccess:(JJAFNPageApi *)api;

/** 请求更多失败 */
- (void)apiMoreFailed:(JJAFNPageApi *)api;

@end

@interface JJAFNPageApi : JJAFNApi

/** 代理 */
@property (nonatomic, weak) id<JJAFNPageApiDelegate> delegate;

/** 当前的页数 */
@property (nonatomic, assign, readonly) NSUInteger page;

/** Block */
@property (nonatomic, copy) JJApiBlock apiMoreSuccessBlock;
@property (nonatomic, copy) JJApiBlock apiMoreFailureBlock;

/** 刷新数据,代理方式 */
- (void)refreshData;

/** 加载更多,代理方式 */
- (void)loadMoreData;

/** 刷新数据,Block方式 */
- (void)refreshWithSuccess:(JJApiBlock)success failure:(JJApiBlock)failure;

/** 加载更多,Block方式 */
- (void)loadMoreWithSuccess:(JJApiBlock)success failure:(JJApiBlock)failure;


@end
