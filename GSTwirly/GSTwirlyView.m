//
//  GSTwirlyView.m
//  GSTwirly
//
//  Created by Simon Whitaker on 26/09/2011.
//  Copyright 2011 Goo Software Ltd. All rights reserved.
//

#import "GSTwirlyView.h"

@implementation GSTwirlyView

@synthesize x=_x;
@synthesize y=_y;
@synthesize xPeriod=_xPeriod;
@synthesize yPeriod=_yPeriod;

#define QueueLength 20

- (id)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];
        
        // Define starting point
        self.xPeriod = 4.0;
        self.yPeriod = 7.0;
        
        // Functions that will define the change of x and y over time
        self.x = ^(NSTimeInterval dt){ return sin(dt * M_PI * 2 / self.xPeriod); };
        self.y = ^(NSTimeInterval dt){ return cos(dt * M_PI * 2 / self.yPeriod); };
    }
    return self;
}

- (void)dealloc
{
    self.x = nil;
    self.y = nil;
    [super dealloc];
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    if (self.x == NULL)
        [self initWithFrame:rect isPreview:NO];
    
    [super drawRect:rect];
    
    CGFloat scale;
    if (rect.size.width > rect.size.height)
        scale = rect.size.height / 2.5;
    else
        scale = rect.size.width / 2.5;

    CGFloat radius = 0.06 * scale;
    NSTimeInterval seed = [NSDate timeIntervalSinceReferenceDate];

    CGFloat hue = seed / 20.0;
    hue = hue - (int)hue;
    
    for (NSInteger i = 0; i < QueueLength; i++) {
        [[NSColor colorWithDeviceHue:hue 
                          saturation:1.0 
                          brightness:1.0 
                               alpha:((CGFloat)QueueLength - i + 1) / (CGFloat)QueueLength] setFill];
        
        CGFloat xScaled = self.x(seed) * scale + rect.size.width / 2;
        CGFloat yScaled = self.y(seed) * scale + rect.size.height / 2;
        NSPoint p = NSMakePoint(xScaled, yScaled);

        NSBezierPath * aPath = [NSBezierPath bezierPath];
        [aPath appendBezierPathWithArcWithCenter:p
                                          radius:radius
                                      startAngle:0
                                        endAngle:360];
        [aPath fill];

        radius *= 0.9;
        seed -= 0.07;
    }
}

- (void)animateOneFrame
{
    self.needsDisplay = YES;
    return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
