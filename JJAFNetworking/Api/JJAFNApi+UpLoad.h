//
//  JJAFNApi+UpLoad.h
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/22.
//  Copyright © 2015年 JJ. All rights reserved.
//

#import "JJAFNApi.h"
#import "AFURLRequestSerialization.h"

typedef void (^AFConstructingBodyBlock)(id<AFMultipartFormData> formData);

typedef void (^AFUploadProgressBlock)(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite);

@interface JJAFNApi (UpLoad)

/** 上传的Data */
@property (nonatomic, copy) AFConstructingBodyBlock constructingBodyBlock;

/** 上传的进度 */
@property (nonatomic, copy) AFUploadProgressBlock uploadProgressBlock;


@end
