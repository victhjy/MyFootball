//
//  DQDoubleTable.m
//  MyFootball
//
//  Created by huangjinyang on 17/4/13.
//  Copyright © 2017年 huangjinyang. All rights reserved.
//

#define WIDTHSCALE 6

#import "DQDoubleTable.h"

@implementation DQDoubleTable

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style leftItem:(NSMutableArray *)left rightItem:(NSMutableArray *)right{
    CGFloat leftWidth=frame.size.width/WIDTHSCALE;
    CGRect leftFrame=CGRectMake(frame.origin.x, frame.origin.y,leftWidth , frame.size.height);
    CGRect rightFrame=CGRectMake(leftWidth, frame.origin.y, frame.size.width-leftWidth, frame.size.height);
    
    if (self=[super initWithFrame:rightFrame style:style]) {
        _leftItems=left;
        _rightItems=right;
        
        _leftTable=[[UITableView alloc]initWithFrame:leftFrame style:style];
        _leftTable.delegate=self;
        _leftTable.dataSource=self;
        _leftTable.tableFooterView=[UIView new];
        _leftTable.separatorStyle=UITableViewCellSeparatorStyleNone;
        _leftTable.backgroundColor=[MyTools colorWithHexString:@"0x2d2d2d"];
//        _leftTable.backgroundColor=[UIColor redColor];
        _leftTable.scrollsToTop=NO;
        _leftTable.showsVerticalScrollIndicator=NO;
    }
    return self;
}

-(void)addLeftTable{
    [self.superview addSubview:_leftTable];
}

#pragma mark - UITabelView Delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _leftItems.count;
}

-(UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
//    cell.contentView.backgroundColor=indexPath.row==selectLine?ThemeColor:tableView.backgroundColor;
    cell.textLabel.text=[NSString stringWithFormat:@"%ld",indexPath.row];
    cell.textLabel.textColor=[UIColor redColor];
    cell.textLabel.textAlignment=1;
    cell.centerX=cell.contentView.centerX;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self reloadData];
}



@end
