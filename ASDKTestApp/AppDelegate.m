//
//  AppDelegate.m
//  ASDKTestApp
//
//  Created by Jeffrey Davis on 12/7/16.
//  Copyright © 2016 jeffdav. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];

  UINavigationController *navigationController = [[UINavigationController alloc] init];
  self.window.rootViewController = navigationController;

  UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
  ASCollectionNode *collectionNode = [[ASCollectionNode alloc] initWithCollectionViewLayout:layout];
  ViewController *viewController = [[ViewController alloc] initWithNode:collectionNode];
  collectionNode.dataSource = viewController;
  collectionNode.delegate = viewController;
  [navigationController pushViewController:viewController animated:NO];

  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
