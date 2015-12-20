//
//  JJAFNApi+Log.h
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/18.
//  Copyright © 2015年 JJ. All rights reserved.
//

#import "JJAFNApi.h"

@interface JJAFNApi (Log)

/** 开始请求的时间 */
@property (nonatomic, strong) NSDate *startDate;

/** 打印开始Log */
- (void)logStartApi;

/** 打印结束Log */
- (void)logEndApi;


@end
