//
//  JJAFNApi+HandleMethod.h
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/17.
//  Copyright © 2015年 JJ. All rights reserved.
//

#import "JJAFNApi.h"

@interface JJAFNApi (HandleMethod)

#pragma mark - Inherit

/** 将要发起请求 */
- (void)willstart;

/** 已经发起请求 */
- (void)didstart;

/** 将要开始处理数据(成功) */
- (void)willHandleSuccess;

/**  解析数据,在willHandleSuccess后,回调之前调用,赋值给output */
- (void)reformData;

/** 处理数据(成功) */
- (void)handleSuccess;

/** 结束处理数据(成功),回调之后调用 */
- (void)didHandleSuccess;

/** 将要开始处理数据(失败) */
- (void)willHandleFailure;

/** 处理数据(失败) */
- (void)handleFailure;

/** 结束处理数据(失败) */
- (void)didHandleFailure;

/** 将要取消 */
- (void)willCancel;

/** 已经取消 */
- (void)didCancel;

@end
