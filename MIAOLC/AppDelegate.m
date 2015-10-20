//
//  AppDelegate.m
//  MIAOLC
//
//  Created by qianfeng on 15/10/9.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import "AppDelegate.h"
#import "CustomViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    CustomViewController *tabBarVC = [[CustomViewController alloc]init];
    [tabBarVC createContentViewController];
    [tabBarVC customTabBar];
    self.window.rootViewController = tabBarVC;
    [self.window makeKeyAndVisible];
    //[self beginAnimationView];
    return YES;
}
- (void)beginAnimationView {
    //图片扩大淡出的效果开始
    //设置一个图片
    UIImageView *niceView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    niceView.image = [UIImage imageNamed:@"LaunchImage1@2x.png"];
    [self.window addSubview:niceView];
    [self.window bringSubviewToFront:niceView];
    [UIView animateWithDuration:3 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        niceView.frame = CGRectMake(-60, -85, LCKScreenWidth + 60 * 2, LCKScreenHeight + 85 * 2);
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:3 animations:^{
            niceView.alpha = 0.01;
        } completion:^(BOOL finished) {
            [niceView removeFromSuperview];
        }];
    }];
    
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

@end
