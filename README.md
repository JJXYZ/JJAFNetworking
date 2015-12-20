# JJAFNetworking
封装AFNetworking

# 使用方法
每一个api继承JJAFNApi。

重写JJAFNApi+RewriteMethod类中的方法，改变请求方式或者参数等。

在JJAFNApi+HandleMethod方法中处理要处理的数据。

该框架实现回调和Block两种方式获取结果。

PS:非常感谢YTKNetwork提供的思路
