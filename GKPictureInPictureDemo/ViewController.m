//
//  ViewController.m
//  GKPictureInPictureDemo
//
//  Created by gaokun on 2021/4/8.
//

#import "ViewController.h"
#import "PlayerViewController.h"
#import "PlayerViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)playClick:(id)sender {
    PlayerViewController *playerVC = [[PlayerViewController alloc] init];
    [self.navigationController pushViewController:playerVC animated:YES];
}

@end
