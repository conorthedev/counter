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
    if(authenticated) {
        if(previouslyLocked) {
            previouslyLocked = NO;
            [[CounterManager sharedInstance] incrementUnlockCount];
        }
    } else {
        previouslyLocked = YES;
    }
}

- (void)setInScreenOffMode:(BOOL)screenOff {
    %orig;
    if(screenOff) {
        previouslyLocked = YES;
    }
}
%end

%ctor {    
    %init(Controller = NSClassFromString(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"13") ? @"CSCoverSheetViewController" : @"SBDashBoardViewController"));
}
