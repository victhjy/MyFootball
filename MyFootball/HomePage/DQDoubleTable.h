//
//  DQDoubleTable.h
//  MyFootball
//
//  Created by huangjinyang on 17/4/13.
//  Copyright © 2017年 huangjinyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DQDoubleTable : UITableView <UITableViewDelegate,UITableViewDataSource>

{
    UITableView* _leftTable;
    NSInteger _currentItem; ///<当前选中  默认为0
}

@property(nonatomic,strong)NSMutableArray* leftItems;

@property(nonatomic,strong)NSMutableArray* rightItems;

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style leftItem:(NSMutableArray* )left rightItem:(NSMutableArray* )right;

-(void)addLeftTable;

@end
