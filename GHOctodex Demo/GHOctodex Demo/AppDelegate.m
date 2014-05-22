//
//  AppDelegate.m
//  GHOctodex Demo
//
//  Created by Rudd Fawcett on 1/14/14.
//  Copyright (c) 2014 Rudd Fawcett. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    
    [self GHOctodexDemo];
    
    return YES;
}

- (void)GHOctodexDemo {
    NSLog(@"%@",[GHOctodex completeOctodex]);
    NSLog(@"%@",[GHOctodex randomOctocat]);
    NSLog(@"%@",[GHOctodex numberedOctocat:1]);
}

@end
