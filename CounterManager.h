@interface NSDistributedNotificationCenter : NSNotificationCenter
+ (instancetype)defaultCenter;
- (void)postNotificationName:(NSString *)name object:(NSString *)object userInfo:(NSDictionary *)userInfo deliverImmediately:(BOOL)deliverImmediately;
- (void)addObserver:(id)observer selector:(SEL)selector name:(NSNotificationName)name object:(NSString *)object;
@end

@interface CounterManager : NSObject
@property (nonatomic) int unlocks;
@property (nonatomic, retain) NSTimer *timer;

+ (CounterManager *)sharedInstance;
+ (CounterManager *)init;

- (void)incrementUnlockCount;
- (void)sync;
- (void)reset;
@end
