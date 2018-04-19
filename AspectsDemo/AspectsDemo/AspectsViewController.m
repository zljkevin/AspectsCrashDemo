//
//  AspectsViewController.m
//  AspectsDemo
//
//  Created by Peter Steinberger on 05/05/14.
//  Copyright (c) 2014 PSPDFKit GmbH. All rights reserved.
//

#import "AspectsViewController.h"
#import "Aspects.h"

@implementation AspectsViewController

- (IBAction)buttonPressed:(id)sender {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [[self class] testLog];
}

+ (void)testLog{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

@end
