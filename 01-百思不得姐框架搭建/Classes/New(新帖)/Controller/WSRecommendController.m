//
//  WSRecommendController.m
//  01-百思不得姐框架搭建
//
//  Created by Ws on 15/12/20.
//  Copyright © 2015年 Ws. All rights reserved.
//

#import "WSRecommendController.h"
#import <AFNetworking.h>
#import "RecommendItem.h"
#import "WSRecommendCell.h"
#import <MJExtension.h>
#import <UIImageView+WebCache.h>
#import <SVProgressHUD.h>

@interface WSRecommendController ()

@property (strong, nonatomic) NSMutableArray *tag_;
@property (strong, nonatomic) AFHTTPSessionManager *manager;


@end

@implementation WSRecommendController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"推荐关注";
    
    [self.tableView registerNib:[UINib nibWithNibName:@"WSRecommendCell" bundle:nil] forCellReuseIdentifier:@"recommend"];
    
//    self.tableView.separatorInset = UIEdgeInsetsMake(0, -100, 0, 80);
    [self loadData];
    
    [SVProgressHUD showWithStatus:@"正在加载"];
}

//界面消失的时候
- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    [SVProgressHUD dismiss];
    
    [_manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    
    [_manager invalidateSessionCancelingTasks:YES];
    
}

#pragma mark -加载网络数据
- (void)loadData {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    _manager = manager;
    //url  http://api.budejie.com/api/api_open.php
    //配置请求参数
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    //a	true	string	tag_recommend
//    action	true	string	sub
//    appname	false	string	参数为baisishequ 分享到朋友圈时候使用
//    asid	false	string	AC824640-5493-4DAD-B356-F84136BE8A55
//    c	true	string	topic
    para[@"a"]      = @"tag_recommend";
    para[@"action"] = @"sub";
    para[@"c"]      = @"topic";
    
    [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:para success:^(NSURLSessionDataTask * _Nonnull task, NSArray  *_Nullable responseObject) {
        //成功请求数据后就关掉蒙版
        [SVProgressHUD dismiss];

        //根据请求过来的数据确定是什么类型的模型
        _tag_ = [RecommendItem mj_objectArrayWithKeyValuesArray:responseObject];
        
        //必须重新刷新数据,因为先调的是下面的方法
        [self.tableView reloadData];
        
       
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error");
    }];
    
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tag_.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"recommend";
    WSRecommendCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    RecommendItem *item = self.tag_[indexPath.row];
    cell.recommendItem = item;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 80;
    
}


@end
