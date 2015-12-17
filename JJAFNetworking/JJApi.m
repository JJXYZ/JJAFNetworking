//
//  JJApi.m
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/17.
//  Copyright © 2015年 JJ. All rights reserved.
//

#import "JJApi.h"


@implementation JJApi

#pragma mark - Lifecycle
#pragma mark - Private Methods
#pragma mark - Public Methods

- (void)start {
    
}

- (void)startWithSuccess:(JJApiBlock)success failure:(JJApiBlock)failure {
    
}


- (void)cancel {
    
}

- (JJAFNRequestSerializerType)serializerType {
    return JJAFNRequestSerializer_HTTP;
}

- (NSDictionary *)authorizationHeaderField {
    return nil;
}

- (NSTimeInterval)timeoutInterval {
    return 10;
}

- (JJAFNMethodType)AFNMethod {
    return JJAFNMethod_GET;
}

- (NSString *)URLString {
    return nil;
}

- (id)parameters {
    return nil;
}

#pragma mark - Inherit
#pragma mark - Event
#pragma mark - Property

@end
