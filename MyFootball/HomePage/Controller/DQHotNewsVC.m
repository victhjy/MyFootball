//
//  DQHotNewsViewController.m
//  MyFootball
//
//  Created by huangjinyang on 16/9/5.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "DQHotNewsVC.h"
#import "DYMRollingBannerVC.h"
#import "YYFPSLabel.h"
#import "HJYSTMainVC.h"
#import "DQHotNewsModel.h"
#import "DQUniversalCell.h"


#define HeaderViewH 160

@interface DQHotNewsVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,strong)UIView* searchView;

@property(nonatomic, strong) NSMutableArray *dataArr;
@property(nonatomic, strong) DQHotNewsModel *hotNewsModel;
@end

@implementation DQHotNewsVC
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
    
    [self loadData];
    
    // Do any additional setup after loading the view.
}

-(void)creatingBanner{
    _rollingBannerVC = [DYMRollingBannerVC new];
    [self addChildViewController:_rollingBannerVC];
    [_rollingBannerVC didMoveToParentViewController:self];
    _rollingBannerVC.rollingInterval=5;
    
    NSArray* showedImages=[NSArray new];
    YYCache* cache=[YYCache cacheWithName:@"DQD"];
    if ([cache containsObjectForKey:DQCACHEKEYBannerImages]) {
        showedImages=(NSArray* )[cache objectForKey:DQCACHEKEYBannerImages];
    }
    else{
        UIImage* image1=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://jiangsu.china.com.cn/uploadfile/2016/0811/1470877745678390.jpg"]]];
        UIImage* image2=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://cmsimg.sports.cn/Image/140829/54-140RZI133354.jpg"]]];
        UIImage* image3=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://sports.scol.com.cn/gjfootball/img/attachement/jpg/site2/20120426/001d093215011103063056.jpg"]]];
        UIImage* image4=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://cdnq.duitang.com/uploads/item/201502/02/20150202135339_XmNLE.thumb.700_0.jpeg"]]];
        
        showedImages=@[image1,image2,image3,image4];
        [cache setObject:showedImages forKey:DQCACHEKEYBannerImages];
    }

    // setup the rolling images

//                                       
    _rollingBannerVC.rollingImages = showedImages;

    // Start auto rolling (optional, default does not auto roll)
    
}

-(void)configTableView{
    __weak __typeof(self)weakSelf = self;
    _tableView=[[UITableView alloc]init];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    _tableView.tableHeaderView=_rollingBannerVC.view;
    _tableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadData];
    }];
    _tableView.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakSelf loadMoreData];
    }];
//    _tableView.emptyDataSetVisible
    
//    [_tableView addSubview:self.searchView];
    [_rollingBannerVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_tableView).offset(0);
        make.left.equalTo(_tableView);
        make.width.mas_equalTo(UIScreenWidth);
        make.height.mas_equalTo(HeaderViewH-40);
    }];
    CGRect oldFrame=_tableView. tableHeaderView.frame;
    CGRect newFrame=CGRectMake(oldFrame.origin.x, oldFrame.origin.y+20, oldFrame.size.width, HeaderViewH-40);
    
    UIView *view=_tableView. tableHeaderView;
    view.frame=newFrame;
    _tableView. tableHeaderView =view;

    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-49);
    }];
    
    [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([DQUniversalCell class]) bundle:nil] forCellReuseIdentifier:@"universalCell"];
    
    [_rollingBannerVC startRolling];
}

#pragma mark - Request

- (void)loadData {
    __weak __typeof(self)weakSelf = self;
    [[DQAFNetManager sharedManager] requestWithMethod:GET WithPath:APIHotNews WithParams:nil WithSuccessBlock:^(NSDictionary *dic) {
        DQHotNewsModel* model=[DQHotNewsModel mj_objectWithKeyValues:dic];
//        [MyTools importADic:model.articles[0]];
//        [MyTools importADic:model.ad[0]];
        weakSelf.hotNewsModel=model;
        model.articles=[DQHotNewsSingleItem mj_objectArrayWithKeyValuesArray:model.articles];
        weakSelf.dataArr=[NSMutableArray new];
        weakSelf.dataArr=[model.articles mutableCopy];
        
        if (weakSelf.hotNewsModel.ad.count>0) {
            DQLog(@"有广告");
        }
        
//        [weakSelf.tableView setContentOffset:CGPointMake(0, -10) animated:YES];
        [weakSelf.tableView reloadData];
        [weakSelf.tableView.mj_header endRefreshing];
        
    } WithFailurBlock:^(NSError *error) {
        [weakSelf.tableView.mj_header endRefreshing];
    }];
}

- (void)loadMoreData {
    __weak __typeof(self)weakSelf = self;
    [[DQAFNetManager sharedManagerAbsoluteUrl] requestWithMethod:GET WithPath:self.hotNewsModel.next WithParams:nil WithSuccessBlock:^(NSDictionary *dic) {
        
        weakSelf.hotNewsModel=[DQHotNewsModel mj_objectWithKeyValues:dic];
        weakSelf.hotNewsModel.articles=[DQHotNewsSingleItem mj_objectArrayWithKeyValuesArray:weakSelf.hotNewsModel.articles];
        [weakSelf.dataArr addObjectsFromArray:weakSelf.hotNewsModel.articles];
        [weakSelf.tableView reloadData];
        [weakSelf.tableView.mj_footer endRefreshing];
    } WithFailurBlock:^(NSError *error) {
        [weakSelf.tableView.mj_footer endRefreshing];
    }];
}

#pragma mark TableViewDelegate&&Datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 84;
}

-(UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DQHotNewsSingleItem* singleItem=self.dataArr[indexPath.row];
    DQUniversalCell* cell=[tableView dequeueReusableCellWithIdentifier:@"universalCell"];
    [cell bindData:singleItem];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.selectionStyle != UITableViewCellSelectionStyleNone) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    if (indexPath.row==0) {
        NSMutableArray* arr=[NSMutableArray arrayWithArray:@[@1,@2,@3,@4,@5,@6,@7,@8,@9,@2,@3,@4,@5,@6,@7,@8,@9,@2,@3,@4,@5,@6,@7,@8,@9]];
        HJYSTMainVC* mainVC=[[HJYSTMainVC alloc]initWithLines:arr andFrame:CGRectMake(0, 0, UIScreenWidth, UIScreenHeight)];
        mainVC.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:mainVC animated:YES];
    }
}

#pragma mark - private method

-(UIView* )searchView{
    if (!_searchView) {
        _searchView=[UIView new];
        _searchView.backgroundColor=[UIColor grayColor];
        _searchView.frame=CGRectMake(0, 0, UIScreenWidth, 20);
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
