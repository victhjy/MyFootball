//
//  DQShipViewController.m
//  MyFootball
//
//  Created by huangjinyang on 16/9/5.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "DQShipViewController.h"

@interface DQShipViewController ()

@end

@implementation DQShipViewController


{
    UIWindow* _window;
    UIButton* _button;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
//    UILabel* l1=[UILabel new];
//    l1.text=@"懂球号";
    
//    [self.view addSubview:l1];
//    l1.textAlignment=1;
//    [l1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo(30);
//        make.width.mas_equalTo(100);
//        make.centerY.mas_equalTo(self.view.mas_centerY);
//        make.centerX.mas_equalTo(self.view.mas_centerX);
//    }];
    
    [self performSelector:@selector(createButton) withObject:nil afterDelay:0];
    
    // Do any additional setup after loading the view.
}


#pragma mark - 创建悬浮的按钮

- (void)createButton{
    
    _window = [UIApplication sharedApplication].windows[0];
    
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [_button setTitle:@"按钮" forState:UIControlStateNormal];
    
    _button.frame = CGRectMake(UIScreenWidth - 70, UIScreenHeight - 150, 60, 60);
    
    _button.titleLabel.font = [UIFont systemFontOfSize:13.0f];
    
    [_button setBackgroundColor:[UIColor orangeColor]];
    
    _button.layer.cornerRadius = 30;
    
    _button.layer.masksToBounds = YES;
    
    [_button addTarget:self action:@selector(resignButton) forControlEvents:UIControlEventTouchUpInside];
    
    //    _window = [[UIWindow alloc]initWithFrame:CGRectMake(kSize_width - 70, kSize_height - 150, 50, 50)];
    
    //    _window.windowLevel = UIWindowLevelAlert+1;
    
    //    _window.backgroundColor = [UIColor greenColor];
    
    //    _window.layer.cornerRadius = 25;
    
    //    _window.layer.masksToBounds = YES;
    
    [_window addSubview:_button];
    
    //    [_window makeKeyAndVisible];//显示window
    
    //放一个拖动手势，用来改变控件的位置
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(changePostion:)];
    
    [_button addGestureRecognizer:pan];
    
}

- (void)resignButton{
    
}

//手势事件 －－ 改变位置

-(void)changePostion:(UIPanGestureRecognizer *)pan{
    
    CGPoint point = [pan translationInView:_button];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    CGRect originalFrame = _button.frame;
    
    if (originalFrame.origin.x >= 0 && originalFrame.origin.x+originalFrame.size.width <= width) {
        
        originalFrame.origin.x += point.x;
        
    }if (originalFrame.origin.y >= 64 && originalFrame.origin.y+originalFrame.size.height <= height) {
        
        originalFrame.origin.y += point.y;
        
    }
    
    _button.frame = originalFrame;
    
    [pan setTranslation:CGPointZero inView:_button];
    
    if (pan.state == UIGestureRecognizerStateBegan) {
        
        _button.enabled = NO;
        
    }else if (pan.state == UIGestureRecognizerStateChanged){
        
    } else {
        
        CGRect frame = _button.frame;
        
        //是否越界
        
        BOOL isOver = NO;
        
        if (frame.origin.x < 0) {
            
            frame.origin.x = 0;
            
            isOver = YES;
            
        } else if (frame.origin.x+frame.size.width > width) {
            
            frame.origin.x = width - frame.size.width;
            
            isOver = YES;
            
        }if (frame.origin.y < 64) {
            
            frame.origin.y = 64;
            
            isOver = YES;
            
        } else if (frame.origin.y+frame.size.height > height) {
            
            frame.origin.y = height - frame.size.height;
            
            isOver = YES;
            
        }if (isOver) {
            
            [UIView animateWithDuration:0.3 animations:^{
                
                _button.frame = frame;
                
            }];
            
        }
        
        if(_button.x+_button.width/2>UIScreenWidth/2){
            frame.origin.x=UIScreenWidth-_button.width;
        }
        else{
            frame.origin.x=0;
        }
        [UIView animateWithDuration:0.3 animations:^{
            
            _button.frame = frame;
            
        }];

        _button.enabled = YES;
        
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
