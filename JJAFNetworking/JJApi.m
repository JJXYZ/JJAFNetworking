//
//  JJApi.m
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/17.
//  Copyright © 2015年 JJ. All rights reserved.
//

#import "JJApi.h"
#import "JJApi+HandleMethod.h"
#import "JJApiManager.h"

@implementation JJApi

#pragma mark - Public Methods

- (void)start {
    [API_MANAGER startApi:self];
}

- (void)startWithSuccess:(JJApiBlock)success failure:(JJApiBlock)failure {
    self.apiSuccessBlock = success;
    self.apiFailureBlock = failure;
    [API_MANAGER startApi:self];
}


- (void)cancel {
    [API_MANAGER cancelApi:self];
}

- (void)clearBlock {
    self.apiSuccessBlock = nil;
    self.apiFailureBlock = nil;
}



@end
