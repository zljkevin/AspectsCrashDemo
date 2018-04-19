//
//  AspectsAppDelegate.m
//  AspectsDemo
//
//  Created by Peter Steinberger on 03/05/14.
//  Copyright (c) 2014 PSPDFKit GmbH. All rights reserved.
//

#import "AspectsAppDelegate.h"
#import "AspectsViewController.h"
#import "Aspects.h"
#import <objc/runtime.h>

@implementation AspectsAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    AspectsViewController *aspectsController = [AspectsViewController new];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:aspectsController];
    [self.window makeKeyAndVisible];

    // Ignore hooks when we are testing.
    if (!NSClassFromString(@"XCTestCase")) {
        
        Class klass = NSClassFromString(@"AspectsViewController");
        [klass aspect_hookSelector:@selector(buttonPressed:) withOptions:AspectPositionBefore usingBlock:^(id info, id sender) {
            NSLog(@"Button was pressed");
        } error:NULL];

        klass = object_getClass(klass);
        [klass aspect_hookSelector:@selector(testLog) withOptions:AspectPositionBefore usingBlock:^{
            NSLog(@"hook testLog");
        } error:NULL];
    }

    return YES;
}

@end
