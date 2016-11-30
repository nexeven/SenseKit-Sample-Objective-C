@import Foundation;
#import "UIImageView+URL.h"

@implementation UIImageView (URL)
- (void)setImageURL:(NSURL *)url contentMode:(UIViewContentMode)mode {
    self.contentMode = mode;
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (response == nil) {
            return;
        }
        
        NSHTTPURLResponse *httpURLResponse = (NSHTTPURLResponse *)response;
        
        if (httpURLResponse.statusCode != 200) {
            return;
        }
        
        if (response.MIMEType == nil || ![response.MIMEType hasPrefix:@"image"]) {
            return;
        }
        
        if (data == nil || error != nil) {
            return;
        }
        
        UIImage *image = [[UIImage alloc] initWithData:data];
        
        if (image == nil) {
            return;
        }
        
        __weak UIImageView *weakSelf = self;
     
        dispatch_async(dispatch_get_main_queue(), ^(void){
            weakSelf.image = image;
        });
    }] resume];
}

- (void)setImageURLString:(NSString *)url contentMode:(UIViewContentMode)mode {
    [self setImageURL:[[NSURL alloc] initWithString:url] contentMode:mode];
}

@end
