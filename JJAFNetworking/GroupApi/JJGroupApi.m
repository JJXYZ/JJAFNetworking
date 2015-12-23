//
//  JJGroupApi.m
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/23.
//  Copyright © 2015年 JJ. All rights reserved.
//

#import "JJGroupApi.h"
#import "JJApi.h"

@interface JJGroupApi () <JJApiDelegate>

/** 请求完成数量 */
@property (nonatomic, assign) NSUInteger completeNum;

/** 请求成功数量 */
@property (nonatomic, assign) NSUInteger successNum;

/** 请求失败数量 */
@property (nonatomic, assign) NSUInteger failureNum;

@end

@implementation JJGroupApi

#pragma mark - Public Methods

- (void)start {
    for (JJApi *api in self.groupApiArr) {
        api.delegate = self;
        [api start];
    }
}

- (void)startWithGroupSuccess:(JJGroupApiBlock)success failure:(JJGroupApiBlock)failure {
    
}

- (void)cancel {

}

#pragma mark - JJApiDelegate
- (void)apiSuccess:(JJApi *)api {
    
}

- (void)apiFailed:(JJApi *)api {
    
}


#pragma mark - Property


@end
