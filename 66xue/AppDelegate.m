//
//  AppDelegate.m
//  66xue
//
//  Created by tony on 15/10/15.
//  Copyright (c) 2015年 tony. All rights reserved.
//

#import "AppDelegate.h"
#import "AFNetworking.h"
#import "LYRAuthInfo.h"
#import "LYRAuthInfoTool.h"
#import "LYRWeibo.h"
#import "FMDB.h"

#import "LYRWeiboParametersRequest.h"
#import "LYRWeiboTool.h"
#import "LYRHttpTool.h"
@interface AppDelegate ()
@property(nonatomic,assign)UIBackgroundTaskIdentifier backgroundTask;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //3824706941907558
    //    LYRWeiboParametersRequest*parameters = [[LYRWeiboParametersRequest alloc]init];
    //    parameters.since_id = @"3824706941907558";
    //    [LYRHttpTool weiboWithParameters:parameters statusToolSuccess:^(id responseObject) {
    //        NSLog(@"%@",responseObject);
    //
    //        NSArray*models = [LYRWeibo arrayOfModelsFromDictionaries:responseObject[@"statuses"]];
    //        for (LYRWeibo*weibo in models) {
    //            [LYRWeiboTool saveWeiboWith:weibo];
    //        }
    ////        reply(@{@"code":@"0000"});
    //    } failure:^(NSError *error) {
    ////        reply(@{@"code":@"9999"});
    //        NSLog(@"sss");
    //    }];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)application:(UIApplication *)application handleWatchKitExtensionRequest:(NSDictionary *)userInfo reply:(void (^)(NSDictionary *))reply
{
    //苹果文档建议在执行任务前后调用后台任务方法
    //开始后台任务
    [self beginBackgroundTask];
    [self requestDataWith:userInfo reply:reply];
    //结束后台任务
    [self endBackgroundTask];
}

-(void)requestDataWith:(NSDictionary*)userInfo reply:(void (^)(NSDictionary *))reply
{
    if(userInfo){
        NSString *openValue = [userInfo objectForKey:@"openType"];
        if(openValue && [@"say hi to phone" isEqualToString:openValue]){
            NSMutableDictionary *replyInfo = [NSMutableDictionary dictionary];
            
            NSDate *  senddate=[NSDate date];
            
            NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
            
            [dateformatter setDateFormat:@"HH:mm:ss"];
            
            NSString *locationString=[dateformatter stringFromDate:senddate];
            [replyInfo setObject:[NSString stringWithFormat:@"iphone%@",locationString] forKey:@"words"];
            
            //主应用处理完成后，回调来自watchkit extension的 reply(replyInfo)，否则方法响应失败
            reply(replyInfo);
        }
    }
}

-(void)beginBackgroundTask
{
    self.backgroundTask = [[UIApplication sharedApplication]beginBackgroundTaskWithName:@"backgroundTask" expirationHandler:^{
        [self endBackgroundTask];
    }];
}
-(void)endBackgroundTask
{
    [[UIApplication sharedApplication]endBackgroundTask:self.backgroundTask];
    self.backgroundTask = UIBackgroundTaskInvalid;
}

@end
