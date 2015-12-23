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
#import "JJApiInput.h"

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


#pragma mark - Property

- (id)responseObject {
    return self.requestOperation.responseObject;
}

- (NSInteger)responseStatusCode {
    return self.requestOperation.response.statusCode;
}

- (NSDictionary *)responseAllHeaderFields {
    return self.requestOperation.response.allHeaderFields;
}



@end
