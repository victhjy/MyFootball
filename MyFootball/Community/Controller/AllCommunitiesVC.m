//
//  AllCommunitiesVC.m
//  MyFootball
//
//  Created by huangjinyang on 16/9/2.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "AllCommunitiesVC.h"
#import "DQCommunityIconCell.h"
#import "DQCommunityModel.h"
#import "DQCommunityCollectionHeaderView.h"
@interface AllCommunitiesVC ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

{
    UICollectionView *_mainCollectionView;
    NSMutableArray* _foldFlagArr;
}
@property(nonatomic,strong)NSMutableArray*  resultArr;
@property(nonatomic,strong)NSMutableArray <DQCommunitySingleModel * > * groupModel;
@end

@implementation AllCommunitiesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self configCollectionView];
    [self loadData];
    // Do any additional setup after loading the view.
}

-(void)configCollectionView{
    //1.初始化layout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //设置collectionView滚动方向
    //    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    //设置headerView的尺寸大小
    layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 100);
    //该方法也可以设置itemSize
    layout.itemSize =CGSizeMake(110, 150);
    
    //2.初始化collectionView
    _mainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, UIScreenWidth, UIScreenHeight-64-30-49) collectionViewLayout:layout];
    [self.view addSubview:_mainCollectionView];
    _mainCollectionView.backgroundColor = NORMALCOLOR;
    
    //3.注册collectionViewCell
    //注意，此处的ReuseIdentifier 必须和 cellForItemAtIndexPath 方法中 一致 均为 cellId
    [_mainCollectionView registerClass:[DQCommunityIconCell class] forCellWithReuseIdentifier:@"cellId"];
    
    //注册headerView  此处的ReuseIdentifier 必须和 cellForItemAtIndexPath 方法中 一致  均为reusableView
    [_mainCollectionView registerClass:[DQCommunityCollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView"];
    [_mainCollectionView registerClass:[DQCommunityCollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableClickView"];

    //4.设置代理
    _mainCollectionView.delegate = self;
    _mainCollectionView.dataSource = self;
    _foldFlagArr=[@[@1,@0,@0,@0,@0,@0] mutableCopy];
}

-(void)loadData{
    NSArray* arrFromCache=(NSArray* ) [MyTools getCacheDataForKey:@"communityArr"];
    if (arrFromCache) {
        self.resultArr=[NSMutableArray arrayWithArray:arrFromCache];
        [_foldFlagArr removeAllObjects];
        for (int i=0; i<self.resultArr.count+2; i++) {
            if(i==0||i==2){
                [_foldFlagArr addObject:@1];
            }
            else{
                [_foldFlagArr addObject:@0];
            }
        }
        [_mainCollectionView reloadData];
    }
    else{
        [self loadDataRequest];
    }
    
}

-(void)loadDataRequest{
    [[DQAFNetManager sharedManagerAbsoluteUrl]requestWithMethod:GET WithPath:@"https://api.dongqiudi.com/leagues/groups" WithParams:nil WithSuccessBlock:^(NSDictionary *dic) {
        NSArray* arr=(NSArray* )dic;
        self.resultArr=[DQCommunityModel mj_objectArrayWithKeyValuesArray:arr[1]];
        [_foldFlagArr removeAllObjects];
        
        [MyTools cacheData:self.resultArr withKey:@"communityArr"];
        
        for (int i=0; i<self.resultArr.count+2; i++) {
            if(i==0||i==2){
                [_foldFlagArr addObject:@1];
            }
            else{
              [_foldFlagArr addObject:@0];
            }
        }
        [_mainCollectionView reloadData];
        
    } WithFailurBlock:^(NSError *error) {
        DQLog(@"error:%@",error);
    }];
}
#pragma mark collectionView代理方法

//返回section个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.resultArr.count + 2;
}

//每个section的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if ([_foldFlagArr[section] isEqual:@0] ) {
        return 0;
    }
    else{
        if (section==0) {
            return 1;
        }
        else if (section==1){
            return 0;
        }
        else{
            DQCommunityModel* communityModel=self.resultArr[section-2];
           return communityModel.groups_total;
        }
        
    }

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section<1){
        DQCommunityIconCell *cell = (DQCommunityIconCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
        DQCommunityModel* communityModel=self.resultArr[0];
        self.groupModel=[DQCommunitySingleModel mj_objectArrayWithKeyValuesArray:communityModel.groups];
        [cell configWithModel:self.groupModel[indexPath.row]];
        return cell;
    }
    else {
        DQCommunityIconCell *cell = (DQCommunityIconCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
        DQCommunityModel* communityModel=self.resultArr[indexPath.section-2];
        self.groupModel=[DQCommunitySingleModel mj_objectArrayWithKeyValuesArray:communityModel.groups];
        [cell configWithModel:self.groupModel[indexPath.row]];
        
        return cell;
    }
}

//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((UIScreenWidth-30)/2, (UIScreenWidth-30)/4);
}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if ([_foldFlagArr[section] isEqual:@0]) {
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
    else{
       return UIEdgeInsetsMake(10, 10, 10, 10);
    }
    
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}


//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}


//通过设置SupplementaryViewOfKind 来设置头部或者底部的view，其中 ReuseIdentifier 的值必须和 注册是填写的一致，本例都为 “reusableView”
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0||indexPath.section==1) {
        DQCommunityCollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView" forIndexPath:indexPath];
        headerView.backgroundColor =[UIColor lightGrayColor];
        headerView.textLabel.text = indexPath.section==0?@"关注(1)":@"全部";
        return headerView;
    }
    else{
    DQCommunityCollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableClickView" forIndexPath:indexPath];
    headerView.backgroundColor =NORMALCOLOR;
    
        DQCommunityModel* communityModel=self.resultArr[indexPath.section-2];
    headerView.textLabel.text = [NSString stringWithFormat:@"%@(%zd)",communityModel.name,communityModel.groups_total];
    headerView.userInteractionEnabled=YES;
    headerView.tag=1000+indexPath.section;
    UITapGestureRecognizer* gesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(foldOrSpread:)];
    [headerView addGestureRecognizer:gesture];
    return headerView;
    }
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section==0||section==1) {
        return CGSizeMake(UIScreenWidth, 20);
    }
    else{
       return CGSizeMake(UIScreenWidth, 30);
    }
    
}


//点击item方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    DQCommunityIconCell *cell = (DQCommunityIconCell *)[collectionView cellForItemAtIndexPath:indexPath];
    NSLog(@"%@",indexPath);
}


#pragma mark - privateMethod

-(void)foldOrSpread:(UIGestureRecognizer * )sender{
    if ([_foldFlagArr[sender.view.tag-1000] isEqual:@0]) {
        [_foldFlagArr replaceObjectAtIndex:sender.view.tag-1000 withObject:@1];
        [_mainCollectionView reloadSections:[NSIndexSet indexSetWithIndex:sender.view.tag-1000]];
    }
    else{
        [_foldFlagArr replaceObjectAtIndex:sender.view.tag-1000 withObject:@0];
        [_mainCollectionView reloadSections:[NSIndexSet indexSetWithIndex:sender.view.tag-1000]];
    }
}
@end
