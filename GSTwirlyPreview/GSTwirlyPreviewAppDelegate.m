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
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0/30.0
                                                  target:self.view
                                                selector:@selector(setNeedsDisplay:)
                                                userInfo:nil
                                                 repeats:YES];
}

- (void)applicationWillTerminate:(NSNotification *)notification
{
    self.timer = nil;
}

- (void)dealloc
{
    self.timer = nil;
}

@end
