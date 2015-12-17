//
//  JJApiManager.m
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/17.
//  Copyright © 2015年 JJ. All rights reserved.
//

#import "JJApiManager.h"
#import "JJAFN_ENUM.h"

@interface JJApiManager ()

/** OperationManager */
@property (nonatomic, strong, readwrite) AFHTTPRequestOperationManager *manager;

@end

@implementation JJApiManager

#pragma mark - Lifecycle

+ (JJApiManager *)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

#pragma mark - Private Methods

#pragma mark - Public Methods

- (void)setMaxConcurrentOperationCount:(NSUInteger)count {
    self.manager.operationQueue.maxConcurrentOperationCount = count;
}

- (NSInteger)curOperationCount {
    return self.manager.operationQueue.operationCount;
}

- (void)addAcceptableContentType:(NSString *)type {
    if (type.length) {
        NSMutableSet *contentTypes = [NSMutableSet setWithSet:_manager.responseSerializer.acceptableContentTypes];
        [contentTypes addObject:type];
        self.manager.responseSerializer.acceptableContentTypes = contentTypes;
    }
}

- (void)addApi:(JJApi *)api {
    
    /** 设置请求序列化方式 */
    if ([api serializerType] == JJAFNRequestSerializer_JSON) {
        self.manager.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    
    /** 设置超时时间 */
    self.manager.requestSerializer.timeoutInterval = [api timeoutInterval];
    
    /** 设置授权HTTP Header */
    NSDictionary *authorizationHeaderField = [api authorizationHeaderField];
    if (authorizationHeaderField.count) {
        [_manager.requestSerializer setAuthorizationHeaderFieldWithUsername:[authorizationHeaderField objectForKey:@"username"] password:[authorizationHeaderField objectForKey:@"password"]];
    }
    
    /** 设置HTTP Header */
    NSDictionary *authorizationHeaderField = [api authorizationHeaderField];
    if (authorizationHeaderField.count) {
        [_manager.requestSerializer setAuthorizationHeaderFieldWithUsername:[authorizationHeaderField objectForKey:@"username"] password:[authorizationHeaderField objectForKey:@"password"]];
    }
    
    NSString *URLString = [api URLString];
    NSString *parameters = [api parameters];
    JJAFNMethodType method = [api AFNMethod];
    if (method == JJAFNMethod_GET) {
        [self.manager GET:URLString parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
            
        } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
            
        }];
    }
    else if (method == JJAFNMethod_POST) {
        
    }
    else if (method == JJAFNMethod_HEAD) {
        
    }
    else if (method == JJAFNMethod_DELETE) {
        
    }
    else if (method == JJAFNMethod_PUT) {
        
    }
    else if (method == JJAFNMethod_PATCH) {
        
    }
}

#pragma mark - Property

- (AFHTTPRequestOperationManager *)manager {
    if (_manager) {
        return _manager;
    }
    _manager = [AFHTTPRequestOperationManager manager];
    /** 同一时间最多允许10个请求并发 */
    _manager.operationQueue.maxConcurrentOperationCount = 10;
    /** 增加contentTypes */
    NSMutableSet *contentTypes = [NSMutableSet setWithSet:_manager.responseSerializer.acceptableContentTypes];
    [contentTypes addObject:@"text/html"];
    [contentTypes addObject:@"text/plain"];
    _manager.responseSerializer.acceptableContentTypes = contentTypes;
    return _manager;
}


@end
