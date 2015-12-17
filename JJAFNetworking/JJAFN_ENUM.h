//
//  JJAFN_ENUM.h
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/17.
//  Copyright © 2015年 JJ. All rights reserved.
//

#ifndef JJAFN_ENUM_h
#define JJAFN_ENUM_h


typedef NS_ENUM(NSInteger, JJAFNMethodType) {
    JJAFNMethod_GET = 0,
    JJAFNMethod_POST,
    JJAFNMethod_HEAD,
    JJAFNMethod_PUT,
    JJAFNMethod_DELETE,
    JJAFNMethod_PATCH
};

typedef NS_ENUM(NSInteger, JJAFNRequestSerializerType) {
    JJAFNRequestSerializer_HTTP = 0,
    JJAFNRequestSerializer_JSON,
};



#endif /* JJAFN_ENUM_h */
