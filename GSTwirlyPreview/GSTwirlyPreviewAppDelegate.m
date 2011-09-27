//
//  GSTwirlyPreviewAppDelegate.m
//  GSTwirlyPreview
//
//  Created by Simon Whitaker on 27/09/2011.
//  Copyright 2011 Goo Software Ltd. All rights reserved.
//

#import "GSTwirlyPreviewAppDelegate.h"

@implementation GSTwirlyPreviewAppDelegate

@synthesize window;
@synthesize timer=_timer;
@synthesize view=_view;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0/30.0
                                                  target:self
                                                selector:@selector(updateView)
                                                userInfo:nil
                                                 repeats:YES];
    [self.timer fire];
}

- (void)updateView
{
    NSLog(@"Called updateView");
    self.view.needsDisplay = YES;
}

@end
