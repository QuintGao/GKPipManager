//
//  PlayerViewController.m
//  GKPictureInPictureDemo
//
//  Created by gaokun on 2021/4/8.
//

#import "PlayerViewController.h"
#import <AVKit/AVKit.h>
#import "GKPipManager.h"
#import <GKMessageTool/GKMessageTool.h>

@interface PlayerViewController ()<AVPictureInPictureControllerDelegate>

@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayerLayer *playerLayer;

@property (nonatomic, strong) UIButton *pipBtn;

@property (nonatomic, strong) AVPictureInPictureController *pipVC;

@end

@implementation PlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.pipBtn];
}

- (void)click {
    __weak __typeof(self) weakSelf = self;
    NSURL *url = [NSURL URLWithString:@"https://aweme.snssdk.com/aweme/v1/play/?video_id=v0200ff70000bck86n4mavf9lsqsr7m0&line=0&ratio=720p&media_type=4&vr_type=0&test_cdn=None&improve_bitrate=0"];
    [GKMessageTool showMessage:@"正在开启画中画..."];
    [[GKPipManager sharedManager] startPipWithUrl:url time:0 stoppedWhenPlayEnd:NO success:^{
        [GKMessageTool hideMessage];
        __strong __typeof(weakSelf) self = weakSelf;
        [self.navigationController popViewControllerAnimated:YES];
    } failure:^(NSString * _Nonnull error) {
        [GKMessageTool showText:[NSString stringWithFormat:@"开启失败，%@", error]];
        NSLog(@"%@", error);
    }];
}

- (UIButton *)pipBtn {
    if (!_pipBtn) {
        _pipBtn = [UIButton new];
        _pipBtn.frame = CGRectMake(self.view.bounds.size.width - 44, 40, 44, 44);
        [_pipBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        UIImage *image = AVPictureInPictureController.pictureInPictureButtonStartImage;
        [_pipBtn setImage:image forState:UIControlStateNormal];
    }
    return _pipBtn;
}

@end
