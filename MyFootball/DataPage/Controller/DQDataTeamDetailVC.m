//
//  DQDataTeamDetailVC.m
//  MyFootball
//
//  Created by huangjinyang on 16/10/9.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#define KHeaderHeight 180
#import "DQDataTeamDetailVC.h"
#import "UIScrollView+PullScale.h"
#import "UINavigationHeader.h"
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

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

-(void)initUI{

    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake( 0, 0, UIScreenWidth, UIScreenHeight )];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView addPullScaleFuncInVC:self originalHeight:KHeaderHeight hasNavBar:(self.navigationController!=nil)];
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

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y>=-64) {
        [self.navigationController setNavigationBarHidden:NO];
    }
    else{
        
        if (scrollView.contentOffset.y<=-64&&scrollView.contentOffset.y>=-128) {
            [self.navigationController setNavigationBarHidden:NO];
            
            [self.navigationController.navigationBar lt_setBackgroundColor:RGBA(21, 172, 57, 1-(-scrollView.contentOffset.y-64)/64)];
        }
        else{
            [self.navigationController setNavigationBarHidden:YES];
        }
        
    }
}

@end
