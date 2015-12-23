//
//  JJApi+UpLoad.h
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/22.
//  Copyright © 2015年 JJ. All rights reserved.
//

#import "JJApi.h"
#import "AFURLRequestSerialization.h"

typedef void (^JJApiConstructingBodyBlock)(id<AFMultipartFormData> formData);

typedef void (^JJApiUploadProgressBlock)(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite);

@interface JJApi (UpLoad)

/** 上传的Data */
@property (nonatomic, copy) JJApiConstructingBodyBlock constructingBodyBlock;

/** 上传的进度 */
@property (nonatomic, copy) JJApiUploadProgressBlock uploadProgressBlock;


@end
