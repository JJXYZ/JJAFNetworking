//
//  JJAFNListApi.m
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/21.
//  Copyright © 2015年 JJ. All rights reserved.
//

#import "JJAFNListApi.h"
#import "JJAFNListInput.h"

@implementation JJAFNListApi


- (void)refreshData {
//    if ([self.input isKindOfClass:[JJAFNListInput class]]) {
//        JJAFNListInput *input = (JJAFNListInput *)self.input;
//        input.page = 1;
//    }
    _page = 1;
    [self start];
}


- (void)loadMoreData {
    if ([self.input isKindOfClass:[JJAFNListInput class]]) {
        JJAFNListInput *input = (JJAFNListInput *)self.input;
        input.page = 1;
    }
    [self start];
}

@end
