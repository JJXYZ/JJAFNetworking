//
//  JJGroupApi.h
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/23.
//  Copyright © 2015年 JJ. All rights reserved.
//


/**
 *  该类处理一组api请求
 */


#import <Foundation/Foundation.h>
#import "JJApiDefine.h"

@class JJGroupApi;

typedef void(^JJGroupApiBlock)(JJGroupApi *api);

@protocol JJGroupApiDelegate <NSObject>

@optional

/** 全部请求成功 */
- (void)groupApiSuccess:(JJGroupApi *)groupApi;

/** 全部请求失败 */
- (void)groupApiFailure:(JJGroupApi *)groupApi;

/** 全部请求完成(成功/失败) */
- (void)groupApiComplete:(JJGroupApi *)groupApi;

@end

@interface JJGroupApi : NSObject

/** 成员是JJApi的数组 */
@property (nonatomic, copy) NSArray *groupApiArr;

/** 发起请求,代理方式 */
- (void)start;

/** 发起请求,Block方式 */
- (void)startWithGroupSuccess:(JJGroupApiBlock)success failure:(JJGroupApiBlock)failure;

/** 取消请求 */
- (void)cancel;


@end
