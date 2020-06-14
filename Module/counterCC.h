#import "../CounterManager.h"
#import "Headers/CCUIContentModule-Protocol.h"
#import "Headers/CCUIContentModuleContentViewController-Protocol.h"
#import <libcolorpicker.h>

@interface CounterViewController : UIViewController <CCUIContentModuleContentViewController>
@property (nonatomic, readonly) CGFloat preferredExpandedContentHeight;
@property (nonatomic, readonly) CGFloat preferredExpandedContentWidth;
@property (nonatomic, readonly) BOOL providesOwnPlatter;
@property (nonatomic, strong) UIView *moduleMaterialView;
@property (nonatomic, strong) UILabel *counterLabel;
@property (nonatomic, strong) CounterManager *counter;

- (void)updateText;
@end

@interface counterCC : NSObject <CCUIContentModule>
@property (nonatomic, readonly) CounterViewController *contentViewController;
@property (nonatomic, readonly) UIViewController *backgroundViewController;
@end

@interface CALayer (Private)
- (void)setContinuousCorners:(bool)continuousCorners;
@end
