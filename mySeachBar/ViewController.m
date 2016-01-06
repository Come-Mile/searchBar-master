//
//  ViewController.m
//  mySeachBar
//
//  Created by Sino on 16/1/6.
//  Copyright (c) 2016年 夏明伟. All rights reserved.
//

#import "ViewController.h"
#import "IWSearchBar.h"
#import "searchModel.h"

@interface ViewController ()<UITableViewDataSource , UITableViewDelegate,UITextFieldDelegate,IWSearchBarDelegate>
@property (nonatomic , weak)UITableView *myTab;
@property (nonatomic , weak)IWSearchBar *mySearchBar;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    [self setUpSeachBar];
    [self setUpMyTab];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)];
    [self.view addGestureRecognizer:tap];
}
#pragma mark 初始化控件
- (void)setUpMyTab
{
    UITableView *tab = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.mySearchBar.frame), self.view.frame.size.width, self.view.frame.size.height -CGRectGetMaxY(self.mySearchBar.frame))];
    tab.dataSource = self;
    tab.delegate = self;
    self.myTab = tab;
    [self.view addSubview:self.myTab];
   
}

- (void)setUpSeachBar
{
    IWSearchBar *searchBar = [IWSearchBar searchBar];
    self.mySearchBar = searchBar;
    // 尺寸
    searchBar.frame = CGRectMake(10, 60, self.view.frame.size.width-20,45);
    searchBar.delegate =self;
    searchBar.searchDelegate = self;
    // 设置中间的标题内容
    //    self.navigationItem.titleView = searchBar;
    [self.view addSubview:searchBar];
}
#pragma mark 点击，搜索框放弃第一响应者
- (void)tapClick
{
    [self.mySearchBar resignFirstResponder];
}

#pragma mark 开始搜索
/**
 *  点击键盘开始搜索
 */
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"1---搜索开始");
    
    searchModel *seaModel = [[searchModel alloc]init];
    seaModel.searchText = textField.text;
    self.mySearchBar.seachModel = seaModel;
    [self.mySearchBar resignFirstResponder];
    //do something what you want
    
    return YES;
}
/**
 *  点击按钮开始搜索
 */
- (void)mysearchBarShouldBeginSearch
{
     NSLog(@"2---搜索开始");
    searchModel *seaModel = [[searchModel alloc]init];
    seaModel.searchText = self.mySearchBar.text;
    self.mySearchBar.seachModel = seaModel;
    [self.mySearchBar resignFirstResponder];
    //do something what you want
}

#pragma Mark UitabViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 0;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}
@end
