//
//  JJApiInput+Page.m
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/22.
//  Copyright © 2015年 JJ. All rights reserved.
//

#import "JJApiInput+Page.h"
#import <objc/runtime.h>

@implementation JJApiInput (Page)

#pragma mark - Property

static char kAFNPageKey;
- (NSUInteger)page {
    NSNumber *pNum = objc_getAssociatedObject(self, &kAFNPageKey);
    return pNum.longLongValue;
}

- (void)setPage:(NSUInteger)page {
    objc_setAssociatedObject(self, &kAFNPageKey, @(page), OBJC_ASSOCIATION_ASSIGN);
}

@end
