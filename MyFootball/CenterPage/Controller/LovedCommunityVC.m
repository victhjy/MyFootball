//
//  LovedCommunityVC.m
//  MyFootball
//
//  Created by huangjinyang on 16/9/2.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "LovedCommunityVC.h"

@interface LovedCommunityVC ()
@property(nonatomic,strong)UIImageView* shadowImage;
@end

@implementation LovedCommunityVC
{
    UIButton* _animationButton;
    CGFloat _height;
    UIView* _headerView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSArray *subViews = allSubviews(self.navigationController.navigationBar);
    for (UIView *view in subViews) {
        if ([view isKindOfClass:[UIImageView class]] && view.bounds.size.height<1){
            //实践后发现系统的横线高度为0.333
            self.shadowImage =  (UIImageView *)view;
        }
    }
    self.shadowImage.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.shadowImage.hidden = NO;
}

NSArray *allSubviews(UIView *aView){
    NSArray *results = [aView subviews];
    for (UIView *eachView in aView.subviews)
    {
        NSArray *subviews = allSubviews(eachView);
        if (subviews)
            results = [results arrayByAddingObjectsFromArray:subviews];
    }
    return results;
}

-(void)initUI{
    self.view.backgroundColor=[UIColor whiteColor];
    self.title=@"动画";
    _height=20;
    _animationButton=[[UIButton alloc]init];
    _animationButton.backgroundColor=ThemeColor;
    [_animationButton addTarget:self action:@selector(move) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_animationButton];
    [_animationButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(20, _height));
    }];
    
    _headerView=[UIView new];
    _headerView.backgroundColor=ThemeColor;
    _headerView.alpha=0.87;
    [self.view addSubview:_headerView];
    _headerView.hidden=YES;
}

-(void)move{
    if (_headerView.hidden) {
        _headerView.hidden=NO;
        _headerView.frame=CGRectMake(0, 64, UIScreenWidth, 0);
        
        [_animationButton mas_updateConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
        [self.view setNeedsUpdateConstraints];
        [self.view updateConstraintsIfNeeded];
        [UIView animateWithDuration:0.5 animations:^{
            _headerView.height=100;
            [self.view layoutSubviews];
        } completion:^(BOOL finished) {
            
        }];
        [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
    }else{
        [UIView animateWithDuration:0.5 animations:^{
            _headerView.height=0;
        } completion:^(BOOL finished) {
            _headerView.hidden=YES;
            
            [_animationButton mas_updateConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(50, 50));
            }];
            [self.view setNeedsUpdateConstraints];
            [self.view updateConstraintsIfNeeded];
            [UIView animateWithDuration:0.5 animations:^{
                [self.view layoutSubviews];
            }];
        }];
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];

    }
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
