//
//  DQDataTeamDetailVC.m
//  MyFootball
//
//  Created by huangjinyang on 16/10/9.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "DQDataTeamDetailVC.h"
#import "SimulateTwitterView.h"

@interface DQDataTeamDetailVC ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@end

@implementation DQDataTeamDetailVC
{
    SimulateTwitterView *_simulateTwitterView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.alpha=0;
    _simulateTwitterView = [[SimulateTwitterView alloc]initTableViewWithBackgound:[UIImage imageNamed:@"bale"] avatarImage:[UIImage imageNamed:@"2016"] titleString:nil         subtitleString:nil];
    [self.view addSubview:_simulateTwitterView];
    _simulateTwitterView.tableView.delegate=self;
    _simulateTwitterView.tableView.dataSource=self;
    self.view.backgroundColor=[UIColor whiteColor];
    [self scrollViewDidScroll:_simulateTwitterView.tableView];
//    [simulateTwitterView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self);
//        make.left.right.with.equalTo(self);
//        make.height.mas_equalTo(UIScreenHeight/4);
//    }];
    // Do any additional setup after loading the view.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text=[NSString stringWithFormat:@"%zd",indexPath.row];
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y>44) {
        DQLog(@"大于44了  %f",scrollView.contentOffset.y);
        [_simulateTwitterView removeFromSuperview];
        
    }
    else{
        DQLog(@"并没有  %f",scrollView.contentOffset.y);
        [self.view addSubview:_simulateTwitterView];
    }
}

@end
