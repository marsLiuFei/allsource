//
//  TestDemoSDKManager.h
//  TestDemoSDK
//
//  Created by liufei on 2020/12/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestDemoSDKManager : NSObject
/**
 *推出分享页面控制器
 *@params navi 当前页面的导航控制器
 */
+ (void )pushShareViewControllerWithCurrentNavi:(UINavigationController *)navi;

@end

NS_ASSUME_NONNULL_END
