//
//  JJApi+Log.m
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/18.
//  Copyright © 2015年 JJ. All rights reserved.
//

#import "JJApi+Log.h"
#import "JJApi+RewriteMethod.h"
#import "JJApi_ENUM.h"
#import <objc/runtime.h>


@interface JJApi ()

/** 开始请求的时间 */
@property (nonatomic, strong) NSDate *startDate;

@end

@implementation JJApi (Log)

#pragma mark - Public Methods

- (void)logStartApi {
#ifdef DEBUG
    NSMutableString *logStr = [NSMutableString string];
    [logStr appendFormat:@"\n-------------------请求开始------------------\n"];
    [logStr appendFormat:@"请求方式:%@\n", [self stringForMethod]];
    [logStr appendFormat:@"请求地址:%@\n", self.URLString];
    [logStr appendFormat:@"请求参数:%@\n", self.parameters];
    [logStr appendFormat:@"HeaderFields:%@\n", self.responseAllHeaderFields];
    [logStr appendFormat:@"----------------------------------------------\n\n\n"];
    
    NSLog(@"%@", logStr);
#endif
}

- (void)logEndApi {
#ifdef DEBUG
    NSMutableString *logStr = [NSMutableString string];
    [logStr appendFormat:@"\n=================请求结束=================\n"];
    NSTimeInterval timeDuring =[[NSDate date] timeIntervalSinceDate:self.startDate];
    [logStr appendFormat:@"请求耗时:%.3f秒\n", timeDuring];
    NSURLRequest *request = self.requestOperation.request;
    [logStr appendFormat:@"请求地址:%@://%@%@\n", request.URL.scheme, request.URL.host, request.URL.path];
    [logStr appendFormat:@"GET子串:%@\n", self.requestOperation.request.URL.query];
    [logStr appendFormat:@"返回JSON数据:%@\n", self.requestOperation.responseString];
    NSError *error = self.requestOperation.error;
    if (error) {
        [logStr appendFormat:@"Error Domain:%@\n", error.domain];
        [logStr appendFormat:@"Error Domain Code:%ld\n", (long)error.code];
        [logStr appendFormat:@"Error Localized Description:%@\n", error.localizedDescription];
        [logStr appendFormat:@"Error Localized Failure Reason:%@\n", error.localizedFailureReason];
        [logStr appendFormat:@"Error Localized Recovery Suggestion:%@\n", error.localizedRecoverySuggestion];
    }
    [logStr appendFormat:@"===========================================\n\n\n"];
    
    NSLog(@"%@", logStr);
#endif
}

#pragma mark - Private Methods

- (NSString *)stringForMethod {
    switch (self.AFNMethod) {
        case JJApiMethod_GET:
            return @"GET";
            break;
        case JJApiMethod_POST:
            return @"POST";
            break;
        case JJApiMethod_HEAD:
            return @"HEAD";
            break;
        case JJApiMethod_PUT:
            return @"PUT";
            break;
        case JJApiMethod_DELETE:
            return @"DELETE";
            break;
        case JJApiMethod_PATCH:
            return @"PATCH";
            break;
        default:
            break;
    }
    return @"UNKNOW";
}

#pragma mark - Property

static char kApiStartDateKey;
- (NSDate *)startDate {
    return (NSDate *)objc_getAssociatedObject(self, &kApiStartDateKey);
}

- (void)setStartDate:(NSDate *)startDate {
    objc_setAssociatedObject(self, &kApiStartDateKey, startDate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end
