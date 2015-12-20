//
//  JJAFNApi+HandleMethod.m
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/17.
//  Copyright © 2015年 JJ. All rights reserved.
//

#import "JJAFNApi+HandleMethod.h"

@implementation JJAFNApi (HandleMethod)

#pragma mark - Inherit

- (void)willstart {
    if (self.delegate && [self.delegate respondsToSelector:@selector(apiWillstart:)]) {
        [self.delegate apiWillstart:self];
    }
    if (self.apiWillstartBlock) {
        self.apiWillstartBlock(self);
    }
}

- (void)didstart {
    if (self.delegate && [self.delegate respondsToSelector:@selector(apiDidstart:)]) {
        [self.delegate apiDidstart:self];
    }
    if (self.apiDidstartBlock) {
        self.apiDidstartBlock(self);
    }
}


- (void)willHandleSuccess {
    if (self.delegate && [self.delegate respondsToSelector:@selector(apiWillHandleSuccess:)]) {
        [self.delegate apiWillHandleSuccess:self];
    }
    if (self.apiWillHandleSuccessBlock) {
        self.apiWillHandleSuccessBlock(self);
    }
}

- (void)reformData {
    self.output = self.responseObject;
}

- (void)handleSuccess {
    if (self.delegate && [self.delegate respondsToSelector:@selector(apiSuccess:)]) {
        [self.delegate apiSuccess:self];
    }
    if (self.apiSuccessBlock) {
        self.apiSuccessBlock(self);
    }
}

- (void)didHandleSuccess {
    if (self.delegate && [self.delegate respondsToSelector:@selector(apiDidHandleSuccess:)]) {
        [self.delegate apiDidHandleSuccess:self];
    }
    if (self.apiDidHandleSuccessBlock) {
        self.apiDidHandleSuccessBlock(self);
    }
}

- (void)willHandleFailure {
    if (self.delegate && [self.delegate respondsToSelector:@selector(apiWillHandleFailure:)]) {
        [self.delegate apiWillHandleFailure:self];
    }
    if (self.apiWillHandleFailureBlock) {
        self.apiWillHandleFailureBlock(self);
    }
}

- (void)handleFailure {
    if (self.delegate && [self.delegate respondsToSelector:@selector(apiFailed:)]) {
        [self.delegate apiFailed:self];
    }
    if (self.apiFailureBlock) {
        self.apiFailureBlock(self);
    }
}

- (void)didHandleFailure {
    if (self.delegate && [self.delegate respondsToSelector:@selector(apiDidHandleFailure:)]) {
        [self.delegate apiDidHandleFailure:self];
    }
    if (self.apiDidHandleFailureBlock) {
        self.apiDidHandleFailureBlock(self);
    }
}


- (void)willCancel {
    if (self.delegate && [self.delegate respondsToSelector:@selector(apiWillCancel:)]) {
        [self.delegate apiWillCancel:self];
    }
    if (self.apiWillCancelBlock) {
        self.apiWillCancelBlock(self);
    }
}

- (void)didCancel {
    if (self.delegate && [self.delegate respondsToSelector:@selector(apiDidCancel:)]) {
        [self.delegate apiDidCancel:self];
    }
    if (self.apiDidCancelBlock) {
        self.apiDidCancelBlock(self);
    }
}


@end
