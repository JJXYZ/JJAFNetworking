//
//  JJApi+RewriteMethod.m
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/17.
//  Copyright © 2015年 JJ. All rights reserved.
//

#import "JJApi+RewriteMethod.h"
#import "MJExtension.h"

@implementation JJApi (RewriteMethod)

#pragma mark - Inherit

- (JJApiRequestSerializerType)serializerType {
    return JJApiRequestSerializer_HTTP;
}

- (NSOperationQueuePriority)queuePriority {
    return NSOperationQueuePriorityNormal;
}

- (NSDictionary *)headerField {
    return nil;
}

- (NSDictionary *)authorizationHeaderField {
    return nil;
}

- (JJApiHTTPType)AFNHTTPType {
    return JJApiHTTPType_HTTP;
}

- (NSTimeInterval)timeoutInterval {
    return 10;
}

- (JJApiMethodType)AFNMethod {
    return JJApiMethod_GET;
}

- (NSString *)URLString {
    return nil;
}

- (NSString *)customURLString {
    return nil;
}

- (id)parameters {
    return self.input.mj_JSONObject;
}


@end
