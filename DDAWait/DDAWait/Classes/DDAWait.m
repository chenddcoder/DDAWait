//
//  DDAWait.m
//  DDAWait
//
//  Created by 陈丁丁 on 2018/6/25.
//  Copyright © 2018年 陈丁丁. All rights reserved.
//

#import "DDAWait.h"
@implementation DD_OutObj
@end
@interface DDAWait()
@property (nonatomic,strong) dispatch_queue_t queue;
@end
@implementation DDAWait
+ (instancetype)createWithQueueName:(NSString *)queueName{
    DDAWait * await=[[DDAWait alloc]init];
    await.queue= dispatch_queue_create(queueName.UTF8String, DISPATCH_QUEUE_SERIAL);
    return await;
}
-(DD_OutObj *)wait:(DDAWaitBlock)block{
    if (!self.queue) {
        self.queue=dispatch_queue_create("DDAWait", DISPATCH_QUEUE_SERIAL);
    }
    NSCondition * condition=[[NSCondition alloc]init];
    DD_OutObj * outObj=[[DD_OutObj alloc]init];
    [condition lock];
    dispatch_async(self.queue, ^{
        block(condition,outObj);
    });
    [condition wait];
    [condition unlock];
    return outObj;
}
-(DD_OutObj *)waitUntil:(NSTimeInterval)interval block:(DDAWaitBlock)block{
    if (!self.queue) {
        self.queue=dispatch_queue_create("DDAWait", DISPATCH_QUEUE_SERIAL);
    }
    NSDate * untilDate=[NSDate dateWithTimeInterval:interval sinceDate:[NSDate date]];
    NSCondition * condition=[[NSCondition alloc]init];
    DD_OutObj * outObj=[[DD_OutObj alloc]init];
    [condition lock];
    dispatch_async(self.queue, ^{
        block(condition,outObj);
    });
    [condition waitUntilDate:untilDate];
    [condition unlock];
    return outObj;
}
@end
