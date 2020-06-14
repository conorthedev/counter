/*
 * counter
 * How many times have you unlocked your device?
 *
 * by ConorTheDev
 * Design + Concept by Mirac (@thatmirac)
 */
#import "CounterManager.h"

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
BOOL previouslyLocked = YES;

%hook Controller
- (void)setAuthenticated:(BOOL)authenticated {
    %orig;

    if(authenticated && previouslyLocked) {
        [[CounterManager sharedInstance] incrementUnlockCount];
    }

    previouslyLocked = !authenticated;
}

- (void)setInScreenOffMode:(BOOL)screenOff {
    %orig;
    previouslyLocked = screenOff ? YES : previouslyLocked;
}
%end

%ctor {    
    %init(Controller = NSClassFromString(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"13") ? @"CSCoverSheetViewController" : @"SBDashBoardViewController"));
}
