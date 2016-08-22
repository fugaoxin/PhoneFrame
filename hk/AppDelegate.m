//
//  AppDelegate.m
//  hk
//
//  Created by User01 on 15/11/17.
//  Copyright © 2015年 User01. All rights reserved.
//

#import "AppDelegate.h"
#import "myTabBarController.h"
#import "RestaurantVC.h"
#import "couponVC.h"
#import "foodRingVC.h"
#import "myOrderVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setTabBar];
    
    return YES;
}

-(void)setTabBar
{
    NSArray *titleArray = @[@"餐厅",@"优惠券",@"美食圈",@"我的订单"];
    NSArray *photoArray = @[@"bottom_restaurant_normal_btn",
                            @"bottom_coupon_normal_btn",
                            @"bottom_circle_normal",
                            @"bottom_myorder_normal_btn"];
    NSArray *selePArray = @[@"bottom_restaurant_selected_btn",
                            @"bottom_coupon_selected_btn",
                            @"bottom_circle_selected_btn",
                            @"bottom_myorder_selected_btn"];
    
    myTabBarController *tBC = [[myTabBarController alloc]init];
    [tBC setTabBarControllerWithVCArray:@[[RestaurantVC class],[couponVC class],[foodRingVC class],[myOrderVC class]] andPhotoArray:photoArray selectedPhotoArray:selePArray titleArray:titleArray];
    
    UINavigationController *nc = [[UINavigationController alloc]initWithRootViewController:tBC];
    nc.navigationBarHidden = YES;
    self.window.rootViewController = nc;
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
