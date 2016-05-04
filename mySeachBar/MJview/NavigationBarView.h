//
//  NavigationBarView.h
//  Research
//
//  Created by pang on 15/2/3.
//  Copyright (c) 2015年 pang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavigationBarView : UIView
{
    UIViewController * con;
}@property(nonatomic,strong)UILabel * titleLabel;
@property(nonatomic,strong)UIButton * backBtn;
@property (nonatomic , strong)UIView *linView;

-(void)setController:(UIViewController *)controller;
@end
