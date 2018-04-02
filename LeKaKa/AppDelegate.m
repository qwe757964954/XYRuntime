//
//  AppDelegate.m
//  LeKaKa
//
//  Created by 谢龙 on 2018/1/23.
//  Copyright © 2018年 谢龙. All rights reserved.
//

#import "AppDelegate.h"
#import "JXLaunchImageAdView.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self advertisingPage];
    return YES;
}
#pragma mark - 广告页
-(void)advertisingPage
{
    /*FullScreenAdType 全屏广告
     *LogoAdType 带logo的广告类似网易广告，值得注意的是启动图片必须带logo图
     *ImgUrl 图片url
     */
    JXLaunchImageAdView * adView = [[JXLaunchImageAdView alloc]initWithWindow:self.window andType:LogoAdType andImgUrl:@"http://www.uisheji.com/wp-content/uploads/2013/04/19/app-design-uisheji-ui-icon20121_55.jpg"];
    
    //各种回调
    adView.clickBlock = ^(NSInteger tag) {
        switch (tag) {
            case 1100:
                NSLog(@"点击广告回调");
                
                break;
            case 1101:
                NSLog(@"点击跳过回调");
                break;
            case 1102:
                NSLog(@"倒计时完成后的回调");
                break;
            default:
                break;
        }
    };
    
}
#pragma mark 第一次启动
-(void)firstLaunch{
    if(![[NSUserDefaults standardUserDefaults]boolForKey:@"everLaunched"])
    {
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"everLaunched"];
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"firstLaunch"];
        NSLog(@"first launch");
    }else
    {
        [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"firstLaunch"];
        NSLog(@"second launch");
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
