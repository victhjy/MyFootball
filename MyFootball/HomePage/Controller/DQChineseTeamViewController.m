//
//  DQChineseTeamViewController.m
//  MyFootball
//
//  Created by huangjinyang on 16/9/5.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "DQChineseTeamViewController.h"
#import "DQChineseTeamModel.h"
#import "DQChineseTeamCell.h"
#import "DQNewsDetailViewController.h"
@interface DQChineseTeamViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray* articles;
@property(nonatomic,strong)DQChineseTeamModel* model;
@end

@implementation DQChineseTeamViewController

{
    UITableView* _tableView;
}

static NSString* reuseNormalCell=@"chineseTeamCell";
static NSString* reuseLabelCell=@"chineseTeamLabelCell";
static NSString* reuseImagesCell=@"chineseTeamImagesCell";
static NSString* reuseTopCell=@"chinsesTeamTopCell";
static NSString* reuseImageAndLabel=@"chineseTeamImageAndLabelCell";

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
    _tableView=[[UITableView alloc]init];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).mas_offset(UIEdgeInsetsMake(0, 0, 50, 0));
    }];
    _tableView.scrollsToTop=YES;
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [_tableView registerClass:[DQChineseTeamCell class] forCellReuseIdentifier:reuseNormalCell];
    [_tableView registerClass:[DQChineseTeamCell class] forCellReuseIdentifier:reuseLabelCell];
    [_tableView registerClass:[DQChineseTeamCell class] forCellReuseIdentifier:reuseImagesCell];
    [_tableView registerClass:[DQChineseTeamCell class] forCellReuseIdentifier:reuseTopCell];
    [_tableView registerClass:[DQChineseTeamCell class]  forCellReuseIdentifier:reuseImageAndLabel];
    __weak typeof(self) weakself=self;
    _tableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakself loadArticles];
    }];
    _tableView.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakself loadMoreArticlesWithModel:self.model];
    }];
    _tableView.backgroundColor=[MyTools colorWithHexString:@"0xf4f3f4"];
}

#pragma mark TableView Delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.articles.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
     DQChineseTeamListModel* model=self.articles[indexPath.row];
    DQChineseTeamCell* cell;
    if (model.album) {
        cell=[tableView dequeueReusableCellWithIdentifier:reuseImagesCell];
        [cell configWithModel:model];
        return [cell heightForCell];
    }
    else{
        return 84;
    }
}

-(UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DQChineseTeamListModel* model=self.articles[indexPath.row];
    DQChineseTeamCell* cell;
    //置顶
    if (model.top) {
        cell=[tableView dequeueReusableCellWithIdentifier:reuseTopCell];
    }
    //“图集”
    else if(model.album&&!model.label){
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DQChineseTeamListModel* model=self.articles[indexPath.row];
    DQNewsDetailViewController* detail=[[DQNewsDetailViewController alloc]init];
    detail.detailModel=model;
    detail.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:detail animated:YES];
    
}

#pragma mark Request
-(void)loadArticles{

    [[DQAFNetManager sharedManager] requestWithMethod:GET WithPath:APIChinsesTeamList WithParams:nil WithSuccessBlock:^(NSDictionary *dic) {
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
    NSDictionary* paramDic=@{@"after":[NSNumber numberWithInteger:model.min],@"page":[NSNumber numberWithInteger:model.page]};
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
