//
//  YD_ShareAlertView.h
//  StudyLawApp
//
//  Created by 如沐春风 on 2020/5/11.
//  Copyright © 2020 群智. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YD_ShareAlertView : UIView
/**
 *  @param view 展示在哪个视图上
 */
- (void)showInView:(UIView *)view;
/**
 *  点击了哪种分享功能 0-微信朋友圈 1-微信 2-qq 3-qq空间 4-微博
 */
@property(nonatomic, copy)void (^clickBtnBlock)(NSInteger index);
@end

NS_ASSUME_NONNULL_END
