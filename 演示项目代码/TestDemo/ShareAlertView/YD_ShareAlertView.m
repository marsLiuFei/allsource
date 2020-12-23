//
//  YD_ShareAlertView.m
//  StudyLawApp
//
//  Created by 如沐春风 on 2020/5/11.
//  Copyright © 2020 群智. All rights reserved.
//

#import "YD_ShareAlertView.h"
#import "CostomButton.h"

#define LFTuanNumViewHight 240.0
#define UI_View_Width  [UIScreen mainScreen].bounds.size.width
#define UI_View_Height [UIScreen mainScreen].bounds.size.height

@interface YD_ShareAlertView()
{
    UIView *_contentView;
    
}
@end

@implementation YD_ShareAlertView

- (id)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self setupContent];
    }
    return self;
}

- (void)setupContent {
    self.frame = CGRectMake(0, 0, UI_View_Width,UI_View_Height);
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(disMissView)]];//点击空白地方移除视图
    
    if (_contentView == nil) {
        _contentView = [[UIView alloc]initWithFrame:CGRectMake(0, UI_View_Height, UI_View_Width, LFTuanNumViewHight)];
        _contentView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_contentView];
        
//        UIBezierPath * maskPath = [UIBezierPath bezierPathWithRoundedRect:_contentView.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:CGSizeMake(10, 10)];
//        CAShapeLayer * maskLayer = [[CAShapeLayer alloc]init];
//        maskLayer.frame = _contentView.bounds;
//        maskLayer.path = maskPath.CGPath;
//        _contentView.layer.mask = maskLayer;
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, UI_View_Width, 40)];
        titleLabel.text = @"选择要分享的平台";
        titleLabel.textColor = [UIColor colorWithRed:34/255.0 green:34/255.0 blue:34/255.0 alpha:1];
        titleLabel.font = [UIFont systemFontOfSize:18];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [_contentView addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_offset(0);
            make.height.mas_offset(40);
            
        }];
        
        UIView *topBg = [[UIView alloc] initWithFrame:CGRectMake(0,40, UI_View_Width, 150)];
        topBg.backgroundColor = [UIColor whiteColor];
        [_contentView addSubview:topBg];
        
        CGFloat width = (UI_View_Width-30)/4.f;
        NSArray *icons  = @[@"function_icon_share_friends",@"function_icon_share_QQ",@"function_icon_share_wechat",@"function_icon_share_weibo"];//
        NSArray *titles = @[@"朋友圈",@"QQ",@"微信",@"微博"];//
        for (int i=0; i<icons.count; i++) {
            CostomButton *btn = [[CostomButton alloc] initWithFrame:CGRectMake(i * width+15, 15, width, 70)];
            btn.imageName = [NSString stringWithFormat:@"Resource.bundle/%@",icons[i]];
            btn.textLable = titles[i];
            [btn setTitleColor:LFRGB(102, 102, 102) forState:UIControlStateNormal];
            [topBg addSubview:btn];
            
            btn.tag = i+100;
            [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        }
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 189, UI_View_Width, 0.5)];
        line.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
        [_contentView addSubview:line];
        
        UIButton *cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 169.5, UI_View_Width, 70)];
        [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [cancelBtn setTitleColor:[UIColor colorWithRed:34/255.0 green:34/255.0 blue:34/255.0 alpha:1] forState:UIControlStateNormal];
        [cancelBtn addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
        [_contentView addSubview:cancelBtn];
    }
}
-(void)cancelAction{
    
    [self disMissView];
    
}

- (void )clickBtn:(UIButton *)sender{
    if (self.clickBtnBlock) {
        self.clickBtnBlock(sender.tag-100);
    }
    [self disMissView];
}








//展示从底部向上弹出的UIView（包含遮罩）
- (void)showInView:(UIView *)view {
    if (!view) {
        return;
    }
    [view addSubview:self];
    [view addSubview:_contentView];
    
    
    _contentView.alpha=0;
    
    self.alpha = 0;
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 1.0;
        self->_contentView.alpha = 1;
        [self->_contentView setFrame:CGRectMake(0, UI_View_Height - LFTuanNumViewHight, UI_View_Width, LFTuanNumViewHight)];
        
    } completion:nil];
}

//移除从上向底部弹下去的UIView（包含遮罩）
- (void)disMissView {
    _contentView.alpha = 1;
    
    [UIView animateWithDuration:0.3f
                     animations:^{
                         self.alpha = 0.0;
                         [self->_contentView setFrame:CGRectMake(0, UI_View_Height , UI_View_Width, 0)];
                         self->_contentView.alpha=0.0;
                     }
                     completion:^(BOOL finished){
                         [self removeFromSuperview];
                         [self->_contentView removeFromSuperview];
                         
                     }];
    
}


@end
