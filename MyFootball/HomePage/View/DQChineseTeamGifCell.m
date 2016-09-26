//
//  DQChineseTeamGifCell.m
//  MyFootball
//
//  Created by huangjinyang on 16/9/25.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//
#define itemViewW 150
#define itemViewH 170
#import "DQChineseTeamGifCell.h"

@implementation DQChineseTeamGifCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
        self.contentView.backgroundColor=[MyTools colorWithHexString:@"0xf4f3f4"];
        self.contentView.autoresizingMask=UIViewAutoresizingNone;
    }
    return self;
}


-(void)createUI{
    [self.contentView addSubview:self.titleLable];
    [self.contentView addSubview:self.mainScrollView];
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView).offset(10);
        make.height.equalTo(@20);
    }];
    [self.mainScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLable.mas_bottom);
        make.left.right.equalTo(self.contentView);
        make.height.equalTo(@180);
    }];
}

-(void)configViewWithModel:(DQChineseTeamListModel* )model{
    self.titleLable.text=model.title;
    self.itemModelArr=[DQChineseTeamSubItemModel mj_objectArrayWithKeyValuesArray:model.sub_items[@"archives"]];
    self.mainScrollView.contentSize=CGSizeMake(self.itemModelArr.count*(itemViewW+10)+20, 0);
    

    
    for (int i=0;i<self.itemModelArr.count;i++) {
        DQChineseTeamSubItemModel* itemModel=self.itemModelArr[i];
        DQGifCellItemView* itemView=[[DQGifCellItemView alloc]init];
        itemView.autoresizingMask=0;
        [itemView configWithItemModel:itemModel];
        [self.mainScrollView addSubview:itemView];
        itemView.frame=CGRectMake(10+i*(itemViewW+10), 10, itemViewW, itemViewH);
    }
    
    [self updateConstraints];
    [self layoutSubviews];
}

- (void)prepareForReuse{
    //清除复用的scrollView中的itemView
    for (UIView* subView in self.mainScrollView.subviews) {
        if ([subView isKindOfClass:[DQGifCellItemView class]]) {
            [subView removeFromSuperview];
        }
    }
    
    //复用cell时把scrollView的x轴滚动放到最左边
    [self.mainScrollView setContentOffset:CGPointMake(0,0) animated:NO];
}

-(UILabel*)titleLable
{
    if(!_titleLable)
    {
        _titleLable=[UILabel new];
        _titleLable.font=[UIFont systemFontOfSize:14];
    }
    return _titleLable;
}

-(UIScrollView*)mainScrollView
{
    if(!_mainScrollView)
    {
        _mainScrollView=[UIScrollView new];
        _mainScrollView.showsHorizontalScrollIndicator=NO;
    }
    return _mainScrollView;
}

//-(DQGifCellItemView*)itemView
//{
//    if(!_itemView)
//    {
//        _itemView=[DQGifCellItemView new];
//    }
//    return _itemView;
//}

@end
