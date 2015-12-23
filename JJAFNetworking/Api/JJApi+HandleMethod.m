//
//  JJApi+HandleMethod.m
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/17.
//  Copyright © 2015年 JJ. All rights reserved.
//

#import "JJApi+HandleMethod.h"
#import <objc/runtime.h>

@implementation JJApi (HandleMethod)

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

#pragma mark - Property

static char kApiWillstartBlockKey;
- (JJApiBlock)apiWillstartBlock {
    return objc_getAssociatedObject(self, &kApiWillstartBlockKey);
}

- (void)setApiWillstartBlock:(JJApiBlock)apiWillstartBlock {
    objc_setAssociatedObject(self, &kApiWillstartBlockKey, apiWillstartBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

static char kApiDidstartBlockKey;
- (JJApiBlock)apiDidstartBlock {
    return objc_getAssociatedObject(self, &kApiDidstartBlockKey);
}

- (void)setApiDidstartBlock:(JJApiBlock)apiDidstartBlock {
    objc_setAssociatedObject(self, &kApiDidstartBlockKey, apiDidstartBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


static char kApiWillHandleSuccessBlockKey;
- (JJApiBlock)apiWillHandleSuccessBlock {
    return objc_getAssociatedObject(self, &kApiWillHandleSuccessBlockKey);
}

- (void)setApiWillHandleSuccessBlock:(JJApiBlock)apiWillHandleSuccessBlock {
    objc_setAssociatedObject(self, &kApiWillHandleSuccessBlockKey, apiWillHandleSuccessBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


static char kApiDidHandleSuccessBlockKey;
- (JJApiBlock)apiDidHandleSuccessBlock {
    return objc_getAssociatedObject(self, &kApiDidHandleSuccessBlockKey);
}

- (void)setApiDidHandleSuccessBlock:(JJApiBlock)apiDidHandleSuccessBlock {
    objc_setAssociatedObject(self, &kApiDidHandleSuccessBlockKey, apiDidHandleSuccessBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


static char kApiWillHandleFailureBlockKey;
- (JJApiBlock)apiWillHandleFailureBlock {
    return objc_getAssociatedObject(self, &kApiWillHandleFailureBlockKey);
}

- (void)setApiWillHandleFailureBlock:(JJApiBlock)apiWillHandleFailureBlock {
    objc_setAssociatedObject(self, &kApiWillHandleFailureBlockKey, apiWillHandleFailureBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


static char kApiDidHandleFailureBlockKey;
- (JJApiBlock)apiDidHandleFailureBlock {
    return objc_getAssociatedObject(self, &kApiDidHandleFailureBlockKey);
}

- (void)setApiDidHandleFailureBlock:(JJApiBlock)apiDidHandleFailureBlock {
    objc_setAssociatedObject(self, &kApiDidHandleFailureBlockKey, apiDidHandleFailureBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

static char kApiWillCancelBlockKey;
- (JJApiBlock)apiWillCancelBlock {
    return objc_getAssociatedObject(self, &kApiWillCancelBlockKey);
}

- (void)setApiWillCancelBlock:(JJApiBlock)apiWillCancelBlock {
    objc_setAssociatedObject(self, &kApiWillCancelBlockKey, apiWillCancelBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

static char kApiDidCancelBlockKey;
- (JJApiBlock)apiDidCancelBlock {
    return objc_getAssociatedObject(self, &kApiDidCancelBlockKey);
}

- (void)setApiDidCancelBlock:(JJApiBlock)apiDidCancelBlock {
    objc_setAssociatedObject(self, &kApiDidCancelBlockKey, apiDidCancelBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}



@end
