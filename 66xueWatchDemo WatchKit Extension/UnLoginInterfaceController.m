//
//  UnLoginInterfaceController.m
//  66xueWatchDemo
//
//  Created by tony on 15/10/16.
//  Copyright (c) 2015年 tony. All rights reserved.
//

#import "UnLoginInterfaceController.h"

@interface UnLoginInterfaceController ()
- (IBAction)backClick;
@end

@implementation UnLoginInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (IBAction)backClick {
    [self popController];
}

@end



