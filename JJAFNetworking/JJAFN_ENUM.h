//
//  JJAFN_ENUM.h
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/17.
//  Copyright © 2015年 JJ. All rights reserved.
//

#ifndef JJAFN_ENUM_h
#define JJAFN_ENUM_h

/** 请求方式 */
typedef NS_ENUM(NSInteger, JJAFNMethodType) {
    JJAFNMethod_GET = 0,
    JJAFNMethod_POST,
    JJAFNMethod_HEAD,
    JJAFNMethod_PUT,
    JJAFNMethod_DELETE,
    JJAFNMethod_PATCH
};

/** 请求序列化方式 */
typedef NS_ENUM(NSInteger, JJAFNRequestSerializerType) {
    JJAFNRequestSerializer_HTTP = 0,
    JJAFNRequestSerializer_JSON,
};

/** 请求方式,HTTP(默认)/HTTPS */
typedef NS_ENUM(NSInteger, JJAFNHTTPType) {
    JJAFNHTTPType_HTTP = 0,
    JJAFNHTTPType_HTTPS,
};

/** 请求使用的数据类型 */
typedef NS_ENUM(NSInteger, JJDataType) {
    JJDataType_JSON = 0,
    JJDataType_XML,
    JJDataType_PB,
    
};


#endif /* JJAFN_ENUM_h */
