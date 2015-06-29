//
//  AppDelegate.m
//  LianMeng
//
//  Created by lanouhn on 15/6/26.
//  Copyright (c) 2015年 lanouhn3g - 23 .com. All rights reserved.
//

#import "AppDelegate.h"
#import "MessageViewController.h"
#import "HeroViewController.h"
#import "RootViewController.h"
#import "SetViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    // 资讯
    MessageViewController *megssageVC = [[MessageViewController alloc] init];
    self.megssage = [[UINavigationController alloc] initWithRootViewController:megssageVC];
    self.megssage.tabBarItem.title = @"资讯";
    
    
    // 英雄
    HeroViewController *hearVC = [[HeroViewController alloc] init];
    UINavigationController *hear = [[UINavigationController alloc] initWithRootViewController:hearVC];
    hear.tabBarItem.title = @"英雄";
    
    // 策略
    RootViewController *rootVC = [[RootViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:rootVC];
    nav.tabBarItem.title = @"攻略";
    
    // 设置
    SetViewController *setVC = [[SetViewController alloc] init];
    UINavigationController *set = [[UINavigationController alloc] initWithRootViewController:setVC];
    set.tabBarItem.title = @"设置";
    
    
    
    
    // tabbar
    UITabBarController *tabbar = [[UITabBarController alloc] init];
    NSArray *array = @[self.megssage, hear, nav, set];
    tabbar.viewControllers = array;
    tabbar.tabBar.translucent = NO;
    self.window.rootViewController = tabbar;
    
    
    
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

@end
