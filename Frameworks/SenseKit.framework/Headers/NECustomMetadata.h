//
// Created by Nexeven AB on 7/13/15.
// Copyright (c) 2015 nexeven. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
NS_SWIFT_NAME(CustomMetadata)
@interface NECustomMetadata : NSObject

@property NSString *key;
@property NSArray<NSString *> *values;

@end
NS_ASSUME_NONNULL_END
