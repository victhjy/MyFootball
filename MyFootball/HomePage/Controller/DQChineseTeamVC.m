//
//  DQChineseTeamViewController.m
//  MyFootball
//
//  Created by huangjinyang on 16/9/5.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "DQChineseTeamVC.h"
#import "DQChineseTeamModel.h"
#import "DQChineseTeamCell.h"
#import "DQNewsDetailViewController.h"
#import "DQChineseTeamGifCell.h"
@import GoogleMobileAds;
@interface DQChineseTeamVC ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray* articles;
@property(nonatomic,strong)DQChineseTeamModel* model;
@property(nonatomic, strong) GADBannerView *bannerView;
@end

@implementation DQChineseTeamVC

{
    MACTableView* _tableView;
}

static NSString* reuseNormalCell=@"chineseTeamCell";
static NSString* reuseLabelCell=@"chineseTeamLabelCell";
static NSString* reuseImagesCell=@"chineseTeamImagesCell";
static NSString* reuseImageAndLabel=@"chineseTeamImageAndLabelCell";

static NSString* reuseGifCell=@"gifCell";

-(instancetype)init{
    if (self=[super init]) {
        [self configTableView];
        [self loadArticles];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self configTableView];
//    [self loadArticlesWithIndex:0];
    
    
    // Do any additional setup after loading the view.
}

-(void)configTableView{
    _tableView=[[MACTableView alloc]init];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).mas_offset(UIEdgeInsetsMake(0, 0, 100, 0));
    }];
    _tableView.scrollsToTop=YES;
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [_tableView registerClass:[DQChineseTeamCell class] forCellReuseIdentifier:reuseNormalCell];
    [_tableView registerClass:[DQChineseTeamCell class] forCellReuseIdentifier:reuseLabelCell];
    [_tableView registerClass:[DQChineseTeamCell class] forCellReuseIdentifier:reuseImagesCell];
    [_tableView registerClass:[DQChineseTeamCell class]  forCellReuseIdentifier:reuseImageAndLabel];
    [_tableView registerClass:[DQChineseTeamGifCell class] forCellReuseIdentifier:reuseGifCell];
    __weak typeof(self) weakself=self;
    _tableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakself loadArticles];
    }];
    _tableView.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakself loadMoreArticlesWithModel:self.model];
    }];
    _tableView.backgroundColor=[MyTools colorWithHexString:@"0xf4f3f4"];
    
    self.bannerView = [[GADBannerView alloc]initWithFrame:CGRectMake(0,self.view.height - 50, UIScreenWidth, 50)];;
    [self.view addSubview:self.bannerView];

    self.bannerView.adUnitID = @"ca-app-pub-5964239870068429/6168523693";
    self.bannerView.rootViewController = self;
    
    GADRequest *request = [GADRequest request];
    // Requests test ads on devices you specify. Your test device ID is printed to the console when
    // an ad request is made. GADBannerView automatically returns test ads when running on a
    // simulator.
    request.testDevices = @[
                            [MyTools getDeviceIdentifier]  // Eric's iPod Touch
                            ];
    [self.bannerView loadRequest:request];
    
}

#pragma mark TableView Delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
//    return 0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.articles.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
     DQChineseTeamListModel* model=self.articles[indexPath.row];
    if ([model.collection_type isEqualToString:@"gif"]) {
        return 220;
    }
    else{
        DQChineseTeamCell* cell;
        if (model.album) {
            cell=[tableView dequeueReusableCellWithIdentifier:reuseImagesCell];
            [cell configWithModel:model];
            return 134;
        }
        else{
            return 84;
        }
    }
    
}

-(UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DQChineseTeamListModel* model=self.articles[indexPath.row];
    
    if ([model.collection_type isEqualToString:@"gif"]) {
        DQChineseTeamGifCell* cell;
        cell=[tableView dequeueReusableCellWithIdentifier:reuseGifCell];
        [cell configViewWithModel:model];
        
        return cell;
    }else{
        DQChineseTeamCell* cell;
        //“图集”
        if(model.album&&!model.label){
            cell=[tableView dequeueReusableCellWithIdentifier:reuseImagesCell];
        }
        //“推荐 深度”
        else if (model.label&&!model.album){
            cell=[tableView dequeueReusableCellWithIdentifier:reuseLabelCell];
        }
        else if (model.album&&model.label){
            cell=[tableView dequeueReusableCellWithIdentifier:reuseImageAndLabel];
        }
        //normal
        else{
            cell=[tableView dequeueReusableCellWithIdentifier:reuseNormalCell];
        }
        
        
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        [cell configWithModel:model];
        return cell;
    }

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DQChineseTeamListModel* model=self.articles[indexPath.row];
    DQNewsDetailViewController* detail=[[DQNewsDetailViewController alloc]init];
    detail.detailModel=model;
    detail.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:detail animated:YES];
    
}

#pragma mark Request
-(void)loadArticles{
    NSDictionary* parDic=@{
                           @"mark":@"gif"
                           };

    [[DQAFNetManager sharedManager] requestWithMethod:GET WithPath:APIChinsesTeamList WithParams:parDic WithSuccessBlock:^(NSDictionary *dic) {
        if (dic) {
            self.model=(DQChineseTeamModel* )[DQChineseTeamModel mj_objectWithKeyValues:dic];
            self.articles=[NSMutableArray new];
            self.articles=[DQChineseTeamListModel mj_objectArrayWithKeyValuesArray:self.model.articles];
            
            [_tableView reloadData];
            [_tableView.mj_header endRefreshing];
        }
        
    } WithFailurBlock:^(NSError *error) {
        NSLog(@" request error %@",error);
            [_tableView.mj_header endRefreshing];
    }];
}

-(void)loadMoreArticlesWithModel:(DQChineseTeamModel*)model{
    NSDictionary* paramDic=@{@"after":[NSNumber numberWithInteger:model.min],@"page":[NSNumber numberWithInteger:model.page],@"mark":@"gif"};
    [[DQAFNetManager sharedManager] requestWithMethod:GET WithPath:APIChinsesTeamList WithParams:paramDic WithSuccessBlock:^(NSDictionary *dic) {
        if (dic) {
            self.model=(DQChineseTeamModel* )[DQChineseTeamModel mj_objectWithKeyValues:dic];
            NSArray* newArticles=[DQChineseTeamListModel mj_objectArrayWithKeyValuesArray:self.model.articles];
            [self.articles addObjectsFromArray:newArticles];
            [_tableView reloadData];
            [_tableView.mj_footer endRefreshing];
        }
        
    } WithFailurBlock:^(NSError *error) {
        NSLog(@" request error %@",error);
        [_tableView.mj_footer endRefreshing];
    }];
}


@end
