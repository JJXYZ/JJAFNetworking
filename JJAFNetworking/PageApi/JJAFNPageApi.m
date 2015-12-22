//
//  JJAFNListApi.m
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/21.
//  Copyright © 2015年 JJ. All rights reserved.
//

#import "JJAFNPageApi.h"
#import "JJAFNInput+Page.h"

@implementation JJAFNPageApi
@synthesize delegate = _delegate;

#pragma mark - Public Methods

- (void)refreshData {
    _page = 1;
    self.input.page = _page;
    [self start];
}



- (void)loadMoreData {
    _page += 1;
    self.input.page = _page;
    [self start];
}

- (void)refreshWithSuccess:(JJApiBlock)success failure:(JJApiBlock)failure {
    self.apiSuccessBlock = success;
    self.apiFailureBlock = failure;
    [self refreshData];
}

- (void)loadMoreWithSuccess:(JJApiBlock)success failure:(JJApiBlock)failure {
    self.apiMoreSuccessBlock = success;
    self.apiMoreFailureBlock = failure;
    [self loadMoreData];
}

#pragma mark - Inherit

- (void)handleSuccess {
    if (self.page == 1) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(apiSuccess:)]) {
            [self.delegate apiSuccess:self];
        }
        if (self.apiSuccessBlock) {
            self.apiSuccessBlock(self);
        }
    }
    else {
        if (self.delegate && [self.delegate respondsToSelector:@selector(apiMoreSuccess:)]) {
            [self.delegate apiMoreSuccess:self];
        }
        if (self.apiMoreSuccessBlock) {
            self.apiMoreSuccessBlock(self);
        }
    }
}

- (void)handleFailure {
    if (self.page == 1) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(apiFailed:)]) {
            [self.delegate apiFailed:self];
        }
        if (self.apiFailureBlock) {
            self.apiFailureBlock(self);
        }
    }
    else {
        if (self.delegate && [self.delegate respondsToSelector:@selector(apiMoreFailed:)]) {
            [self.delegate apiMoreFailed:self];
        }
        if (self.apiMoreFailureBlock) {
            self.apiMoreFailureBlock(self);
        }
    }
}
@end
