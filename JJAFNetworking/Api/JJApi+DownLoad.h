//
//  JJApi+DownLoad.h
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/22.
//  Copyright © 2015年 JJ. All rights reserved.
//

#import "JJApi.h"
#import "AFDownloadRequestOperation.h"


typedef void(^JJApiProgressiveDownloadProgressBlock)(AFDownloadRequestOperation *operation, NSInteger bytesRead, long long totalBytesRead, long long totalBytesExpected, long long totalBytesReadForFile, long long totalBytesExpectedToReadForFile);

@interface JJApi (DownLoad)

/** 下载进度 */
@property (nonatomic, copy) JJApiProgressiveDownloadProgressBlock progressiveDownloadProgressBlock;

/** 下载:目标路径 */
- (NSString *)targetPath;

/** 下载:是否断点续传 */
- (BOOL)shouldResume;


@end
