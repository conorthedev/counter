#import "../CounterManager.h"

#import "Headers/CCUIContentModule-Protocol.h"
#import "Headers/CCUIContentModuleContentViewController-Protocol.h"

@interface counterViewController : UIViewController <CCUIContentModuleContentViewController>
@property (nonatomic, readonly) CGFloat preferredExpandedContentHeight;
@property (nonatomic, readonly) CGFloat preferredExpandedContentWidth;
@property (nonatomic, readonly) BOOL providesOwnPlatter;
@property (nonatomic, strong) UILabel *counterLabel;
@property (nonatomic, strong) CounterManager *counter;
@end

@interface counterCC : NSObject <CCUIContentModule>
@property (nonatomic, readonly) counterViewController *contentViewController;
@property (nonatomic, readonly) UIViewController *backgroundViewController;
@end
