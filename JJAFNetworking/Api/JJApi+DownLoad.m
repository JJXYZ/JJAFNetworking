//
//  JJApi+DownLoad.m
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/22.
//  Copyright © 2015年 JJ. All rights reserved.
//

#import "JJApi+DownLoad.h"
#import <objc/runtime.h>

@implementation JJApi (DownLoad)


#pragma mark - Public Methods

- (NSString *)targetPath {
    return nil;
}

- (BOOL)shouldResume {
    return YES;
}

#pragma mark - Property

static char kApiProgressiveDownloadProgressBlockKey;
- (JJApiProgressiveDownloadProgressBlock)progressiveDownloadProgressBlock {
    return objc_getAssociatedObject(self, &kApiProgressiveDownloadProgressBlockKey);
}

- (void)setProgressiveDownloadProgressBlock:(JJApiProgressiveDownloadProgressBlock)progressiveDownloadProgressBlock {
    objc_setAssociatedObject(self, &kApiProgressiveDownloadProgressBlockKey, progressiveDownloadProgressBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


@end
