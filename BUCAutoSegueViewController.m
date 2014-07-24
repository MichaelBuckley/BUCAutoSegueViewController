// Copyright (c) 2014 Michael Donald Buckley
// License: MIT (see LICENSE for details)

#import "BUCAutoSegueViewController.h"

@interface BUCAutoSegueViewController ()

@end

@implementation BUCAutoSegueViewController

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    BOOL shouldPerformSegue = YES;
    
    NSString *shouldPerformString = [@"shouldPerformSegue_" stringByAppendingString: identifier];
    SEL shouldPerformSelector = NSSelectorFromString(shouldPerformString);
    
    if ([self respondsToSelector: shouldPerformSelector]) {
        IMP imp = [self methodForSelector:shouldPerformSelector];
        BOOL (*shouldPerformImp)(id, SEL) = (void *) imp;
        shouldPerformSegue = shouldPerformImp(self, shouldPerformSelector);
    }
    
    return shouldPerformSegue;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString *identifier = [segue identifier];
    
    NSString *segueTargetString = [NSString stringWithFormat: @"setSegueTarget_%@:", identifier];
    SEL segueTargetSelector = NSSelectorFromString(segueTargetString);
    
    if ([self respondsToSelector: segueTargetSelector]) {
        IMP imp = [self methodForSelector:segueTargetSelector];
        void (*segueTargetImp)(id, SEL, id) = (void *)imp;
        segueTargetImp(self, segueTargetSelector, [segue destinationViewController]);
    }
    
    NSString *prepareForSegueSelectorString = [NSString stringWithFormat:@"prepareForSegue_%@:sender:", identifier];
    SEL prepareForSegueSelector = NSSelectorFromString(prepareForSegueSelectorString);
    
    if ([self respondsToSelector:prepareForSegueSelector]) {
        IMP imp = [self methodForSelector:prepareForSegueSelector];
        void (*prepareForSegueImp)(id, SEL, UIStoryboardSegue *, id) = (void *)imp;
        prepareForSegueImp(self, prepareForSegueSelector, segue, sender);
    }
}
                      
@end
