//
//  JJAFNListInput.h
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/21.
//  Copyright © 2015年 JJ. All rights reserved.
//

#import "JJAFNInput.h"

@interface JJAFNListInput : JJAFNInput

/**
 *  当前的页面
 */
@property (nonatomic, assign) NSUInteger page;

/**
 *  每页请求的个数
 */
@property (nonatomic, assign) NSUInteger pagenum;

@end
