//
//  ViewController.m
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/8.
//  Copyright © 2015年 JJ. All rights reserved.
//

#import "ViewController.h"
#import "JJAFNetworking.h"
#import "JJDogApi.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [[JJDogApi alloc] start];
    
    [[JJDogApi alloc] startWithSuccess:^(JJApi *api) {
        NSLog(@"startWithSuccess");
    } failure:^(JJApi *api) {
        NSLog(@"failure");
    }];
}

@end
