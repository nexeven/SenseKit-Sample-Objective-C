#import "PlayerViewController.h"
@import SenseKit;

@interface PlayerViewController ()

@end

@implementation PlayerViewController

- (void)viewWillDisappear:(BOOL)animated {
    [self.senseAgent endSession];
    [super viewWillDisappear:animated];
}

- (void)dealloc
{
    self.senseAgent = nil;
}

@end
