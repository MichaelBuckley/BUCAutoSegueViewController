// Copyright (c) 2014 Michael Donald Buckley
// License: MIT (see LICENSE for details)

#import "BUCAutoSegueViewController.h"

@interface BUCAutoSegueViewController ()

@end

@implementation BUCAutoSegueViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString *identifier = [segue identifier];
    
    NSString *prepareForSegueSelectorString = [NSString stringWithFormat:@"prepareForSegue_%@:", identifier];
    SEL prepareForSegueSelector = NSSelectorFromString(prepareForSegueSelectorString);
    
    if ([self respondsToSelector:prepareForSegueSelector]) {
        IMP imp = [self methodForSelector:prepareForSegueSelector];
        void (*prepareForSegueImp)(id, SEL, NSString*) = (void *)imp;
        prepareForSegueImp(self, prepareForSegueSelector, identifier);
    }
    
    NSString *segueTargetString = [NSString stringWithFormat: @"setSegueTarget_%@:", identifier];
    SEL segueTargetSelector = NSSelectorFromString(segueTargetString);
    
    if ([self respondsToSelector: segueTargetSelector]) {
        IMP imp = [self methodForSelector:segueTargetSelector];
        void (*segueTargetImp)(id, SEL, id) = (void *)imp;
        segueTargetImp(self, segueTargetSelector, [segue destinationViewController]);
    }
}
                      
@end
