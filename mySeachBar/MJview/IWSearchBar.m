//
//  IWSearchBar.m
//  ItcastWeibo
//
//  Created by apple on 14-5-6.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "IWSearchBar.h"
#import "UIImage+MJ.h"
#import "searchModel.h"
@interface IWSearchBar()
@end

@implementation IWSearchBar
+ (instancetype)searchBar
{
    return [[self alloc] init];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 背景
        self.background = [UIImage resizedImageWithName:@"searchbar_textfield_background"];
        
        self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        // 左边的放大镜图标
//        UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageWithName:@"searchbar_textfield_search_icon"]];
//        iconView.contentMode = UIViewContentModeCenter;
        
        UIButton *seachBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [seachBtn setBackgroundImage :[UIImage imageWithName:@"searchbar_textfield_search_icon"] forState:UIControlStateNormal];
        [seachBtn addTarget:self action:@selector(seachBtnClick) forControlEvents:UIControlEventTouchUpInside];
        seachBtn.contentMode = UIViewContentModeCenter;
        self.rightView = seachBtn;
        self.rightViewMode = UITextFieldViewModeAlways;
        
        // 字体
        self.font = [UIFont systemFontOfSize:17];
        
        // 右边的清除按钮
//        self.clearButtonMode = UITextFieldViewModeAlways;
        
        
        
        // 设置键盘右下角按钮的样式
        self.returnKeyType = UIReturnKeySearch;
        self.enablesReturnKeyAutomatically = YES;
    }
    return self;
}

- (void)setPlaceHoderStr:(NSString *)placeHoderStr
{
    _placeHoderStr = [placeHoderStr copy];
    // 设置提醒文字
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeHoderStr attributes:attrs];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置右边图标的frame
    self.rightView.frame = CGRectMake(self.frame.size.width -self.frame.size.height, 5, self.frame.size.height -10, self.frame.size.height -10);
}

- (CGRect)placeholderRectForBounds:(CGRect)bounds
{
    return CGRectMake(10, bounds.origin.y, bounds.size.width, bounds.size.height);
}
- (CGRect)editingRectForBounds:(CGRect)bounds
{
   return CGRectMake(10, bounds.origin.y, bounds.size.width, bounds.size.height);
}

- (CGRect)textRectForBounds:(CGRect)bounds
{
    return CGRectMake(10, bounds.origin.y, bounds.size.width, bounds.size.height);
}
#pragma mark 加载数据
- (void)setSeachModel:(searchModel *)seachModel
{
    _seachModel = seachModel;
    NSLog(@"---搜索字符串：%@",seachModel.searchText);
}
#pragma mark 搜索栏上的搜索按钮点击
- (void)seachBtnClick
{
    if ([self.searchDelegate respondsToSelector:@selector(mysearchBarShouldBeginSearch)]){
        [self.searchDelegate performSelector:@selector(mysearchBarShouldBeginSearch)];
    }
}

@end
