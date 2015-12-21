//
//  JJAFNApi+HandleMethod.m
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/17.
//  Copyright © 2015年 JJ. All rights reserved.
//

#import "JJAFNApi+HandleMethod.h"
#import <objc/runtime.h>

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

#pragma mark - Property

static char kAFNApiWillstartBlockKey;
- (JJApiBlock)apiWillstartBlock {
    return objc_getAssociatedObject(self, &kAFNApiWillstartBlockKey);
}

- (void)setApiWillstartBlock:(JJApiBlock)apiWillstartBlock {
    objc_setAssociatedObject(self, &kAFNApiWillstartBlockKey, apiWillstartBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

static char kAFNApiDidstartBlockKey;
- (JJApiBlock)apiDidstartBlock {
    return objc_getAssociatedObject(self, &kAFNApiDidstartBlockKey);
}

- (void)setApiDidstartBlock:(JJApiBlock)apiDidstartBlock {
    objc_setAssociatedObject(self, &kAFNApiDidstartBlockKey, apiDidstartBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


static char kAFNApiWillHandleSuccessBlockKey;
- (JJApiBlock)apiWillHandleSuccessBlock {
    return objc_getAssociatedObject(self, &kAFNApiWillHandleSuccessBlockKey);
}

- (void)setApiWillHandleSuccessBlock:(JJApiBlock)apiWillHandleSuccessBlock {
    objc_setAssociatedObject(self, &kAFNApiWillHandleSuccessBlockKey, apiWillHandleSuccessBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


static char kAFNApiDidHandleSuccessBlockKey;
- (JJApiBlock)apiDidHandleSuccessBlock {
    return objc_getAssociatedObject(self, &kAFNApiDidHandleSuccessBlockKey);
}

- (void)setApiDidHandleSuccessBlock:(JJApiBlock)apiDidHandleSuccessBlock {
    objc_setAssociatedObject(self, &kAFNApiDidHandleSuccessBlockKey, apiDidHandleSuccessBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


static char kAFNApiWillHandleFailureBlockKey;
- (JJApiBlock)apiWillHandleFailureBlock {
    return objc_getAssociatedObject(self, &kAFNApiWillHandleFailureBlockKey);
}

- (void)setApiWillHandleFailureBlock:(JJApiBlock)apiWillHandleFailureBlock {
    objc_setAssociatedObject(self, &kAFNApiWillHandleFailureBlockKey, apiWillHandleFailureBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


static char kAFNApiDidHandleFailureBlockKey;
- (JJApiBlock)apiDidHandleFailureBlock {
    return objc_getAssociatedObject(self, &kAFNApiDidHandleFailureBlockKey);
}

- (void)setApiDidHandleFailureBlock:(JJApiBlock)apiDidHandleFailureBlock {
    objc_setAssociatedObject(self, &kAFNApiDidHandleFailureBlockKey, apiDidHandleFailureBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

static char kAFNApiWillCancelBlockKey;
- (JJApiBlock)apiWillCancelBlock {
    return objc_getAssociatedObject(self, &kAFNApiWillCancelBlockKey);
}

- (void)setApiWillCancelBlock:(JJApiBlock)apiWillCancelBlock {
    objc_setAssociatedObject(self, &kAFNApiWillCancelBlockKey, apiWillCancelBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

static char kAFNApiDidCancelBlockKey;
- (JJApiBlock)apiDidCancelBlock {
    return objc_getAssociatedObject(self, &kAFNApiDidCancelBlockKey);
}

- (void)setApiDidCancelBlock:(JJApiBlock)apiDidCancelBlock {
    objc_setAssociatedObject(self, &kAFNApiDidCancelBlockKey, apiDidCancelBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}



@end
