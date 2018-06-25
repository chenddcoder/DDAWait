//
//  DDAWait.h
//  DDAWait
//
//  Created by 陈丁丁 on 2018/6/25.
//  Copyright © 2018年 陈丁丁. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DDAWaitSignal [condition lock];[condition signal];[condition unlock];
@interface DD_OutObj:NSObject
@property (nonatomic, assign) BOOL status1;
@property (nonatomic, assign) BOOL status2;
@property (nonatomic, assign) BOOL status3;
@property (nonatomic, strong) id obj1;
@property (nonatomic, strong) id obj2;
@property (nonatomic, strong) id obj3;
@property (nonatomic, assign) int enum1;//
@property (nonatomic, assign) int enum2;
@property (nonatomic, assign) int enum3;
@property (nonatomic, assign) unsigned int number1;
@end
typedef void (^DDAWaitBlock)(NSCondition * condition,DD_OutObj * outObj);
@interface DDAWait : NSObject
+(instancetype)createWithQueueName:(NSString*)queueName;
-(DD_OutObj *)wait:(DDAWaitBlock)block;
-(DD_OutObj *)waitUntil:(NSTimeInterval)interval block:(DDAWaitBlock)block;
@end


