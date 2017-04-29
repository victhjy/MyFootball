//
//  DQShipViewController.m
//  MyFootball
//
//  Created by huangjinyang on 16/9/5.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "DQShipVC.h"

@interface DQShipVC ()
{
    UIImageView* huaji;
    UIImageView* xiong;
}

@end

@implementation DQShipVC


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
    [self createHuaji];
    
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self createHuaji];
}

#pragma mark - 创建悬浮的按钮

- (void)createButton{
    
//    _window = [UIApplication sharedApplication].windows[0];
    
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [_button setTitle:@"按钮" forState:UIControlStateNormal];
    
    _button.frame = CGRectMake(UIScreenWidth - 70, UIScreenHeight - 150, 60, 60);
    _button.center=self.view.center;
    
    _button.titleLabel.font = [UIFont systemFontOfSize:13.0f];
    
    [_button setBackgroundColor:[UIColor orangeColor]];
    
    _button.layer.cornerRadius = 10;
    
    _button.layer.masksToBounds = YES;
    
    [_button addTarget:self action:@selector(resignButton) forControlEvents:UIControlEventTouchUpInside];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    animation.duration = 0.2;
    animation.removedOnCompletion = YES;
    animation.fillMode = kCAFillModeForwards;
    animation.repeatCount = MAX_CANON;
    int direction = arc4random() % 2;
    if (direction == 0) {
        animation.values = @[@(0),@(-M_PI / 90),@(0),@(M_PI / 90),@(0)];
    }else{
        animation.values = @[@(0),@(M_PI / 90),@(0),@(-M_PI / 90),@(0)];
    }
    [_button.layer addAnimation:animation forKey:@"animation"];
    
    [self.view addSubview:_button];
    
    
    //放一个拖动手势，用来改变控件的位置
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(changePostion:)];
    _button.tag=1001;
    [_button addGestureRecognizer:pan];
    
}

- (void)resignButton{
    
    if (huaji.layer.animationKeys.count>0) {
        [huaji.layer removeAllAnimations];
        [xiong.layer removeAllAnimations];
    }
    else{
        [self createHuaji];
    }
}


#pragma mark - CreateHuaji

-(void)createHuaji{
    if (!huaji) {
        huaji=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"huaji"]];
    }
    [self.view addSubview:huaji];
    huaji.frame=CGRectMake(0, 0, 100, 100);
    huaji.center=self.view.center;
//    huaji.y-=100;
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    animation.duration = 0.2;
    animation.removedOnCompletion = YES;
    animation.fillMode = kCAFillModeForwards;
    animation.repeatCount = MAX_CANON;
    int direction = arc4random() % 2;
    if (direction == 0) {
        animation.values = @[@(0),@(-M_PI / 9),@(0),@(M_PI / 9),@(0)];
    }else{
        animation.values = @[@(0),@(M_PI / 9),@(0),@(-M_PI / 9),@(0)];
    }
    [huaji.layer addAnimation:animation forKey:@"animation"];
    
    
    if (!xiong) {
        xiong=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"xiong"]];
    }
    
    [self.view addSubview:xiong];
    xiong.frame=CGRectMake(0, 0, 100, 100);
    xiong.center=self.view.center;
    xiong.y-=150;
    
    CAKeyframeAnimation *animationx = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    animationx.duration = 0.8;
    animationx.removedOnCompletion = YES;
    animationx.fillMode = kCAFillModeForwards;
    animationx.repeatCount = MAX_CANON;
    int directionx = arc4random() % 2;
    if (directionx == 0) {
        animationx.values = @[@(0),@(-M_PI / 50),@(0),@(M_PI / 50),@(0)];
    }else{
        animationx.values = @[@(0),@(M_PI / 50),@(0),@(-M_PI / 50),@(0)];
    }
    [xiong.layer addAnimation:animation forKey:@"animation"];
    
    
    xiong.userInteractionEnabled=YES;
    huaji.userInteractionEnabled=YES;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(changePostion:)];
    UIPanGestureRecognizer *pan2 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(changePostion:)];
    xiong.tag=1002;
    [xiong addGestureRecognizer:pan2];
    
    huaji.tag=1003;
    [huaji addGestureRecognizer:pan];
}
//手势事件 －－ 改变位置

-(void)changePostion:(UIPanGestureRecognizer *)pan{
    if (pan.view.tag==1001) {
        
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
    else if (pan.view.tag==1002){
       CGPoint point = [pan translationInView:xiong];
        CGRect oldFrame=xiong.frame;
        if (oldFrame.origin.x>=0&&oldFrame.origin.x+xiong.width<=UIScreenWidth) {
            oldFrame.origin.x+=point.x;
        }
        if (oldFrame.origin.y>=64&&oldFrame.origin.y+xiong.height<=UIScreenHeight) {
            oldFrame.origin.y+=point.y;
        }
        xiong.frame=oldFrame;
        [pan setTranslation:CGPointZero inView:xiong];
        
        if (pan.state != UIGestureRecognizerStateBegan&&pan.state != UIGestureRecognizerStateChanged) {
            CGRect frame = xiong.frame;
            BOOL isOver=NO;
            if (frame.origin.x<0) {
                frame.origin.x=0;
                isOver=YES;
            }
            if (frame.origin.y<64) {
                frame.origin.y=64;
                isOver=YES;
            }
            if (frame.origin.x+xiong.width>UIScreenWidth) {
                frame.origin.x=UIScreenWidth-+xiong.width;
                isOver=YES;
            }
            if (frame.origin.y+xiong.height>UIScreenHeight) {
                frame.origin.y=UIScreenHeight-xiong.height;
                isOver=YES;
            }
            if (isOver) {
                [UIView animateWithDuration:0.3 animations:^{
                    
                    xiong.frame = frame;
                    
                }];
            }
        }
        
        if(pan.state==UIGestureRecognizerStateBegan){
            xiong.userInteractionEnabled=NO;
        }
        else{
            xiong.userInteractionEnabled=YES;
        }
        NSLog(@"2");
    }
    else{
        NSLog(@"3");
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
