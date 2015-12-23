//
//  JJApi_ENUM.h
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/17.
//  Copyright © 2015年 JJ. All rights reserved.
//

#ifndef JJApi_ENUM_h
#define JJApi_ENUM_h

/** 请求方式 */
typedef NS_ENUM(NSInteger, JJApiMethodType) {
    JJApiMethod_GET = 0,
    JJApiMethod_POST,
    JJApiMethod_HEAD,
    JJApiMethod_PUT,
    JJApiMethod_DELETE,
    JJApiMethod_PATCH,
    JJApiMethod_DOWNLOAD,
    JJApiMethod_UPLOAD,
};

/** 请求序列化方式 */
typedef NS_ENUM(NSInteger, JJApiRequestSerializerType) {
    JJApiRequestSerializer_HTTP = 0,
    JJApiRequestSerializer_JSON,
};

/** 请求方式,HTTP(默认)/HTTPS */
typedef NS_ENUM(NSInteger, JJApiHTTPType) {
    JJApiHTTPType_HTTP = 0,
    JJApiHTTPType_HTTPS,
};

/** 请求使用的数据类型 */
typedef NS_ENUM(NSInteger, JJDataType) {
    JJDataType_JSON = 0,
    JJDataType_XML,
    JJDataType_PB,
    
};


#endif /* JJApi_ENUM_h */
