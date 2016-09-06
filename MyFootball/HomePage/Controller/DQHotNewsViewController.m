//
//  DQHotNewsViewController.m
//  MyFootball
//
//  Created by huangjinyang on 16/9/5.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "DQHotNewsViewController.h"
#import "DYMRollingBannerVC.h"

@interface DQHotNewsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView* tableView;
@end

@implementation DQHotNewsViewController
{
    DYMRollingBannerVC      *_rollingBannerVC;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self creatingBanner];
    [self configTableView];
    // Do any additional setup after loading the view.
}

-(void)creatingBanner{
    _rollingBannerVC = [DYMRollingBannerVC new];
    [self addChildViewController:_rollingBannerVC];
//    [self.view addSubview:_rollingBannerVC.view];
    
    // The code below lays out the _rollingBannerVC's view using Masonry
//    [_rollingBannerVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leading.top.and.right.equalTo(self.view);
//        make.height.equalTo(@180);
//    }];
    
    [_rollingBannerVC didMoveToParentViewController:self];
    _rollingBannerVC.rollingInterval=5;
    
    NSArray* imageUrl=@[@"http://jiangsu.china.com.cn/uploadfile/2016/0811/1470877745678390.jpg"
                        , @"http://cmsimg.sports.cn/Image/140829/54-140RZI133354.jpg"
                        , @"http://sports.scol.com.cn/gjfootball/img/attachement/jpg/site2/20120426/001d093215011103063056.jpg"
                        , @"http://img3.imgtn.bdimg.com/it/u=3982668665,3056609966&fm=21&gp=0.jpg"
                        , @"http://cdnq.duitang.com/uploads/item/201502/02/20150202135339_XmNLE.thumb.700_0.jpeg"
                        ];
    // setup the rolling images
    _rollingBannerVC.rollingImages = @[[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl[0]]]],[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl[1]]]],[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl[2]]]],[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl[4]]]]
                                       ];
    
    // Start auto rolling (optional, default does not auto roll)
    
}

-(void)configTableView{
    _tableView=[[UITableView alloc]init];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    
    _tableView.tableHeaderView=_rollingBannerVC.view;
    [_rollingBannerVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(_tableView);
        make.width.mas_equalTo(UIScreenWidth);
        make.height.mas_equalTo(180);
    }];
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    [_rollingBannerVC startRolling];
}

#pragma mark TableViewDelegate&&Datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}

-(UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
