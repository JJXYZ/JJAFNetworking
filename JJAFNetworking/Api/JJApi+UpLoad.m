//
//  JJApi+UpLoad.m
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/22.
//  Copyright © 2015年 JJ. All rights reserved.
//

#import "JJApi+UpLoad.h"
#import <objc/runtime.h>

@implementation JJApi (UpLoad)


#pragma mark - Property

static char kApiConstructingBodyBlockKey;
- (JJApiConstructingBodyBlock)constructingBodyBlock {
    return objc_getAssociatedObject(self, &kApiConstructingBodyBlockKey);
}

- (void)setConstructingBodyBlock:(JJApiConstructingBodyBlock)constructingBodyBlock {
    objc_setAssociatedObject(self, &kApiConstructingBodyBlockKey, constructingBodyBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

static char kApiUploadProgressBlockKey;
- (JJApiUploadProgressBlock)uploadProgressBlock {
    return objc_getAssociatedObject(self, &kApiUploadProgressBlockKey);
}

- (void)setUploadProgressBlock:(JJApiUploadProgressBlock)uploadProgressBlock {
    objc_setAssociatedObject(self, &kApiUploadProgressBlockKey, uploadProgressBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
