//
//  TestDemoSDKManager.m
//  TestDemoSDK
//
//  Created by liufei on 2020/12/23.
//

#import "TestDemoSDKManager.h"
#import "TestDemoViewController.h"

@implementation TestDemoSDKManager
/**
 *推出分享页面控制器
 *@params navi 当前页面的导航控制器
 */
+ (void )pushShareViewControllerWithCurrentNavi:(UINavigationController *)navi{
    TestDemoViewController *vc = [TestDemoViewController new];
    [navi pushViewController:vc animated:YES];
}
@end
