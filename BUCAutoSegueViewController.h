// Copyright (c) 2014 Michael Donald Buckley
// License: MIT (see LICENSE for details)

#import "TargetConditionals.h"

#if TARGET_OS_IPHONE
@import UIKit;
#define BUC_AUTO_SEGUE_VIEW_CONTROLLER_SUPERCLASS UIViewController
#else
@import Cocoa;
#define BUC_AUTO_SEGUE_VIEW_CONTROLLER_SUPERCLASS NSViewController
#endif

@interface BUCAutoSegueViewController : BUC_AUTO_SEGUE_VIEW_CONTROLLER_SUPERCLASS

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender __attribute__((objc_requires_super));

@end
