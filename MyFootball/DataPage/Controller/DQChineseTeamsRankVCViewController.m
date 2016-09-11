//
//  DQChineseTeamsRankVCViewController.m
//  MyFootball
//
//  Created by huangjinyang on 16/9/11.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "DQChineseTeamsRankVCViewController.h"

@interface DQChineseTeamsRankVCViewController ()
@property(nonatomic,strong)UISegmentedControl* segment;
@end

@implementation DQChineseTeamsRankVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[MyTools colorWithHexString:@"0x4b4b4b"];
    self.segment.backgroundColor=[MyTools colorWithHexString:@"0x4b4b4b"];
    self.segment.tintColor=[MyTools colorWithHexString:@"0x2d2d2d"];
    self.segment.selectedSegmentIndex=0;
    // Do any additional setup after loading the view.
}


#pragma mark - getter&&setter

-(UISegmentedControl* )segment{
    if (!_segment) {
        _segment=[[UISegmentedControl alloc]initWithItems:[NSArray arrayWithObjects:@"积分",@"射手",@"助攻",@"赛程", nil]];
        [self.view addSubview:_segment];
        [_segment mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self.view).offset(10);
            make.right.equalTo(self.view).offset(-10);
            make.height.mas_offset(30);
        }];
    }
    return _segment;
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
