//
//  AHDDispatcher.m
//  AHDDispatcher
//
//  Created by 王一飞 on 17/7/6.
//  Copyright © 2017年 Autohome Inc. All rights reserved.
//

#import "AHDDispatcher.h"

@interface AHDDispatcher()
@property(nonatomic,strong)NSDictionary *registerClassDictionary;
@end
@implementation AHDDispatcher

+(instancetype)shareInstance{

    static AHDDispatcher *dispatcher;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dispatcher = [AHDDispatcher new];
    });
    return dispatcher;
}

-(instancetype)init{

    self = [super init];
    if (self) {
        //注册类
        _registerClassDictionary = [NSDictionary dictionaryWithContentsOfFile:
                                       [[NSBundle mainBundle]pathForResource:@"RegisterClass" ofType:@"plist"]];
    }
    return self;
}

//usehome://login/showlogin?name=wang&pwd=yifei
-(id)openURL:(NSURL *)url onCompletion:(void (^)(id))completion{

    if (![[url.scheme lowercaseString] isEqualToString:@"autohomedealer"]) {//scheme不对则不执行
        return @NO;
    }
    NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
    NSString *paramsStr = url.query;
    
    for (NSString *param in [paramsStr componentsSeparatedByString:@"&"]) {
        NSArray *keyPairs = [param componentsSeparatedByString:@"="];
        if([keyPairs count] < 2) continue;
        params[keyPairs.firstObject] = keyPairs.lastObject;
        NSLog(@"param:%@---value:%@",keyPairs.firstObject,keyPairs.lastObject);
    }
    //TODO: 安全性
    NSString *targetName = url.host;
    NSString *selectorName = [url.path stringByReplacingOccurrencesOfString:@"/" withString:@""];
    
    id result = [self handleTarget:targetName withSelector:selectorName withParams:params callFromDispatcher:NO];
    if (completion) {
        if (result) {
            completion(result);
        }else{
            completion(nil);
        }
    }
    return result;
}

-(id)handleTarget:(NSString *)targetName withSelector:(NSString *)selectorName withParams:(NSDictionary *)params callFromDispatcher:(BOOL) fromDispatcher{
    
    NSMutableDictionary *mutableParams = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParams setObject:[NSNumber numberWithBool:fromDispatcher] forKey:isFromDispatcher];
    //TODO: 这里可能需要处理targetName对应的类名
    NSString *realTargetClassName = _registerClassDictionary[targetName];
    if (realTargetClassName == nil || [realTargetClassName isEqualToString:@""]) {
        //并没有注册对应的类
        return nil;
    }
    //获得类对应实例
    Class targetClass = NSClassFromString(realTargetClassName);
    id targetInstance = [targetClass new];
    //拼接出方法名
    NSString *realTargetSEL = [NSString stringWithFormat:@"handler_%@:",selectorName];
    SEL targetSEL = NSSelectorFromString(realTargetSEL);
    if (targetInstance == nil) {
        //TODO: 如果初始化失败  handle error here
        return nil;
    }
    if ([targetInstance respondsToSelector:targetSEL]) {
        //如果可以相应 SEL,则调用 SEL
        
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        return [targetInstance performSelector:targetSEL withObject:mutableParams];
#pragma clang diagnostic pop
        
    }else{
        //如果不能相应 SEL,则调用默认的 error 方法
        SEL errorSEL = NSSelectorFromString(@"selNotFound:");
        if ([targetInstance respondsToSelector:errorSEL]){
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        return [targetInstance performSelector:errorSEL withObject:mutableParams];
#pragma clang diagnostic pop
        }else{
            //如果连selNotFound都没有..自己想办法吧
            return nil;
        }
        
    }
    return nil;
}


@end
