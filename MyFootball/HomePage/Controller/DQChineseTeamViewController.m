//
//  DQChineseTeamViewController.m
//  MyFootball
//
//  Created by huangjinyang on 16/9/5.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "DQChineseTeamViewController.h"

@interface DQChineseTeamViewController ()

@end

@implementation DQChineseTeamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    UILabel* l1=[UILabel new];
    l1.text=@"国足";
    l1.textAlignment=1;
    [self.view addSubview:l1];
    [l1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(100);
        make.centerY.mas_equalTo(self.view.mas_centerY);
        make.centerX.mas_equalTo(self.view.mas_centerX);
    }];
    
    
    // Do any additional setup after loading the view.
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
