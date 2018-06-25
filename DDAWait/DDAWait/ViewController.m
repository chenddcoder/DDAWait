//
//  ViewController.m
//  DDAWait
//
//  Created by 陈丁丁 on 2018/6/25.
//  Copyright © 2018年 陈丁丁. All rights reserved.
//

#import "ViewController.h"
#import "DDAWait.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    DDAWait * await=[DDAWait createWithQueueName:@"AAA"];
    DDAWait * await2=[DDAWait createWithQueueName:@"AAA"];
    [await wait:^(NSCondition *condition, DD_OutObj *outObj) {
        sleep(1);
        NSLog(@"1");
        DDAWaitSignal;
    }];
    [await wait:^(NSCondition *condition, DD_OutObj *outObj) {
        sleep(1);
        NSLog(@"2");
        DDAWaitSignal;
        [await2 wait:^(NSCondition *condition, DD_OutObj *outObj) {
            sleep(1);
            NSLog(@"4");
            DDAWaitSignal;
        }];
    }];
    [await2 wait:^(NSCondition *condition, DD_OutObj *outObj) {
        sleep(1);
        NSLog(@"3");
        DDAWaitSignal;
    }];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
