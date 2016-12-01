@import AVFoundation;
@import AVKit;
@import SenseKit;

#import "ViewController.h"
#import "TableViewCell.h"
#import "UIImageView+URL.h"

NSString *const videosURL = @"http://dev.nexeven.se/AgentValidation/iOS/assetList.plist";

@interface ViewController ()

@end

@implementation ViewController {
    NSArray *videos;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSDictionary *release = [NSDictionary dictionaryWithContentsOfURL:[NSURL URLWithString:videosURL]];
    videos = [release objectForKey:@"Videos"];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return videos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSDictionary *video = [videos objectAtIndex:indexPath.row];
    cell.titleLabel.text = [video objectForKey:@"Title"];
    cell.descriptionLabel.text = [video objectForKey:@"Description"];
    cell.durationLabel.text = [video objectForKey:@"Duration"];
    [cell.thumbnailImageView setImageURLString:[video objectForKey:@"ImageUrl"] contentMode: UIViewContentModeScaleAspectFit];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *video = [videos objectAtIndex:indexPath.row];
    
    [self loadVideoPlayer:[video objectForKey:@"VideoUrl"]
                  assetId:[video objectForKey:@"AssetID"]
                assetName:[video objectForKey:@"Title"]
                assetType:[video objectForKey:@"AssetType"]];
}

- (void)loadVideoPlayer:(NSString *)url assetId:(NSString *)assetId assetName:(NSString *)assetName assetType:(NSString *)assetType {
    AVPlayerItem *playerItem = [[AVPlayerItem alloc] initWithURL:[[NSURL alloc] initWithString:url]];
    
    AVPlayer *player = [[AVPlayer alloc] initWithPlayerItem:playerItem];
    AVPlayerViewController *playerViewController = [[AVPlayerViewController alloc] init];
    playerViewController.player = player;
    playerViewController.allowsPictureInPicturePlayback = YES;
    playerViewController.showsPlaybackControls = YES;
    
    NECustomMetadata *pair1 = [NECustomMetadata alloc];
    pair1.key = @"AMK1";
    pair1.values = @[@"AMV1", @"AMV11"];
    
    NECustomMetadata *pair2 = [NECustomMetadata alloc];
    pair2.key = @"CMK1";
    pair2.values = @[@"CMV1", @"CMV11"];
    
    [NESenseKit pluginWithAVPlayer:playerViewController.player
                           assetId:assetId
                        serverHost:@"https://sense.nexeven.io"
                            nxeCID:@"BBQCID"
                         assetType:assetType
                         assetName:assetName
                          viewerId:@"jorgenS"
                     assetMetadata:@[pair1]
                    viewerMetadata:@[pair2]];
    
    [player play];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(itemDidPlayToEndTime)
                                                 name:AVPlayerItemDidPlayToEndTimeNotification
                                               object:playerItem];
    
    [self presentViewController:playerViewController animated:true completion:nil];
}

- (void)itemDidPlayToEndTime {
    __weak ViewController *weakSelf = self;
    
    [NSTimer scheduledTimerWithTimeInterval:1 repeats:NO block:^(NSTimer * _Nonnull timer) {
        [weakSelf dismissViewControllerAnimated:true completion:nil];
    }];
}

@end