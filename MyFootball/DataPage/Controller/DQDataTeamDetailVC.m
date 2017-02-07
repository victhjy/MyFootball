//
//  DQDataTeamDetailVC.m
//  MyFootball
//
//  Created by huangjinyang on 16/10/9.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#define KHeaderHeight 200.0
#import "DQDataTeamDetailVC.h"
#import "UIScrollView+PullScale.h"

@interface DQDataTeamDetailVC ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@property(nonatomic,strong)UITableView* tableView;
@end
NSString *const cellId = @"cellID";
@implementation DQDataTeamDetailVC

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

-(void)initUI{

    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake( 0, 0, UIScreenWidth, UIScreenHeight )];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView addPullScaleFuncInVC:self originalHeight:200 hasNavBar:(self.navigationController!=nil)];
    self.tableView.imageV.image = [UIImage imageNamed:@"test"];
    [self.view addSubview:self.tableView];

}

#pragma mark - UITableViewDelegate

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

@end
