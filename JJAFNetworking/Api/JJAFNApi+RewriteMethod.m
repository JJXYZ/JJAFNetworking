//
//  JJAFNApi+RewriteMethod.m
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/17.
//  Copyright © 2015年 JJ. All rights reserved.
//

#import "JJAFNApi+RewriteMethod.h"

@implementation JJAFNApi (RewriteMethod)

#pragma mark - Inherit

- (JJAFNRequestSerializerType)serializerType {
    return JJAFNRequestSerializer_HTTP;
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

- (JJAFNHTTPType)AFNHTTPType {
    return JJAFNHTTPType_HTTP;
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

- (NSString *)customURLString {
    return nil;
}

- (id)parameters {
    return self.input;
}


@end
