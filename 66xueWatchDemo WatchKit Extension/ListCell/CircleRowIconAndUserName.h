//
//  CircleRowIconAndUserName.h
//  66xueWatchDemo
//
//  Created by tony on 15/10/16.
//  Copyright (c) 2015年 tony. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>

@interface CircleRowIconAndUserName : NSObject
@property (weak, nonatomic) IBOutlet WKInterfaceImage *iconImage;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *userNameLabel;
@end
