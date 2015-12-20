//
//  JJAFNListApi.h
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/21.
//  Copyright © 2015年 JJ. All rights reserved.
//


/**
 *  请求List的基类,VC再也不用维护page和pagename的问题
 */


#import "JJAFNApi.h"

@class JJAFNListApi;

@protocol JJAFNListApiDelegate <JJApiDeleage>

@optional

/** 请求更多成功 */
- (void)apiMoreSuccess:(JJAFNListApi *)api;

/** 请求更多失败 */
- (void)apiMoreFailed:(JJAFNListApi *)api;

@end

@interface JJAFNListApi : JJAFNApi




@end
