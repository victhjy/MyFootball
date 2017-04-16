//
//  HJYSTMainVC.m
//  MyFootball
//
//  Created by huangjinyang on 17/3/27.
//  Copyright © 2017年 huangjinyang. All rights reserved.
//

#import "HJYSTMainVC.h"

@interface HJYSTMainVC ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray*  _tags;
    CGRect _frame;
    UITableView* _leftTableView;
    NSInteger selectLine;
    
    UITableView* _dataTableView;
    NSMutableArray* _dataArr;
}
@end

@implementation HJYSTMainVC

-(instancetype)initWithLines:(NSMutableArray* )tags andFrame:(CGRect)frame{
    if (self=[super init]) {
        _tags=tags;
        _frame=frame;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout=UIRectEdgeNone;
    [self initSubViews];
    selectLine=0;
    _dataArr=[NSMutableArray arrayWithArray:@[@1]];
    // Do any additional setup after loading the view.
}

-(void)initSubViews{
    _leftTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, _frame.size.width/5, _frame.size.height-64) style:UITableViewStylePlain];
    _leftTableView.delegate=self;
    _leftTableView.dataSource=self;
    _leftTableView.tableFooterView=[UIView new];
    _leftTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    _leftTableView.backgroundColor=[MyTools colorWithHexString:@"0x2d2d2d"];
    _leftTableView.scrollsToTop=NO;
    _leftTableView.showsVerticalScrollIndicator=NO;
    [self.view addSubview:_leftTableView];
    
    _dataTableView=[[UITableView alloc]initWithFrame:CGRectMake(_frame.size.width/5, 0, _frame.size.width/5*4, _frame.size.height-64) style:UITableViewStylePlain];
    _dataTableView.delegate=self;
    _dataTableView.dataSource=self;
    _dataTableView.scrollsToTop=YES;
    _dataTableView.tableFooterView=[UIView new];
    _dataTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
//    _dataTableView.backgroundColor=[MyTools colorWithHexString:@"0x2d2d2d"];
    [self.view addSubview:_dataTableView];
}

#pragma mark - UITableView 

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView==_dataTableView) {
        return 1;
    }
    else{
        return 1;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView==_dataTableView) {
        return _dataArr.count;
    }
    else{
        return _tags.count;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==_dataTableView) {
        UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"dataCell"];
        if (!cell) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"dataCell"];
        }
//        cell.contentView.backgroundColor=indexPath.row==selectLine?ThemeColor:tableView.backgroundColor;
        cell.textLabel.text=[NSString stringWithFormat:@"%ld ===== %ld",_dataArr.count,indexPath.row];
        cell.textLabel.textColor=[UIColor redColor];
        cell.textLabel.textAlignment=1;
        cell.centerX=cell.contentView.centerX;
        return cell;
    }
    else{
        UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        cell.contentView.backgroundColor=indexPath.row==selectLine?ThemeColor:tableView.backgroundColor;
        cell.textLabel.text=[NSString stringWithFormat:@"%ld",indexPath.row];
        cell.textLabel.textColor=[UIColor lightTextColor];
        cell.textLabel.textAlignment=1;
        cell.centerX=cell.contentView.centerX;
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    if (cell.selectionStyle != UITableViewCellSelectionStyleNone) {
//        [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    }
    if (tableView==_dataTableView) {
        
    }
    else{
        [_dataArr removeAllObjects];
        selectLine=indexPath.row;
        for (int i=0; i<selectLine*5;i++ ) {
            [_dataArr addObject:@"1"];
        }
        
        
        [tableView reloadData];
        [_dataTableView reloadData];
    }
}


@end
