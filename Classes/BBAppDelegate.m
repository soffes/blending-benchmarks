//
//  BBAppDelegate.m
//  Blending Benchmarks
//
//  Created by Sam Soffes on 4/2/12.
//  Copyright (c) 2012 Sam Soffes. All rights reserved.
//

#import "BBAppDelegate.h"
#import "BBResultsViewController.h"

@implementation BBAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	BBResultsViewController *viewController = [[BBResultsViewController alloc] init];
	self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:viewController];
	
	self.window.backgroundColor = [UIColor whiteColor];
	[self.window makeKeyAndVisible];
	return YES;
}

@end
