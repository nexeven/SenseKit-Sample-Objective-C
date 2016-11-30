//
// Created by Nexeven AB on 1/24/15.
// Copyright (c) 2015 Nexeven. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NEAVPlayerSensePlugin;
@class AVPlayer;
@class MPMoviePlayerController;
@class NECustomMetadata;

NS_ASSUME_NONNULL_BEGIN
NS_SWIFT_NAME(SenseKit)
@interface NESenseKit : NSObject 

+ (void)pluginWithAVPlayer:(AVPlayer *)player
                   assetId:(NSString *)assetId
                    nxeCID:(NSString *)nxeCID
                 assetType:(nullable NSString *)assetType
                 assetName:(nullable NSString *)assetName
                  viewerId:(nullable NSString *)viewerId
             assetMetadata:(nullable NSArray<NECustomMetadata *> *)assetMetadata
            viewerMetadata:(nullable NSArray<NECustomMetadata *> *)viewerMetadata

NS_SWIFT_NAME(plugin(forAVPlayer:assetId:nxeCID:assetType:assetName:viewerId:assetMetadata:viewerMetadata:));

+ (void)pluginWithAVPlayer:(AVPlayer *)player
                   assetId:(NSString *)assetId
                serverHost:(nullable NSString *)serverHost
                    nxeCID:(NSString *)nxeCID
                 assetType:(nullable NSString *)assetType
                 assetName:(nullable NSString *)assetName
                  viewerId:(nullable NSString *)viewerId
             assetMetadata:(nullable NSArray<NECustomMetadata *> *)assetMetadata
            viewerMetadata:(nullable NSArray<NECustomMetadata *> *)viewerMetadata

NS_SWIFT_NAME(plugin(forAvPlayer:assetId:serverHost:nxeCID:assetType:assetName:viewerId:assetMetadata:viewerMetadata:));

#if TARGET_OS_IOS
+ (void)pluginWithMPMoviePlayerController:(MPMoviePlayerController *)controller
                                  assetId:(NSString *)assetId
                                   nxeCID:(NSString *)nxeCID
                                assetType:(nullable NSString *)assetType
                                assetName:(nullable NSString *)assetName
                                 viewerId:(nullable NSString *)viewerId
                            assetMetadata:(nullable NSArray<NECustomMetadata *> *)assetMetadata
                           viewerMetadata:(nullable NSArray<NECustomMetadata *> *)viewerMetadata

NS_SWIFT_NAME(plugin(forMPMoviePlayerController:assetId:nxeCID:assetType:assetName:viewerId:assetMetadata:viewerMetadata:));

+ (void)pluginWithMPMoviePlayerController:(MPMoviePlayerController *)controller
                                  assetId:(NSString *)assetId
                               serverHost:(nullable NSString *)serverHost
                                   nxeCID:(NSString *)nxeCID
                                assetType:(nullable NSString *)assetType
                                assetName:(nullable NSString *)assetName
                                 viewerId:(nullable NSString *)viewerId
                            assetMetadata:(nullable NSArray<NECustomMetadata *> *)assetMetadata
                           viewerMetadata:(nullable NSArray<NECustomMetadata *> *)viewerMetadata

NS_SWIFT_NAME(plugin(forMPMoviePlayerController:assetId:serverHost:nxeCID:assetType:assetName:viewerId:assetMetadata:viewerMetadata:));
#endif

+ (void)viewerFaultReport:(NSString *)errorCode
            playerVersion:(NSString *)playerVersion
NS_SWIFT_NAME(viewer(faultReport:playerVersion:));

+ (void)sizeChangedToFullScreen;
+ (void)sizeChangedToWindow;
+ (void)stopPlayback;
+ (void)startAds;
+ (void)stopAds;



@end
NS_ASSUME_NONNULL_END
