//
//  JJAFNApi+DownLoad.h
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/22.
//  Copyright © 2015年 JJ. All rights reserved.
//

#import "JJAFNApi.h"
#import "AFDownloadRequestOperation.h"


typedef void(^AFProgressiveDownloadProgressBlock)(AFDownloadRequestOperation *operation, NSInteger bytesRead, long long totalBytesRead, long long totalBytesExpected, long long totalBytesReadForFile, long long totalBytesExpectedToReadForFile);

@interface JJAFNApi (DownLoad)

/** 下载进度 */
@property (nonatomic, copy) AFProgressiveDownloadProgressBlock progressiveDownloadProgressBlock;

/** 下载:目标路径 */
- (NSString *)targetPath;

/** 下载:是否断点续传 */
- (BOOL)shouldResume;


@end
