//
//  DQDataTeamDetailVC.m
//  MyFootball
//
//  Created by huangjinyang on 16/10/9.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "DQDataTeamDetailVC.h"
//#import "UINavigationBar+Awesome.h"

@interface DQDataTeamDetailVC ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property(nonatomic,strong)UITableView* tableView;
@property (strong, nonatomic) UIView *header;
@property (strong, nonatomic) UIImageView *headerImageView;
@end

@implementation DQDataTeamDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    self.view.backgroundColor=[UIColor whiteColor];
}

-(void)initUI{
    self.tableView=[[UITableView alloc]init];
    [self.view addSubview:self.tableView];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(-64);
        make.left.right.bottom.equalTo(self.view);
    }];
    
    self.header = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, 107)];
    [self.view addSubview:self.header];
    
    self.headerImageView = [[UIImageView alloc] initWithFrame:self.header.frame];
    self.headerImageView.image = IMAGENAME(@"bg");
    self.headerImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.header.clipsToBounds = YES;
    [self.header addSubview:self.headerImageView];
    
    self.tableView.tableHeaderView= [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.header.frame.size.height + 73)];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar lt_reset];
    
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

#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat alpha = 0;
    
    CATransform3D headerTransform = CATransform3DIdentity;
    
    // 下拉
    if (offsetY < 0) {
        CGFloat headerScaleFactor = -(offsetY) / self.header.bounds.size.height;
        CGFloat headerSizevariation = ((self.header.bounds.size.height * (1.0 + headerScaleFactor)) - self.header.bounds.size.height)/2.0;
        headerTransform = CATransform3DTranslate(headerTransform, 0, headerSizevariation, 0);
        headerTransform = CATransform3DScale(headerTransform, 1.0 + headerScaleFactor, 1.0 + headerScaleFactor, 0);
        self.header.layer.transform = headerTransform;
    }
    // 上拉
    else {
        self.header.hidden=YES;
        
    }

    
    if (offsetY >= 64) {
        alpha=((offsetY-64)/64 <= 1.0 ? (offsetY-64)/64:1);
        [self.navigationController.navigationBar lt_setBackgroundColor:[ThemeColor colorWithAlphaComponent:alpha]];
        self.title=@"球队";
        
    }else{
        [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
        self.title=@"";
    }
    
}

@end
