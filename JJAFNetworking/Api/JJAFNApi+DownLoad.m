//
//  JJAFNApi+DownLoad.m
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/22.
//  Copyright © 2015年 JJ. All rights reserved.
//

#import "JJAFNApi+DownLoad.h"
#import <objc/runtime.h>

@implementation JJAFNApi (DownLoad)


#pragma mark - Public Methods

- (NSString *)targetPath {
    return nil;
}

- (BOOL)shouldResume {
    return YES;
}

#pragma mark - Property

static char kAFNApiProgressiveDownloadProgressBlockKey;
- (AFProgressiveDownloadProgressBlock)progressiveDownloadProgressBlock {
    return objc_getAssociatedObject(self, &kAFNApiProgressiveDownloadProgressBlockKey);
}

- (void)setProgressiveDownloadProgressBlock:(AFProgressiveDownloadProgressBlock)progressiveDownloadProgressBlock {
    objc_setAssociatedObject(self, &kAFNApiProgressiveDownloadProgressBlockKey, progressiveDownloadProgressBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


@end
