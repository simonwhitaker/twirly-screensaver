//
//  GSTwirlyPreviewAppDelegate.h
//  GSTwirlyPreview
//
//  Created by Simon Whitaker on 27/09/2011.
//  License: see UNLICENSE
//

#import <Cocoa/Cocoa.h>
#import <ScreenSaver/ScreenSaver.h>

@interface GSTwirlyPreviewAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
}

@property (nonatomic, assign) IBOutlet ScreenSaverView * view;
@property (assign) IBOutlet NSWindow *window;
@property (nonatomic, retain) NSTimer * timer;

@end
