//
//  AppDelegate.m
//  Share3DTouch
//
//  Created by jens on 16/5/15.
//  Copyright © 2016年 张建帅. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //创建3dtouch标签
    [self createShortItems];
    
    
    return YES;
}

#pragma mark ---创建标签items
- (void)createShortItems {
    //UIApplicationShortcutItem , 标签,最多有4个
    //UIApplicationShortcutItemType , 唯一标识的属性(必填)
    //UIApplicationShortcutItemTitle , 标题, (必填)
    //UIApplicationShortcutItemSubtitle , 二级标题
    //UIApplicationShortcutItemIconType , 显示的图标, 可以是自定义的,也可以是系统的
    //UIApplicationShortcutItemIconUserInfo, 包含一些其他信息
    
    
    //创建标签
    //创建标签的icon图标
    UIApplicationShortcutIcon *icon1 = [UIApplicationShortcutIcon iconWithType:(UIApplicationShortcutIconTypeLove)];
    UIApplicationShortcutItem *item1 = [[UIApplicationShortcutItem alloc] initWithType:@"A" localizedTitle:@"大表弟" localizedSubtitle:@"去哪了?" icon:icon1 userInfo:nil];
    
    UIApplicationShortcutIcon *icon2 = [UIApplicationShortcutIcon iconWithType:(UIApplicationShortcutIconTypeAdd)];
    UIApplicationShortcutItem *item2 = [[UIApplicationShortcutItem alloc] initWithType:@"B" localizedTitle:@"小帅哥" localizedSubtitle:@"\(^o^)/~" icon:icon2 userInfo:nil];
    
    UIApplicationShortcutIcon *icon3 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"icon3.png"];
    UIApplicationShortcutItem *item3 = [[UIApplicationShortcutItem alloc] initWithType:@"C" localizedTitle:@"大帅比" localizedSubtitle:@"O(∩_∩)O哈哈~" icon:icon3 userInfo:nil];
    
    //将标签添加到application的shortitems
    [UIApplication sharedApplication].shortcutItems = @[item1, item2, item3];
    
 
}

//通过点击3dtouch标签会执行的方法
- (void)application:(UIApplication *)application performActionForShortcutItem:(nonnull UIApplicationShortcutItem *)shortcutItem completionHandler:(nonnull void (^)(BOOL))completionHandler {
    //判断从哪个标签进入应用程序
    if ([shortcutItem.type isEqualToString:@"A"]) {
        self.window.rootViewController.view.backgroundColor = [UIColor greenColor];
    }else if ([shortcutItem.type isEqualToString:@"B"]) {
        self.window.rootViewController.view.backgroundColor = [UIColor redColor];
    }else if ([shortcutItem.type isEqualToString:@"C"]){
        self.window.rootViewController.view.backgroundColor = [UIColor brownColor];
    }

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
