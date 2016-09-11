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
@interface DQCommentsViewController ()<UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,strong)UIToolbar* toolBar;
@property(nonatomic,strong)NSMutableArray* hotComments;
@property(nonatomic,strong)NSMutableArray* normalComments;
@property(nonatomic,strong)DQCommentModel* commentModel;
@end

@implementation DQCommentsViewController
static NSString* reuseNormalCell=@"reuseNormalCell";
static NSString* reuseImageCell=@"reuseIamgeCell";
static NSString* reuseCommentInCommentAndImageCell=@"reuseCommentInCommentAndImageCell";
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
    _tableView.emptyDataSetSource=self;
    _tableView.emptyDataSetDelegate=self;
    _tableView.tableFooterView=[UIView new];
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).mas_offset(UIEdgeInsetsMake(0, 0, 50, 0));
    }];
    [_tableView registerClass:[DQCommentCell class] forCellReuseIdentifier:reuseNormalCell];
    [_tableView registerClass:[DQCommentCell class] forCellReuseIdentifier:reuseImageCell];
    [_tableView registerClass:[DQCommentCell class] forCellReuseIdentifier:reuseCommentInCommentCell];
    [_tableView registerClass:[DQCommentCell class] forCellReuseIdentifier:reuseCommentInCommentAndImageCell];
    
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
    
    __weak typeof(self) weakself=self;
    _tableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakself loadComments];
    }];
    _tableView.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakself loadMoreComments];
    }];
    _tableView.mj_footer.automaticallyHidden=YES;
    
}

#pragma mark Request

-(void)loadComments{
    NSDictionary* paramDic=@{@"version":@470};
    NSString* newPath=[NSString stringWithFormat:@"%@%ld",APIGetComments,(long)self.articleModel.articleId];
    [[DQAFNetManager sharedManager] requestWithMethod:GET WithPath:newPath WithParams:paramDic WithSuccessBlock:^(NSDictionary *dic) {
        self.commentModel=[DQCommentModel mj_objectWithKeyValues:dic];
        self.normalComments=[DQSingleCommentModel mj_objectArrayWithKeyValuesArray:self.commentModel.comments];
        self.hotComments=[DQSingleCommentModel mj_objectArrayWithKeyValuesArray:self.commentModel.recommends];
        
        [_tableView reloadData];
        [_tableView.mj_header endRefreshing];
        
    } WithFailurBlock:^(NSError *error) {
        NSLog(@"request error %@",error);
        [_tableView.mj_header endRefreshing];
    }];
}

-(void)loadMoreComments{
    
    [[DQAFNetManager sharedManagerAbsoluteUrl] requestWithMethod:GET WithPath:self.commentModel.next WithParams:nil WithSuccessBlock:^(NSDictionary *dic) {
        self.commentModel=[DQCommentModel mj_objectWithKeyValues:dic];
        
        NSArray* newArr=[DQSingleCommentModel mj_objectArrayWithKeyValuesArray:self.commentModel.comments];
        if (newArr.count>0) {
            [self.normalComments addObjectsFromArray:newArr];
            [_tableView reloadData];
             [_tableView.mj_footer endRefreshing];
        }else{
            [_tableView.mj_footer endRefreshingWithNoMoreData];
        }

    } WithFailurBlock:^(NSError *error) {
        NSLog(@"request error %@",error);
        [_tableView.mj_footer endRefreshing];
    }];
}

#pragma mark TableView delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.hotComments.count>0) {
        return 2;
    }else if(self.normalComments.count>0){
        return 1;
    }else{
        return 0;
    }
}

-(UIView* )tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    UIView* headerView=[UIView new];
    headerView.backgroundColor=RGB_Point(0.94, 0.94, 0.94);
    UILabel* title=[UILabel new];
    if (section==0) {
        title.text=self.hotComments.count>0?[NSString stringWithFormat:@"精彩评论 (%lu)",(unsigned long)self.hotComments.count]:[NSString stringWithFormat:@"最新评论 (%lu)",(unsigned long)self.commentModel.total];
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
    if (section==0||section==1) {
        return 30;
    }
    else{
        return 0.0000000001;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        if (self.hotComments.count>0) {
            return self.hotComments.count;
        }
        else{
            return self.normalComments.count;
        }
        
    }
    else if(section==1){
        return self.normalComments.count;
    }
    else{
        return 0;
    }
}

//使用估算高度后headerViewInSection在上拉加载更多后会不准确
//-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 80;
//}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    DQSingleCommentModel* model;
    if (indexPath.section==0) {
        if (self.hotComments.count>0) {
            model=self.hotComments[indexPath.row];
        }
        else{
            model=self.normalComments[indexPath.row];
        }
        
    }
    else{
        model=self.normalComments[indexPath.row];
    }
    
    DQCommentCell* cell;
    //only recomment
    if (model.quote&&!model.attachments_total) {
        cell=[tableView dequeueReusableCellWithIdentifier:reuseCommentInCommentCell];
    }
    //recomment && image
    else if (model.quote&&model.attachments_total){
        cell=[tableView dequeueReusableCellWithIdentifier:reuseCommentInCommentAndImageCell];
    }
    //normal comment && image
    else if (!model.quote&&model.attachments_total){
        cell=[tableView dequeueReusableCellWithIdentifier:reuseImageCell];
    }
    //normal
    else{
        cell=[tableView dequeueReusableCellWithIdentifier:reuseNormalCell];
    }

    [cell configWithModel:model];
    
    return [cell heightForCell]+1;
}

-(UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DQSingleCommentModel* model;
    DQCommentCell* cell;
   
    if (indexPath.section==0) {
        if (self.hotComments.count>0) {
            model=self.hotComments[indexPath.row];
        }
        else{
            model=self.normalComments[indexPath.row];
        }
        
    }
    else{
        model=self.normalComments[indexPath.row];
    }
    
    //only recomment
    if (model.quote&&!model.attachments_total) {
        cell=[tableView dequeueReusableCellWithIdentifier:reuseCommentInCommentCell forIndexPath:indexPath];
    }
    //recomment && image
    else if (model.quote&&model.attachments_total){
        cell=[tableView dequeueReusableCellWithIdentifier:reuseCommentInCommentAndImageCell forIndexPath:indexPath];
    }
    //normal comment && image
    else if (!model.quote&&model.attachments_total){
        cell=[tableView dequeueReusableCellWithIdentifier:reuseImageCell forIndexPath:indexPath];
    }
    //normal
    else{
        cell=[tableView dequeueReusableCellWithIdentifier:reuseNormalCell forIndexPath:indexPath];
    }
     cell.selectionStyle=UITableViewCellSelectionStyleNone;
    [cell configWithModel:model];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark DZNEmpty

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIImage imageNamed:@"2016"];
    
}

-(NSAttributedString* )titleForEmptyDataSet:(UIScrollView *)scrollView{
    NSString* text=@"HJYDQD Tell You \n No More Data";
    return [[NSAttributedString alloc]initWithString:text attributes:nil];
}

- (void)emptyDataSetWillDisappear:(UIScrollView *)scrollView{
    
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
