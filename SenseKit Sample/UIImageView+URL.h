#import <UIKit/UIKit.h>

@interface UIImageView (ImageView_URL)

- (void)setImageURL:(NSURL *)url contentMode:(UIViewContentMode)mode;
- (void)setImageURLString:(NSString *)url contentMode:(UIViewContentMode)mode;

@end
