//
//  JJApi+RewriteMethod.m
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/17.
//  Copyright © 2015年 JJ. All rights reserved.
//

#import "JJApi+RewriteMethod.h"

@implementation JJApi (RewriteMethod)

#pragma mark - Inherit

- (JJAFNRequestSerializerType)serializerType {
    return JJAFNRequestSerializer_HTTP;
}


- (NSDictionary *)headerField {
    return nil;
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

- (NSString *)customURLString {
    return nil;
}

- (id)parameters {
    return nil;
}


@end
