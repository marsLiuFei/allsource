//
//  TestDemoViewController.m
//  TestDemo
//
//  Created by liufei on 2020/12/23.
//

#import "TestDemoViewController.h"

@interface TestDemoViewController ()

@end

@implementation TestDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [shareBtn setTitle:@"分享" forState:UIControlStateNormal];
    [shareBtn addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shareBtn];
    [shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.offset(0);
        make.width.mas_offset(80);
        make.height.mas_offset(30);
    }];
}
- (void )share{
    YD_ShareAlertView *alertView = [YD_ShareAlertView new];
    [alertView showInView:[UIApplication sharedApplication].keyWindow];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
