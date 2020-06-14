#import "CounterManager.h"
NSUserDefaults *defaults;

@implementation CounterManager
+ (CounterManager *)sharedInstance {
    static CounterManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"sharedInstance");
        defaults = [[NSUserDefaults alloc] initWithSuiteName:@"me.conorthedev.counter"];
        [defaults synchronize];

        sharedInstance = [[CounterManager alloc] init];
        sharedInstance.unlocks = [defaults integerForKey:@"unlocks"];
    });
    return sharedInstance;
}

+ (CounterManager *)init {
    return [CounterManager sharedInstance];    
}

- (void)incrementUnlockCount {
    [self sync];
    self.unlocks++;
    [defaults setInteger:self.unlocks forKey:@"unlocks"];
    [defaults synchronize];

    [[NSDistributedNotificationCenter defaultCenter] postNotificationName:@"me.conorthedev.unlockcounter/UpdateText" object:nil userInfo:nil deliverImmediately:YES];
}

- (void)reset {
    self.unlocks = 0;
    [defaults setInteger:self.unlocks forKey:@"unlocks"];
    [defaults synchronize];
}

- (void)sync {
    [defaults synchronize];
    self.unlocks = [defaults integerForKey:@"unlocks"];
}
@end
