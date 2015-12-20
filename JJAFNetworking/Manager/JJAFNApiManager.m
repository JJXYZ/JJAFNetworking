//
//  JJApiManager.m
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/17.
//  Copyright © 2015年 JJ. All rights reserved.
//

#import "JJAFNApiManager.h"
#import "AFNetworking.h"
#import "JJAFN_ENUM.h"
#import "JJAFNApi.h"
#import "JJAFNApi+RewriteMethod.h"
#import "JJAFNApi+HandleMethod.h"
#import "JJAFNApi+Log.h"

@interface JJAFNApiManager ()

/** OperationManager */
@property (nonatomic, strong, readwrite) AFHTTPRequestOperationManager *manager;

/** 当前存在的请求 */
@property (nonatomic, strong, readwrite) NSMutableDictionary *apiActiveDic;

@end

@implementation JJAFNApiManager

#pragma mark - Lifecycle

+ (JJAFNApiManager *)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

#pragma mark - Private Methods

/** 设置超时时间 */
- (void)configTimeoutInterval:(JJAFNApi *)api {
    self.manager.requestSerializer.timeoutInterval = [api timeoutInterval];
}

/** 设置请求序列化方式 */
- (void)configRequestSerializer:(JJAFNApi *)api {
    if ([api serializerType] == JJAFNRequestSerializer_JSON) {
        self.manager.requestSerializer = [AFJSONRequestSerializer serializer];
    }
}

/** 设置授权HTTP Header */
- (void)configAuthorizationHeaderField:(JJAFNApi *)api {
    NSDictionary *authorizationHeaderField = [api authorizationHeaderField];
    if (authorizationHeaderField.count) {
        [_manager.requestSerializer setAuthorizationHeaderFieldWithUsername:[authorizationHeaderField objectForKey:@"username"] password:[authorizationHeaderField objectForKey:@"password"]];
    }
}

/** 设置HTTP HeaderField */
- (void)configHeaderField:(JJAFNApi *)api {
    NSDictionary *headerField = [api headerField];
    if (headerField.count) {
        for (id hf in headerField.allKeys) {
            id value = headerField[hf];
            if ([hf isKindOfClass:[NSString class]] && [value isKindOfClass:[NSString class]]) {
                [_manager.requestSerializer setValue:value forHTTPHeaderField:hf];
            }
        }
    }
}

/** HTTPS请求 */
- (void)configHTTPS:(JJAFNApi *)api {
    if ([api AFNHTTPType] == JJAFNHTTPType_HTTPS) {
        AFSecurityPolicy * securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
        securityPolicy.allowInvalidCertificates = YES;
        securityPolicy.validatesDomainName = YES;
        self.manager.securityPolicy = securityPolicy;
    }
}

/** api的优先级 */
- (void)configQueuePriority:(JJAFNApi *)api {
    api.requestOperation.queuePriority = [api queuePriority];
}

/** 获取URL */
- (NSString *)getURLString:(JJAFNApi *)api {
    if ([api customURLString].length) {
        return [api customURLString];
    }
    else {
        return [api URLString];
    }
}

/** 获取参数 */
- (id)getParameters:(JJAFNApi *)api {
    return [api parameters];
}

#pragma mark  API Result

/** 处理请求成功 */
- (void)handleSuccessApi:(JJAFNApi *)api operation:(AFHTTPRequestOperation *)operation {
    
    [api logEndApi];
    
    [api willHandleSuccess];
    
    [api reformData];
    
    [api handleSuccess];
    
    [self removeOperation:operation];
    
    [api clearBlock];
    
    [api didHandleSuccess];
}

/** 处理请求失败 */
- (void)handleFailureApi:(JJAFNApi *)api operation:(AFHTTPRequestOperation *)operation {
    
    [api logEndApi];
    
    [api willHandleFailure];
    
    [api handleFailure];
    
    [self removeOperation:operation];
    
    [api clearBlock];
    
    [api didHandleFailure];
}

#pragma mark Operation

- (NSString *)requestHashKey:(AFHTTPRequestOperation *)operation {
    NSString *key = [NSString stringWithFormat:@"%lu", (unsigned long)[operation hash]];
    return key;
}

/** 记录请求的Api */
- (void)addOperation:(JJAFNApi *)api {
    if (api.requestOperation) {
        NSString *key = [self requestHashKey:api.requestOperation];
        @synchronized(self) {
            [_apiActiveDic setObject:api forKey:key];
        }
    }
}

/** 删除请求的Api */
- (void)removeOperation:(AFHTTPRequestOperation *)operation {
    NSString *key = [self requestHashKey:operation];
    @synchronized(self) {
        [_apiActiveDic removeObjectForKey:key];
    }
}


- (void)cancelAllApi {
    NSDictionary *apiActiveDic = [_apiActiveDic copy];
    for (NSString *key in apiActiveDic) {
        JJAFNApi *api = [apiActiveDic objectForKey:key];
        [api cancel];
    }
}


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

- (void)startApi:(JJAFNApi *)api {
    
    [api willstart];
    
    /** 设置请求序列化方式 */
    [self configRequestSerializer:api];
    
    /** 设置超时时间 */
    [self configTimeoutInterval:api];
    
    /** 设置授权HTTP Header */
    [self configAuthorizationHeaderField:api];
    
    /** 设置HTTP Header */
    [self configHeaderField:api];
    
    /** 设置HTTPS请求 */
    [self configHTTPS:api];
    
    NSString *URLString = [self getURLString:api];
    NSString *parameters = [self getParameters:api];
    JJAFNMethodType method = [api AFNMethod];
    if (method == JJAFNMethod_GET) {
        api.requestOperation = [self.manager GET:URLString parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
            [self handleSuccessApi:api operation:operation];
        } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
            [self handleFailureApi:api operation:operation];
        }];
    }
    else if (method == JJAFNMethod_POST) {
        api.requestOperation = [self.manager POST:URLString parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
            [self handleSuccessApi:api operation:operation];
        } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
            [self handleFailureApi:api operation:operation];
        }];
    }
    else if (method == JJAFNMethod_HEAD) {
        api.requestOperation = [self.manager HEAD:URLString parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation) {
            [self handleSuccessApi:api operation:operation];
        } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
            [self handleFailureApi:api operation:operation];
        }];
    }
    else if (method == JJAFNMethod_DELETE) {
        api.requestOperation = [self.manager DELETE:URLString parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
            [self handleSuccessApi:api operation:operation];
        } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
            [self handleFailureApi:api operation:operation];
        }];
    }
    else if (method == JJAFNMethod_PUT) {
        api.requestOperation = [self.manager PUT:URLString parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
            [self handleSuccessApi:api operation:operation];
        } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
            [self handleFailureApi:api operation:operation];
        }];
    }
    else if (method == JJAFNMethod_PATCH) {
        api.requestOperation = [self.manager PATCH:URLString parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
            [self handleSuccessApi:api operation:operation];
        } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
            [self handleFailureApi:api operation:operation];
        }];
    }
    
    /** api的优先级 */
    [self configQueuePriority:api];
    
    [self addOperation:api];
    
    [api logStartApi];
    
    [api didstart];
}

- (void)cancelApi:(JJAFNApi *)api {
    
    [api willCancel];
    
    [api.requestOperation cancel];
    [self removeOperation:api.requestOperation];
    [api clearBlock];
    
    [api didCancel];
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


- (NSMutableDictionary *)apiActiveDic {
    if (_apiActiveDic) {
        return _apiActiveDic;
    }
    _apiActiveDic = [NSMutableDictionary dictionary];
    return _apiActiveDic;
}

@end
