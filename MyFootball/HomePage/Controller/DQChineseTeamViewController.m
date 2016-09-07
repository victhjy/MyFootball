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

-(instancetype)init{
    if (self=[super init]) {
        [self configTableView];
        [self loadArticlesWithIndex:0];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
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
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [_tableView registerClass:[DQChineseTeamCell class] forCellReuseIdentifier:reuseNormalCell];
    [_tableView registerClass:[DQChineseTeamCell class] forCellReuseIdentifier:reuseLabelCell];
    [_tableView registerClass:[DQChineseTeamCell class] forCellReuseIdentifier:reuseImagesCell];
    [_tableView registerClass:[DQChineseTeamCell class] forCellReuseIdentifier:reuseTopCell];
    __weak typeof(self) weakself=self;
    _tableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakself loadArticlesWithIndex:0];
    }];
    
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
    //“推荐 深度”
    else if (model.label){
        cell=[tableView dequeueReusableCellWithIdentifier:reuseLabelCell];
    }
    //“图集”
    else if(model.album){
        cell=[tableView dequeueReusableCellWithIdentifier:reuseImagesCell];
    }
    //normal
    else{
        cell=[tableView dequeueReusableCellWithIdentifier:reuseNormalCell];
    }
    

    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    [cell configWithModel:model];
    return cell;
}

#pragma mark Request
-(void)loadArticlesWithIndex:(NSInteger)index{
    [[DQAFNetManager sharedManager] requestWithMethod:GET WithPath:@"/app/tabs/iphone/56.json" WithParams:nil WithSuccessBlock:^(NSDictionary *dic) {
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
@end
