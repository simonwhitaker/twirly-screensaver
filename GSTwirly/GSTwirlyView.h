//
//  GSTwirlyView.h
//  GSTwirly
//
//  Created by Simon Whitaker on 26/09/2011.
//  License: see UNLICENSE
//

#import <ScreenSaver/ScreenSaver.h>

@interface GSTwirlyView : ScreenSaverView

@property (nonatomic) CGFloat xPeriod, yPeriod;
@property (nonatomic, copy) CGFloat(^x)(NSTimeInterval);
@property (nonatomic, copy) CGFloat(^y)(NSTimeInterval);

@end
