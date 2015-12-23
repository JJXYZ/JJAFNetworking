//
//  JJGroupApi.h
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/23.
//  Copyright © 2015年 JJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JJApiDefine.h"

@class JJGroupApi;
@protocol JJGroupApiDelegate <NSObject>

/** 请求成功 */
- (void)groupApiSuccess:(JJGroupApi *)groupApi;

/** 请求失败 */
- (void)groupApiFailed:(JJGroupApi *)groupApi;


@end

@interface JJGroupApi : NSObject

/** 成员是JJApi的数组 */
@property (nonatomic, copy) NSArray *groupApiArr;

/** 发起请求,代理方式 */
- (void)start;

/** 发起请求,Block方式 */
- (void)startWithSuccess:(JJApiBlock)success failure:(JJApiBlock)failure;

/** 取消请求 */
- (void)cancel;


@end
