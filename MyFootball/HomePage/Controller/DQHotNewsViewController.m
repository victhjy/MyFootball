//
//  DQHotNewsViewController.m
//  MyFootball
//
//  Created by huangjinyang on 16/9/5.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "DQHotNewsViewController.h"
#import "DYMRollingBannerVC.h"
#import "YYFPSLabel.h"

@interface DQHotNewsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,strong)UIView* searchView;
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
    
    YYFPSLabel* fps=[[YYFPSLabel alloc]initWithFrame:CGRectMake(UIScreenWidth/2-100, 44, 55, 20)];
    [[UIApplication sharedApplication].windows[0] addSubview:fps];
    
    // Do any additional setup after loading the view.
}

-(void)creatingBanner{
    _rollingBannerVC = [DYMRollingBannerVC new];
    [self addChildViewController:_rollingBannerVC];
    [_rollingBannerVC didMoveToParentViewController:self];
    _rollingBannerVC.rollingInterval=5;
    
    NSArray* showedImages=[NSArray new];
//    showedImages=(NSArray* )[MyTools getCacheDataForKey:@"DQBannerImages"];
    YYCache* cache=[YYCache cacheWithName:@"DQD"];
    if ([cache containsObjectForKey:DQCACHEKEYBannerImages]) {
        showedImages=(NSArray* )[cache objectForKey:DQCACHEKEYBannerImages];
        DQLog(@"get banner images from cache");
    }
    else{
        UIImage* image1=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://jiangsu.china.com.cn/uploadfile/2016/0811/1470877745678390.jpg"]]];
        UIImage* image2=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://cmsimg.sports.cn/Image/140829/54-140RZI133354.jpg"]]];
        UIImage* image3=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://sports.scol.com.cn/gjfootball/img/attachement/jpg/site2/20120426/001d093215011103063056.jpg"]]];
        UIImage* image4=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://cdnq.duitang.com/uploads/item/201502/02/20150202135339_XmNLE.thumb.700_0.jpeg"]]];
        
        showedImages=@[image1,image2,image3,image4];
        [cache setObject:showedImages forKey:DQCACHEKEYBannerImages];
        DQLog(@"cached banner images");
//        [MyTools cacheData:showedImages withKey:@"DQBannerImages"];
    }

    // setup the rolling images

//                                       
    _rollingBannerVC.rollingImages = showedImages;

    // Start auto rolling (optional, default does not auto roll)
    
}

-(void)configTableView{
    _tableView=[[UITableView alloc]init];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.contentInset=UIEdgeInsetsMake(20, 0, 0, 0);
    
    _tableView.tableHeaderView=_rollingBannerVC.view;
    
    [_tableView addSubview:self.searchView];
    
    
    [_rollingBannerVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(_tableView);
        make.width.mas_equalTo(UIScreenWidth);
        make.height.mas_equalTo(180);
    }];
    CGRect oldFrame=_tableView. tableHeaderView.frame;
    CGRect newFrame=CGRectMake(oldFrame.origin.x, oldFrame.origin.y, oldFrame.size.width, 180);
    
    UIView *view=_tableView. tableHeaderView;
    view.frame=newFrame;
    _tableView. tableHeaderView =view;

    DQLog(@"高度  %f",_tableView.tableHeaderView.frame.size.height);
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-49);
    }];
    
    [_rollingBannerVC startRolling];
}

#pragma mark TableViewDelegate&&Datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell;
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text=@"紧急处理中……";
    return cell;
}

#pragma mark - private method

-(UIView* )searchView{
    if (!_searchView) {
        _searchView=[UIView new];
        _searchView.backgroundColor=[UIColor grayColor];
        _searchView.frame=CGRectMake(0, -20, UIScreenWidth, 20);
    }
    return _searchView;
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
