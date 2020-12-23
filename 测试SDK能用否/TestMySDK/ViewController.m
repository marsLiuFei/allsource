//
//  ViewController.m
//  TestMySDK
//
//  Created by liufei on 2020/12/23.
//

#import "ViewController.h"
#import <TestDemoSDK/TestDemoSDKManager.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)pushNewVC:(UIButton *)sender {
    [TestDemoSDKManager pushShareViewControllerWithCurrentNavi:self.navigationController];
}

@end
