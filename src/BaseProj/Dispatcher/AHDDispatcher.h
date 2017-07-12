//
//  AHDDispatcher.h
//  AHDDispatcher
//
//  Created by 王一飞 on 17/7/6.
//  Copyright © 2017年 Autohome Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AHDDispatcherFullHeader.h"

@interface AHDDispatcher : NSObject

+(instancetype)shareInstance;

- (id)openURL:(NSURL *)url onCompletion:(void(^)(id result))completion;

-(id)handleTarget:(NSString *)targetName withSelector:(NSString *)selectorName withParams:(NSDictionary *)params callFromDispatcher:(BOOL) fromDispatcher;
@end
