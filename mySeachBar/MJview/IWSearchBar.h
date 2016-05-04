//
//  IWSearchBar.h
//  ItcastWeibo
//
//  Created by apple on 14-5-6.
//  Copyright (c) 2014年 itcast. All rights reserved.
//  自定义搜索框

#import <UIKit/UIKit.h>

@class searchModel;
@protocol IWSearchBarDelegate <NSObject>

- (void)mysearchBarShouldBeginSearch;

@end
@interface IWSearchBar : UITextField
+ (instancetype)searchBar;

@property (nonatomic , strong)searchModel *seachModel;
@property (nonatomic , copy)NSString *placeHoderStr;

@property (nonatomic ,weak)id<IWSearchBarDelegate>searchDelegate;
@end
