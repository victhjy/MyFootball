//
//  DQCommentsViewController.m
//  MyFootball
//
//  Created by huangjinyang on 16/9/8.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "DQCommentsViewController.h"
#import "DQCommentCell.h"
#import "DQCommentModel.h"
@interface DQCommentsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,strong)UIToolbar* toolBar;
@property(nonatomic,strong)NSMutableArray* hotComments;
@property(nonatomic,strong)NSMutableArray* normalComments;
@property(nonatomic,strong)DQCommentModel* commentModel;
@end

@implementation DQCommentsViewController
static NSString* reuseNormalCell=@"reuseNormalCell";
static NSString* reuseCommentInCommentCell=@"reuseCommentInCommentCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configTableView];
    [self loadComments];
    // Do any additional setup after loading the view.
}

-(void)configTableView{
    _tableView=[UITableView new];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).mas_offset(UIEdgeInsetsMake(0, 0, 50, 0));
    }];
    [_tableView registerClass:[DQCommentCell class] forCellReuseIdentifier:reuseNormalCell];
    [_tableView registerClass:[DQCommentCell class] forCellReuseIdentifier:reuseCommentInCommentCell];
    
    _toolBar=[[UIToolbar alloc]init];
    _toolBar.backgroundColor=[MyTools colorWithHexString:@"0xefefef"];
    [self.view addSubview:_toolBar];
    [_toolBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view);
        make.top.equalTo(_tableView.mas_bottom);
    }];
    
    UILabel* label=[UILabel new];
    label.text=@" ✒ 没事写两句";
    label.textColor=[UIColor grayColor];
    label.font=[UIFont systemFontOfSize:14];
    label.backgroundColor=[UIColor whiteColor];
    label.layer.masksToBounds=YES;
    label.layer.cornerRadius=2;
    
    [_toolBar addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(_toolBar).mas_offset(UIEdgeInsetsMake(8, 10, 8, 10));
    }];
  
    
}

-(void)loadComments{
    NSDictionary* paramDic=@{@"version":@470};
    NSString* newPath=[NSString stringWithFormat:@"%@%ld",APIGetComments,(long)self.articleModel.articleId];
    [[DQAFNetManager sharedManager] requestWithMethod:GET WithPath:newPath WithParams:paramDic WithSuccessBlock:^(NSDictionary *dic) {
        self.commentModel=[DQCommentModel mj_objectWithKeyValues:dic];
        self.normalComments=[DQSingleCommentModel mj_objectArrayWithKeyValuesArray:self.commentModel.comments];
        self.hotComments=[DQSingleCommentModel mj_objectArrayWithKeyValuesArray:self.commentModel.recommends];
        
        [_tableView reloadData];
//        [_tableView.mj_header endRefreshing];
        
    } WithFailurBlock:^(NSError *error) {
        NSLog(@"request error %@",error);
//        [_tableView.mj_header endRefreshing];
    }];
}


#pragma mark TableView delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(UIView* )tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    UIView* headerView=[UIView new];
    headerView.backgroundColor=RGB_Point(0.94, 0.94, 0.94);
    UILabel* title=[UILabel new];
    if (section==0) {
        title.text=[NSString stringWithFormat:@"精彩评论 (%lu)",(unsigned long)self.hotComments.count];
    }
    else{
        title.text=[NSString stringWithFormat:@"最新评论 (%lu)",(unsigned long)self.commentModel.total];
    }
    
    title.font=[UIFont systemFontOfSize:14];
    title.textColor=[UIColor blackColor];
    [headerView addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(headerView);
        make.left.equalTo(headerView).offset(10);
    }];
    return headerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return self.hotComments.count;
    }
    else{
        return self.normalComments.count;
    }
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    DQSingleCommentModel* model;
    if (indexPath.section==0) {
        model=self.hotComments[indexPath.row];
    }
    else{
        model=self.normalComments[indexPath.row];
    }
    
    DQCommentCell* cell=[tableView dequeueReusableCellWithIdentifier:reuseNormalCell];
    [cell configWithModel:model];
    
    return [cell heightForCell]+1;
}

-(UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DQSingleCommentModel* model;
    if (indexPath.section==0) {
        model=self.hotComments[indexPath.row];
    }
    else{
        model=self.normalComments[indexPath.row];
    }
    
    DQCommentCell* cell=[tableView dequeueReusableCellWithIdentifier:reuseNormalCell forIndexPath:indexPath];
    [cell configWithModel:model];
    
    return cell;
}


#pragma mark getter&& setter

-(DQCommentModel* )commentModel{
    if (!_commentModel) {
        _commentModel=[[DQCommentModel alloc]init];
    }
    return _commentModel;
}

-(NSMutableArray* )hotComments{
    if (!_hotComments) {
        _hotComments=[NSMutableArray new];
    }
    return _hotComments;
}

-(NSMutableArray* )normalComments{
    if (!_normalComments) {
        _normalComments=[NSMutableArray new];
    }
    return _normalComments;
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
