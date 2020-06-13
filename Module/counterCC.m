#import "counterCC.h"

counterViewController *globalVC;
@implementation counterViewController
- (counterViewController *)initWithNibName:(NSString*)name bundle:(NSBundle*)bundle {
    self = [super initWithNibName:name bundle:bundle];
    if(self) {
        self.counter = [CounterManager sharedInstance];

        self.counterLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, -5, 52, 30)];
        self.counterLabel.textAlignment = NSTextAlignmentCenter;
        self.counterLabel.textColor = [UIColor whiteColor];
        self.counterLabel.text = [NSString stringWithFormat:@"%i", self.counter.unlocks];
        self.counterLabel.font = [UIFont boldSystemFontOfSize:30.0f];
        self.counterLabel.adjustsFontSizeToFitWidth = YES;
        self.counterLabel.minimumScaleFactor = 0.05;
        self.counterLabel.numberOfLines = 1;
        
        [self.view addSubview:self.counterLabel];

        UITapGestureRecognizer *singleFingerTap = 
        [[UITapGestureRecognizer alloc] initWithTarget:self
                                                action:@selector(reset)];
        [self.view addGestureRecognizer:singleFingerTap];
    }
    return self;
}

- (void)willBecomeActive {
    self.counterLabel.center = self.view.center;
    [self.counter sync];
    self.counterLabel.text = [NSString stringWithFormat:@"%i", self.counter.unlocks];
}

- (void)reset {
    [self.counter reset];
    self.counterLabel.text = [NSString stringWithFormat:@"%i", self.counter.unlocks];
}

- (BOOL)_canShowWhileLocked {
    return YES;
}

- (BOOL)shouldBeginTransitionToExpandedContentModule {
    return NO;
}

@end

@implementation counterCC
- (counterCC *)init {
    self = [super init];

    if (self) {
        _contentViewController = [[counterViewController alloc] init];
    }

    return self;
}

@end
