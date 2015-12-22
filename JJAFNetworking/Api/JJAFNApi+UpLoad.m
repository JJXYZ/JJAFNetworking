//
//  JJAFNApi+UpLoad.m
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/22.
//  Copyright © 2015年 JJ. All rights reserved.
//

#import "JJAFNApi+UpLoad.h"
#import <objc/runtime.h>

@implementation JJAFNApi (UpLoad)


#pragma mark - Property

static char kAFNApiConstructingBodyBlockKey;
- (AFConstructingBodyBlock)constructingBodyBlock {
    return objc_getAssociatedObject(self, &kAFNApiConstructingBodyBlockKey);
}

- (void)setConstructingBodyBlock:(AFConstructingBodyBlock)constructingBodyBlock {
    objc_setAssociatedObject(self, &kAFNApiConstructingBodyBlockKey, constructingBodyBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

static char kAFNApiUploadProgressBlockKey;
- (AFUploadProgressBlock)uploadProgressBlock {
    return objc_getAssociatedObject(self, &kAFNApiUploadProgressBlockKey);
}

- (void)setUploadProgressBlock:(AFUploadProgressBlock)uploadProgressBlock {
    objc_setAssociatedObject(self, &kAFNApiUploadProgressBlockKey, uploadProgressBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
