//
//  NavigationBarView.m
//  Research
//
//  Created by pang on 15/2/3.
//  Copyright (c) 2015年 pang. All rights reserved.
//

#import "NavigationBarView.h"
#define IS_IOS7 [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0
@implementation NavigationBarView

-(instancetype)init
{
    self = [super init];
    
    if (IS_IOS7) {
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64);
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 20, self.frame.size.width - 120, 44)];
        self.backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 20, 60, 44)];
        self.linView = [[UIView alloc]initWithFrame:CGRectMake(0, 63, self.frame.size.width, 1)];
        
    }
    else
    {
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44);
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(60,0, self.frame.size.width - 120, 44)];
        self.backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 44)];
        self.linView = [[UIView alloc]initWithFrame:CGRectMake(0, 43, self.frame.size.width, 1)];
    }
    self.backgroundColor = [UIColor whiteColor];
    
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.font = [UIFont systemFontOfSize:20];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:self.titleLabel];
    
    self.backBtn.backgroundColor = [UIColor clearColor];
    [self.backBtn setImage:[UIImage imageNamed:@"back-icon"] forState:UIControlStateNormal];
    [self.backBtn setTitle:@"返回" forState:UIControlStateNormal];
    //    self.backBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    self.backBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0);
    self.backBtn.adjustsImageWhenHighlighted = NO;
    [self.backBtn setTitleColor:[UIColor colorWithRed:0.0/255.0 green:133.0/255.0 blue:255.0/255.0 alpha:1] forState:UIControlStateNormal];
    [self.backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.backBtn];
    
    self.titleLabel.text = @"默认标题";
    self.linView.backgroundColor = [UIColor lightGrayColor];
    self.linView.alpha = 0.5;
    [self addSubview:self.linView];
    return  self;
}
-(void)setController:(UIViewController *)controller
{
    [controller.view addSubview:self];
    con = controller;
    if (controller.navigationController.viewControllers.count < 2) {
        self.backBtn.hidden = YES;
    }
    
}
-(void)back
{
    [con.navigationController popViewControllerAnimated:YES];
    self.titleLabel = nil;
    self.backBtn = nil;
    con = nil;
}

- (void)dealloc
{
    NSLog(@"navigationBar 已dealloc");
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
