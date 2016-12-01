#import "PlayerViewController.h"
@import SenseKit;

@interface PlayerViewController ()

@end

@implementation PlayerViewController

- (void)viewWillDisappear:(BOOL)animated {
    [NESenseKit stopPlayback];
    [super viewWillDisappear:animated];
}

@end
