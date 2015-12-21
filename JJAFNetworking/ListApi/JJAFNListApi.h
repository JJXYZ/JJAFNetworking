//
//  JJAFNListApi.h
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/21.
//  Copyright © 2015年 JJ. All rights reserved.
//


/**
 *  请求List的基类,VC再也不用维护page和pagename的问题
    父类的JJAFNInput传入JJAFNListInput类型
 */


#import "JJAFNApi.h"

@class JJAFNListApi;

@protocol JJAFNListApiDelegate <JJApiDelegate>

@optional

/** 请求更多成功 */
- (void)apiMoreSuccess:(JJAFNListApi *)api;

/** 请求更多失败 */
- (void)apiMoreFailed:(JJAFNListApi *)api;

@end

@interface JJAFNListApi : JJAFNApi

/** 当前的页数 */
@property (nonatomic, assign, readonly) NSUInteger page;

/** 刷新数据 */
- (void)refreshData;

/** 加载更多 */
- (void)loadMoreData;


@end
