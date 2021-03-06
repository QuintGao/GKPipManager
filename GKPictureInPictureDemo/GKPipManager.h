//
//  GKPipManager.h
//  GKPictureInPictureDemo
//
//  Created by gaokun on 2021/4/8.
//

#import <UIKit/UIKit.h>
#import <AVKit/AVKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GKPipManager : NSObject

+ (instancetype)sharedManager;

- (void)startPipWithUrl:(NSURL *)url time:(float)time stoppedWhenPlayEnd:(BOOL)stoppedWhenPlayEnd success:(void(^)(void))success failure:(void(^)(NSString *error))failure;

@end

NS_ASSUME_NONNULL_END
