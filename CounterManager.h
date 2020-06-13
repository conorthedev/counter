@interface CounterManager : NSObject
@property (nonatomic) int unlocks;
@property (nonatomic, retain) NSTimer *timer;

+ (CounterManager *)sharedInstance;
+ (CounterManager *)init;

- (void)incrementUnlockCount;
- (void)sync;
- (void)reset;
@end
