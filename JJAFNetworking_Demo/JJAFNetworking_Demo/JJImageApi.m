//
//  JJImageApi.m
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/22.
//  Copyright © 2015年 JJ. All rights reserved.
//

#import "JJImageApi.h"
#import "JJAFNetworking.h"

@implementation JJImageApi

- (JJApiMethodType)AFNMethod {
    return JJApiMethod_UPLOAD;
}

- (NSString *)URLString {
    return @"image/upload";
}

#if 0
- (JJApiConstructingBodyBlock)constructingBodyBlock {
    __weak typeof(self) weakSelf = self;
    return ^(id<AFMultipartFormData> formData) {
        NSData *data = UIImagePNGRepresentation(weakSelf.image);
        NSString *fileName = @"image";
        NSString *name = @"image";
        [formData appendPartWithFileData:data name:name fileName:fileName mimeType:@"image/png"];
    };
}
#else
- (JJApiConstructingBodyBlock)constructingBodyBlock {
    __weak typeof(self) weakSelf = self;
    return ^(id<AFMultipartFormData> formData) {
        for (NSInteger i = 0; i < weakSelf.imageArr.count ; i++) {
            UIImage *image = [weakSelf.imageArr objectAtIndex:i];
            if ([image isKindOfClass:[UIImage class]]) {
                NSData *data = UIImagePNGRepresentation(image);
                NSString *fileName = [NSString stringWithFormat:@"%ld.png", (long)i];
                NSString *name = [NSString stringWithFormat:@"file%ld",(long)i];
                [formData appendPartWithFileData:data name:name fileName:fileName mimeType:@"image/png"];
            }
        }
    };
}
#endif

@end
